# add train1K.txt & test100.txt
# add network_ALL_smax_args.yaml

# ssh -X gliese
# source slayer.sh
# cd ~/Documents/chip_spikeclassifier

#CUDA_VISIBLE_DEVICES=3 python snn_ali.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl1_auto_nospkfilter_sorted/oneperiod/ --epochs 500 --hidden_size 512 --num_classes 6 --batch_size 1 --tmax_ms 400 --Ts 1 --kfolds 6 --cache yes 

"""
Train Feedforward SN using Surrogate Gradient
Texture recognition using tacile sensors
Author: Ali Safa - IMEC- KU Leuven, Federico Corradi - IMEC-NL
Modified by: Mark Alea - KU Leuven
"""
import sys, os
CURRENT_TEST_DIR = os.getcwd()
sys.path.append(CURRENT_TEST_DIR + "/../../src")

import numpy as np
#from eNetworks import mini_eCNN
from eNetworks import mini_eMLP
import torch.nn as nn
import torch
from torch.utils.data import TensorDataset, Dataset, DataLoader, ConcatDataset
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
from torch.optim.lr_scheduler import StepLR
from sklearn.utils import shuffle
from sklearn.model_selection import KFold

import tonic
from tonic import CachedDataset

# from: https://synsense.gitlab.io/aermanager/api.html#module-aermanager.preprocess
from aermanager.aerparser import load_events_from_file
from aermanager.parsers import parse_nmnist
from aermanager.preprocess import accumulate_frames
from aermanager.preprocess import slice_by_time
from aermanager.preprocess import slice_by_count

import slayerSNN as snn


import argparse

path = os.getcwd()
parser = argparse.ArgumentParser("Ali Safa's Surrogate Gradient Training with cross-entropy loss (For REAL chip spikes)")
parser.add_argument("--datasetPath",type=str,help="Dataset path", required=True)
parser.add_argument("--epochs",type=int,help="No. of epochs of training",required=True)
parser.add_argument("--hidden_size",type=int,help="MLP hidden size",required=True)
parser.add_argument("--ch_size",type=int,help="No. of input channels",required=False)
parser.add_argument("--x_size",type=int,help="Input x-dim",required=False)
parser.add_argument("--y_size",type=int,help="Input y-dim",required=False)
parser.add_argument("--num_classes",type=int,help="No. of output classes", required=True)
parser.add_argument("--batch_size",type=int,help="Training batch size",required=True)
parser.add_argument("--lr",type=float,help="Learning rate",required=False)
parser.add_argument("--tmax_ms",type=float,help="Maximum sensor recording considered",required=True)
parser.add_argument("--Ts",type=float,help="Sampling time",required=True)
parser.add_argument("--show_inputspikes",type=str,help="Visualize input spikes",required=False)
parser.add_argument("--retrain",type=int,help="Re-train existing network. Enter number of epochs",required=False)
parser.add_argument("--kfolds",type=int,help="No. of k-folds",required=True)
parser.add_argument("--save_bestmodel",type=str,help="Save best model and run k-fold with it",required=False)
parser.add_argument("--cache",type=str,help="Cache dataset for faster access",required=True)

args = parser.parse_args()

# Hyper-parameters - match orig example
if args.ch_size:
    ch_size = args.ch_size
else:
    ch_size = 2

if args.x_size:
    x_size = args.x_size
else:
    x_size = 16

if args.y_size:
    y_size = args.y_size
else:
    y_size = 12

input_size = ch_size*x_size*y_size # 2*34*34
hidden_size = args.hidden_size 
num_classes = args.num_classes
num_epochs = args.epochs
batch_size = args.batch_size
print('hidden_size')
print(hidden_size)
print('num_classes')
print(num_classes)
print('batch_size')
print(batch_size)
if args.lr:
    learning_rate = args.lr
else:
    learning_rate = 1e-3


extraPath =  'epochs-' + str(args.epochs) + '-input_size-' + str(ch_size) + '-' + str(x_size) + '-' + str(y_size) + '-hidden_size-' + str(args.hidden_size) + '-batch_size-' + str(args.batch_size) + '-lr-' + str(learning_rate) + '-tmax_ms-' + str(args.tmax_ms) + '-Ts-' + str(args.Ts) + "-kfolds-" + str(args.kfolds) 

sampleFile_train = args.datasetPath + "train1K.txt"
sampleFile_test = args.datasetPath + "test100.txt"
savePath = path + "/TrainedALL_" + extraPath

print(args.datasetPath)
print(savePath)
mode=0o777
if os.path.exists(savePath) == False:
    os.mkdir(savePath)

netParams = snn.params('network_ALL_smax_args.yaml')
netParams['simulation']['Ts'] = args.Ts
netParams['simulation']['tSample'] = args.tmax_ms
netParams['training']['path']['in'] = args.datasetPath
netParams['training']['path']['train'] = sampleFile_train
netParams['training']['path']['test'] = sampleFile_test



# Dataset definition
class SpkDataset_toFrameTimeBins(Dataset):
    def __init__(self, datasetPath, sampleFile, samplingTime):
        self.path = datasetPath 
        self.samples = np.loadtxt(sampleFile).astype('int')
        self.samplingTime = float(samplingTime)

    def __getitem__(self, index):
        inputIndex  = self.samples[index, 0]
        classLabel  = self.samples[index, 1]

        shape, xytp = load_events_from_file(self.path+str(inputIndex.item())+".bs2",parser=parse_nmnist)
	# shape assumes DVS. Change to actual sensor size
        shape = (x_size,y_size)

	# note: wiki is outdated. Check HOWTO for correct code
        sliced_xytp = slice_by_time_md(xytp=xytp, time_window=1e3*self.samplingTime)
        #sliced_xytp = slice_by_time(xytp=xytp, time_window=1e3*50)

        # accumulate spikes into frames - timestep * channel * x * y
        sliced_frames = accumulate_frames(sliced_xytp, range(shape[0]+1), range(shape[1]+1))

        # remove empty OFF channel -> 1st object of 2nd dimension
        #sliced_frames = np.delete(sliced_frames, obj=0, axis=1)


        # uint16 returns errors on enumerate
        #return sliced_frames.astype(np.float32), classLabel
        #return sliced_frames.astype(np.float32).reshape(batch_size, ch_size, x_sz, y_sz, -1), classLabel
        return sliced_frames.astype(np.float32).reshape(-1, input_size)/10, classLabel

    def __len__(self):
        return self.samples.shape[0]

def slice_by_time_md(xytp: np.ndarray, time_window:int, overlap:int = 0, include_incomplete=False):
    """
    Return xytp split according to fixed timewindow and overlap size
    <        <overlap>        >
    |   window1      |
             |   window2      |

    Args:
        xytp: np.ndarray
            Structured array of events
        time_window: int
            Length of time for each xytp (ms)
        overlap: int
            Length of time of overlapping (ms)
        include_incomplete: bool
            include incomplete slices ie potentially the last xytp

    Returns:
        slices List[np.ndarray]: Data slices

    """
    t = xytp["t"]
    stride = time_window - overlap
    assert stride > 0

    tmax = args.tmax_ms
    tmin = 0
    if include_incomplete:
        #n_slices = int(np.ceil(((t[-1] - t[0]) - time_window) / stride) + 1)
        n_slices = int(np.ceil(((1e3*tmax) - 1e3*tmin - time_window) / stride) + 1)
    else:
        #n_slices = int(np.floor(((t[-1] - t[0]) - time_window) / stride) + 1)
        n_slices = int(np.floor(((1e3*tmax) - 1e3*tmin - time_window) / stride) + 1)
    n_slices = max(n_slices, 1) # for strides larger than recording time

    tw_start = np.arange(n_slices)*stride + t[0]
    tw_end = tw_start + time_window
    indices_start = np.searchsorted(t, tw_start)
    indices_end = np.searchsorted(t, tw_end)
    sliced_xytp = [xytp[indices_start[i]:indices_end[i]] for i in range(n_slices)]
    return sliced_xytp

def percision_transfer(x, precision_bit=16, result_p = 4):

    if len(x.shape) == 1:
        o = x.shape
    elif len(x.shape) == 2:
        i,o = x.shape
    elif len(x.shape) == 4:
        i,o,v,c = x.shape
    x_list = x.reshape((-1,))
    n = 2**precision_bit-1
    q = 1./n
    q_list = np.round(np.arange(-1,1+q,q),result_p)
    func = lambda x: q_list[np.abs(x-q_list).argmin()]
    q_list = np.array(list(map(func, x_list)))
    if len(x.shape) == 1:
        return q_list
    elif len(x.shape) == 2:
        return q_list.reshape((i,o))
    elif len(x.shape) == 4:
        return q_list.reshape((i,o,v,c))

flag = 1
def low_precision(state_dict,precision=4):
    for k in state_dict.keys():
        if k =='thr_h':
            w = state_dict[k].data.cpu().numpy()
        else:
            w = percision_transfer(state_dict[k].data.cpu().numpy(),precision_bit=precision)
        state_dict[k] = torch.tensor(w)
    return state_dict



            
criterion = nn.NLLLoss()


def train(model, train_loader, optimizer, epochs, batch_size, precision = 4):

    for e in range(epochs):
        train_acc = 0
        train_loss_sum = 0
        total = 0
        for i, (images, labels) in enumerate(train_loader):
            

            optimizer.zero_grad()
            hidden_mem =  torch.zeros(model.hidden_size_1) # random init
            output_mem =  torch.zeros(model.output_size) #random init
            hidden_spike = torch.zeros(model.hidden_size_1)
            output_spike = torch.zeros(model.output_size)
            
            predictions, train_loss, nbr_events_avrg = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)
            predicted = predictions
            
                
            train_loss.sum().backward(retain_graph=True)
            train_loss_sum += train_loss.data.cpu().numpy()
            
                
            optimizer.step()
            predicted = predicted.t()
            train_acc += (predicted.T[0] == labels).sum() 
            total += labels.size(0)
        
        train_acc = train_acc.data.cpu().numpy()
        acc_hist_train.append(train_acc/total)
        loss_hist_train.append(train_loss_sum.item()/total)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + " Loss: " + str(train_loss_sum.item()/total) + " Accuracy: " + str(train_acc/total))

        # SAVE best model so far
        if args.save_bestmodel:
            if train_acc/total >= np.max(acc_hist_train):
                print(" -->  Saving best trained model : epoch " + str(e) + " Accuracy: " + str(train_acc/total))
                if args.retrain:
                    torch.save(model.state_dict(), savePath + '/snn-sg-ali-retrain' + str(fold) + '-best-.pt')
                else:
                    torch.save(model.state_dict(), savePath + '/snn-sg-ali-' + str(fold) + '-best.pt') 
        


if __name__ == '__main__':      

    # Define the cuda device to run the code on.
    torch.cuda.empty_cache()
    device = torch.device('cuda')




    trainingSet = SpkDataset_toFrameTimeBins(datasetPath =netParams['training']['path']['in'], 
                                sampleFile  =netParams['training']['path']['train'],
                                samplingTime=netParams['simulation']['Ts'])
    #trainingSet_cached = CachedDataset(trainingSet, cache_path='./cache-' + extraPath + '/spkdataset/train')
    #trainLoader = DataLoader(dataset=trainingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True, collate_fn=tonic.collation.PadTensors())
    #trainLoader = DataLoader(dataset=trainingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True)
    trainLoader = DataLoader(dataset=trainingSet, batch_size=batch_size, shuffle=True, num_workers=4)

    #testingSet = nmnistDataset(datasetPath  =netParams['training']['path']['in'], 
    #                            sampleFile  =netParams['training']['path']['test'],
    #                            samplingTime=netParams['simulation']['Ts'],
    #                            sampleLength=netParams['simulation']['tSample'])
    testingSet = SpkDataset_toFrameTimeBins(datasetPath  =netParams['training']['path']['in'], 
                                sampleFile  =netParams['training']['path']['test'],
                                samplingTime=netParams['simulation']['Ts'])
    #testingSet_cached = CachedDataset(testingSet, cache_path='./cache-' + extraPath + '/spkdataset/test')
    #testLoader = DataLoader(dataset=testingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True, collate_fn=tonic.collation.PadTensors())
    #testLoader = DataLoader(dataset=testingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True)
    testLoader = DataLoader(dataset=testingSet, batch_size=batch_size, shuffle=True, num_workers=4)


    if args.show_inputspikes:
        for i in range(25):
            input, classLabel = trainingSet[i]
            print(input.shape)
            plt.subplot(5,5,i+1)
            plt.ylabel("Class: " + str(classLabel))
            #print ON channel spikes
            plt.imshow(input[0][0])
        plt.show()

        for i in range(25):
            input, classLabel = trainingSet[0]
            plt.subplot(5,5,i+1)
            plt.ylabel("Class: " + str(classLabel))
            #print ON channel spikes
            plt.imshow(input[i][0])
        plt.show()

    # Configuration options
    k_folds = args.kfolds
  
    # For fold results
    results = {}
    results_best = {}
  
    # Set fixed random number seed
    torch.manual_seed(42)
  
    # Prepare dataset by concatenating Train/Test part; we split later.
    dataset = ConcatDataset([trainingSet, testingSet])
    if args.cache == "yes":
        dataset_cached = CachedDataset(dataset, cache_path='./cache-' + extraPath + '/spkdataset')
  
    # Define the K-fold Cross Validator
    kfold = KFold(n_splits=k_folds, shuffle=True)
    
    # Start print
    print('--------------------------------')

    # K-fold Cross Validation model evaluation
    for fold, (train_ids, test_ids) in enumerate(kfold.split(dataset)):
    
      # Print
      print(f'FOLD {fold}')
      print('--------------------------------')
    
      # Sample elements randomly from a given list of ids, no replacement.
      train_subsampler = torch.utils.data.SubsetRandomSampler(train_ids)
      test_subsampler = torch.utils.data.SubsetRandomSampler(test_ids)
    
      # Define data loaders for training and testing data in this fold
      if args.cache == "yes":
          trainloader = torch.utils.data.DataLoader(
                            dataset_cached, 
                            batch_size=batch_size, sampler=train_subsampler)
          testloader = torch.utils.data.DataLoader(
                            dataset_cached,
                            batch_size=batch_size, sampler=test_subsampler)
      else:
          trainloader = torch.utils.data.DataLoader(
                            dataset, 
                            batch_size=batch_size, sampler=train_subsampler)
          testloader = torch.utils.data.DataLoader(
                            dataset,
                            batch_size=batch_size, sampler=test_subsampler)
    
      # Init the neural network
      #model = mini_eMLP(x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      #model_best = mini_eMLP(x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      model = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      model_best = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      if args.retrain:
          model.load_state_dict(torch.load( savePath + '/snn-sg-ali.pt'))
          num_epochs = args.retrain




      base_params = [model.i2h.weight, model.i2h.bias, model.h2o.weight, model.h2o.bias]
      optimizer = torch.optim.Adam([{'params': base_params},], lr=learning_rate)



      loss_hist_train = []
      loss_hist_test = []
      acc_hist_train = []
      acc_hist_test = []


      # Training
      train(model, trainloader, optimizer, num_epochs, batch_size) 

      ## Save model
      if args.retrain:
          torch.save(model.state_dict(), savePath + '/snn-sg-ali-retrain-' + str(fold) + '.pt')
      else:
          torch.save(model.state_dict(), savePath + '/snn-sg-ali-' + str(fold) + '.pt')               
        

      # Testing
      # Load best model
      if args.save_bestmodel:
          if args.retrain:
              model_best.load_state_dict(torch.load( savePath + '/snn-sg-ali-retrain-' + str(fold) + '-best.pt'))
          else:
              model_best.load_state_dict(torch.load( savePath + '/snn-sg-ali-' + str(fold) + '-best.pt'))


      correct = 0
      total = 0
      correct_best = 0
      #test_acc = 0
      test_loss_sum = 0
      acc_hist_test = []
      loss_hist_test = []
      # Evaluationfor this fold
      for i, (images, labels) in enumerate(testloader):

        hidden_mem =  torch.zeros(model.hidden_size_1) # random init
        output_mem =  torch.zeros(model.output_size) #random init
        hidden_spike = torch.zeros(model.hidden_size_1)
        output_spike = torch.zeros(model.output_size)
            
        predictions, test_loss, nbr_events_avrg = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)
        predicted = predictions
            
        test_loss_sum += test_loss.data.cpu().numpy()
            
        predicted = predicted.t()
        correct += (predicted.T[0] == labels).sum() 
        total += labels.size(0) 
        print(predicted.T[0])
        print(labels)

        # test best model
        if args.save_bestmodel:
          hidden_mem =  torch.zeros(model.hidden_size_1) # random init
          output_mem =  torch.zeros(model.output_size) #random init
          hidden_spike = torch.zeros(model.hidden_size_1)
          output_spike = torch.zeros(model.output_size)
            
          predictions, _, _ = model_best(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)
          predicted = predictions
            
            
          predicted = predicted.t()
          correct_best += (predicted.T[0] == labels).sum() 
          print(predicted.T[0])
          print(labels)


      test_acc_ = correct / total
      acc_hist_test.append(test_acc_)
      loss_hist_test.append(test_loss_sum.item()/total)


      print('Accuracy for fold %d: %f %%' % (fold, 100.0 * test_acc_))
      print('--------------------------------')
      results[fold] = 100.0 * (test_acc_)

      #----------------------------------------------
      # Testing (BEST trained model)
      if args.save_bestmodel:
        test_acc_best = correct_best / total
        print('[BEST model] Accuracy for fold %d: %f %%' % (fold, 100.0 * test_acc_best))
        print('--------------------------------')
        results_best[fold] = 100.0 * (test_acc_best) 

      with open(savePath + '/loss_hist_train-' + str(fold) + '.txt', 'w') as f:
          for item in loss_hist_train:
            f.write("%f\n" % item)

      with open(savePath + '/loss_hist_test-' + str(fold) + '.txt', 'w') as f:
          for item in loss_hist_test:
              f.write("%f\n" % item)

      with open(savePath + '/acc_hist_train-' + str(fold) + '.txt', 'w') as f:
          for item in acc_hist_train:
              f.write("%f\n" % item)

      with open(savePath + '/acc_hist_test-' + str(fold) + '.txt', 'w') as f:
          for item in acc_hist_test:
              f.write("%f\n" % item)


    # Print fold results
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS')
    print('--------------------------------')
    sum = 0.0
    for key, value in results.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'Average: {sum/len(results.items())} %')

    with open(savePath + '/results.txt', 'w') as f:
        for item in results:
          f.write("%f\n" % item)

    # Print fold results [BEST model]
    if args.save_bestmodel:
      print(f'[BEST model] K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS')
      print('--------------------------------')
      sum = 0.0
      for key, value in results_best.items():
        print(f'Fold {key}: {value} %')
        sum += value
      print(f'Average: {sum/len(results_best.items())} %')

      with open(savePath + '/results_best.txt', 'w') as f:
          for item in results_best:
            f.write("%f\n" % item)


    #genLoihiParams(net)


    # Plot the results.
    # Learning loss
    plt.figure(3)
    plt.semilogy(loss_hist_train, label='Training (last fold)')
    plt.xlabel('Epoch')
    plt.ylabel('Loss')
    plt.title(savePath + '   snn-sg-ali')
    plt.legend()

    # Learning accuracy
    plt.figure(4)
    plt.plot(acc_hist_train, label='Training (last fold)')
    #plt.yscale('log')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title(savePath + '   snn-sg-ali')
    plt.legend()

    plt.show()





