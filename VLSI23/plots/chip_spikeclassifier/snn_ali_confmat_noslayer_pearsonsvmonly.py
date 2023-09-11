# add train1K.txt & test100.txt
# add network_ALL_smax_args.yaml

# ssh -X gliese
# source slayer.sh
# cd ~/Documents/chip_spikeclassifier



#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_ALLclass_auto_nospkfilter_sorted/ --epochs 10 --hidden_size 512 --num_classes 6 --batch_size 12 --tmax_ms 400 --Ts 1 --kfolds 6 --cache yes --svm_window_size 100

#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_pearsonsvmonly.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/ --epochs 10 --hidden_size 512 --num_classes 6 --batch_size 12 --tmax_ms 400 --Ts 1 --kfolds 6 --cache yes

#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_pearsonsvmonly.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_ALLclass_auto_nospkfilter_sorted/ --epochs 10 --hidden_size 512 --num_classes 6 --batch_size 12 --tmax_ms 400 --Ts 1 --kfolds 6 --cache yes

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
from eNetworks_svm import mini_eMLP
from PearsonSVM import re_encode_pearson
import torch.nn as nn
import torch
from torch.utils.data import TensorDataset, Dataset, DataLoader, ConcatDataset
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
from torch.optim.lr_scheduler import StepLR
from sklearn.utils import shuffle
from sklearn.model_selection import KFold

import tonic
from tonic.io import read_mnist_file
from tonic import CachedDataset

# from: https://synsense.gitlab.io/aermanager/api.html#module-aermanager.preprocess
from aermanager.aerparser import load_events_from_file
from aermanager.parsers import get_aer_events_from_file
from aermanager.parsers import parse_nmnist
from aermanager.preprocess import accumulate_frames
from aermanager.preprocess import slice_by_time
from aermanager.preprocess import slice_by_count

#import slayerSNN as snn
from sklearn import svm
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.model_selection import GridSearchCV

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
parser.add_argument("--svm_window_size",type=int,help="SVM window size",required=False)

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


if args.svm_window_size:
    window_size = args.svm_window_size
else:
    window_size = 100

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


extraPath =  'svmonly-epochs-' + str(args.epochs) + '-input_size-' + str(ch_size) + '-' + str(x_size) + '-' + str(y_size) + '-hidden_size-' + str(args.hidden_size) + '-batch_size-' + str(args.batch_size) + '-svm_window_size-' + str(window_size) + '-lr-' + str(learning_rate) + '-tmax_ms-' + str(args.tmax_ms) + '-Ts-' + str(args.Ts) + "-kfolds-" + str(args.kfolds) 

sampleFile_train = args.datasetPath + "train1K.txt"
sampleFile_test = args.datasetPath + "test100.txt"
savePath = path + "/TrainedALL_" + extraPath

print(args.datasetPath)
print(savePath)
mode=0o777
if os.path.exists(savePath) == False:
    os.mkdir(savePath)

#netParams = snn.params('network_ALL_smax_args.yaml')
#netParams['simulation']['Ts'] = args.Ts
#netParams['simulation']['tSample'] = args.tmax_ms
#netParams['training']['path']['in'] = args.datasetPath
#netParams['training']['path']['train'] = sampleFile_train
#netParams['training']['path']['test'] = sampleFile_test



# Dataset definition
class SpkDataset_toFrameTimeBins(Dataset):
    def __init__(self, datasetPath, sampleFile, samplingTime):
        self.path = datasetPath 
        self.samples = np.loadtxt(sampleFile).astype('int')
        self.samplingTime = float(samplingTime)

    def __getitem__(self, index):
        inputIndex  = self.samples[index, 0]
        classLabel  = self.samples[index, 1]


        dtype = np.dtype([('x', '<i8'), ('y', '<i8'), ('t', 'int32'), ('p', '<i8')]) 
        ordering = dtype.names

        events = read_mnist_file(self.path+str(inputIndex.item())+".bs2", dtype=dtype)


        frame_transform = tonic.transforms.ToFrame(sensor_size=(x_size,y_size,ch_size),n_time_bins=int(args.tmax_ms/args.Ts))
        frames = frame_transform(events).astype(np.float32)
        #print(np.shape(frames))

 
        #return frames.reshape(-1, ch_size*x_size*y_size)/10,classLabel
        return frames.reshape(-1, ch_size*x_size*y_size),classLabel
        #return frames,classLabel


    def __len__(self):
        return self.samples.shape[0]



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


def train_test(model, train_loader, test_loader, optimizer, epochs, batch_size, grid_search_linear, grid_search_rbf):

    acc_hist_train_svm_linear = []
    acc_hist_train_svm_rbf = []
    acc_hist_test_svm_linear = []
    acc_hist_test_svm_rbf = []


    scaler = StandardScaler()
    for e in range(epochs):

        correct_linear = 0
        correct_rbf = 0
        total = 0
        #labels_append = torch.tensor(labels_append)
        for i, (images, labels) in enumerate(train_loader):
            
            optimizer.zero_grad()
            hidden_mem =  torch.zeros(model.hidden_size_1) # random init
            output_mem =  torch.zeros(model.output_size) #random init
            hidden_spike = torch.zeros(model.hidden_size_1)
            output_spike = torch.zeros(model.output_size)
            
            #print(images.shape)

            predictions, train_loss, nbr_events_avrg, hidden_spike_filt = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)

            # batch_size x hidden_size x timewindows
            hidden_spike_filt_np = hidden_spike_filt.detach().numpy()
            print(hidden_spike_filt_np.shape)

            # batch_size x hidden_size*timewindows
            #hidden_spike_filt_np = hidden_spike_filt_np.reshape(hidden_spike_filt_np.shape[0],-1)
            #hidden_spike_filt_sc = scaler.fit_transform(hidden_spike_filt_np)

            hidden_spike_filt_mean = np.mean(hidden_spike_filt_np, axis=2)  # get mean across time
            print(hidden_spike_filt_mean.shape)
            cov_data = re_encode_pearson(Dcode=hidden_size, mat=hidden_spike_filt_np, mean_data=hidden_spike_filt_mean, mode = 0)

            print(cov_data.shape)
            #print(cov_data)

            # INSERT pearson code

            # Train the linear classifier using hidden_spike_filt and labels
            grid_search_linear.fit(cov_data, labels)
            predicted_linear = grid_search_linear.predict(cov_data)
            print(labels)
            print(predicted_linear)

            #print(predicted_linear == labels.numpy())
            correct_linear += (predicted_linear == labels.numpy()).sum() 
            total += labels.size(0) 

            # Train the RBF classifier using hidden_spike_filt and labels
            grid_search_rbf.fit(cov_data, labels)
            predicted_rbf = grid_search_rbf.predict(cov_data)

            #print(predicted_linear == labels.numpy())
            correct_rbf += (predicted_rbf == labels.numpy()).sum() 

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the linear SVC classifier:", grid_search_linear.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual train score: " + str(correct_linear/total) + "  Best train score for the linear SVC classifier:",  grid_search_linear.best_score_)

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the RBF SVC classifier:", grid_search_rbf.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual train score: " + str(correct_rbf/total) + "  Best train score for the RBF SVC classifier:", grid_search_rbf.best_score_)


        acc_hist_train_svm_linear.append(grid_search_linear.best_score_)
        acc_hist_train_svm_rbf.append(grid_search_rbf.best_score_)        

        correct_linear = 0
        correct_rbf = 0
        total = 0
        # Evaluationfor this fold
        for i, (images, labels) in enumerate(test_loader):

            hidden_mem =  torch.zeros(model.hidden_size_1) # random init
            output_mem =  torch.zeros(model.output_size) #random init
            hidden_spike = torch.zeros(model.hidden_size_1)
            output_spike = torch.zeros(model.output_size)
            
            predictions, test_loss, nbr_events_avrg, hidden_spike_filt = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)

            # batch_size x hidden_size x timewindows
            hidden_spike_filt_np = hidden_spike_filt.detach().numpy()

            # batch_size x hidden_size*timewindows
            #hidden_spike_filt_np = hidden_spike_filt_np.reshape(hidden_spike_filt_np.shape[0],-1)
            #hidden_spike_filt_sc = scaler.fit_transform(hidden_spike_filt_np)

            hidden_spike_filt_mean = np.mean(hidden_spike_filt_np, axis=2)  # get mean across time
            print(hidden_spike_filt_mean.shape)
            cov_data = re_encode_pearson(Dcode=hidden_size, mat=hidden_spike_filt_np, mean_data=hidden_spike_filt_mean, mode = 0)

            print(cov_data.shape)
            #print(cov_data)


            # Test the linear classifier using hidden_spike_filt and labels
            test_linear = grid_search_linear.score(cov_data, labels)
            predicted_linear = grid_search_linear.predict(cov_data)
            print(labels)
            print(predicted_linear)

            correct_linear += (predicted_linear == labels.numpy()).sum() 
            total += labels.size(0) 

            # Train the RBF classifier using hidden_spike_filt and labels
            test_rbf = grid_search_rbf.score(cov_data, labels)
            predicted_rbf = grid_search_rbf.predict(cov_data)

            correct_rbf += (predicted_rbf == labels.numpy()).sum() 

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the linear SVC classifier:", grid_search_linear.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual test score: " + str(correct_linear/total) + "  Best test score for the linear SVC classifier:",  grid_search_linear.best_score_ )
 
        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the RBF SVC classifier:", grid_search_rbf.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual test score: " + str(correct_rbf/total) + "  Best test score for the RBF SVC classifier:", grid_search_rbf.best_score_)

        acc_hist_test_svm_linear.append(test_linear)
        acc_hist_test_svm_rbf.append(test_rbf)    

    return acc_hist_train_svm_linear, acc_hist_train_svm_rbf, acc_hist_test_svm_linear, acc_hist_test_svm_rbf 

    


if __name__ == '__main__':      

    # Define the cuda device to run the code on.
    torch.cuda.empty_cache()
    device = torch.device('cuda')


#netParams = snn.params('network_ALL_smax_args.yaml')
#netParams['simulation']['Ts'] = args.Ts
#netParams['simulation']['tSample'] = args.tmax_ms
#netParams['training']['path']['in'] = args.datasetPath
#netParams['training']['path']['train'] = sampleFile_train
#netParams['training']['path']['test'] = sampleFile_test



    #trainingSet = nmnistDataset(datasetPath =netParams['training']['path']['in'], 
    #                            sampleFile  =netParams['training']['path']['train'],
    #                            samplingTime=netParams['simulation']['Ts'],
    #                            sampleLength=netParams['simulation']['tSample'])
    trainingSet = SpkDataset_toFrameTimeBins(datasetPath =args.datasetPath, 
                                sampleFile  =sampleFile_train,
                                samplingTime=args.Ts)

    #testingSet = nmnistDataset(datasetPath  =netParams['training']['path']['in'], 
    #                            sampleFile  =netParams['training']['path']['test'],
    #                            samplingTime=netParams['simulation']['Ts'],
    #                            sampleLength=netParams['simulation']['tSample'])
    testingSet = SpkDataset_toFrameTimeBins(datasetPath  =args.datasetPath, 
                                sampleFile  =sampleFile_test,
                                samplingTime=args.Ts)


    trainingSet_cached = CachedDataset(trainingSet, cache_path='./cache-' + extraPath + '/spkdataset/train',reset_cache=True)
    #trainLoader = DataLoader(dataset=trainingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True, collate_fn=tonic.collation.PadTensors())
    #trainLoader = DataLoader(dataset=trainingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True)
    trainLoader = DataLoader(dataset=trainingSet_cached, batch_size=batch_size, shuffle=True, num_workers=4)

    testingSet_cached = CachedDataset(testingSet, cache_path='./cache-' + extraPath + '/spkdataset/test',reset_cache=True)
    #testLoader = DataLoader(dataset=testingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True, collate_fn=tonic.collation.PadTensors())
    #testLoader = DataLoader(dataset=testingSet, batch_size=batch_size, shuffle=True, num_workers=4, drop_last=True)
    testLoader = DataLoader(dataset=testingSet_cached, batch_size=batch_size, shuffle=True, num_workers=4)


    if args.show_inputspikes:
        for i in range(1):
            input, classLabel = trainingSet[i]
            print(input.shape)
            print(classLabel)
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

    results_svm_linear = {}
    results_svm-rbf = {}
    results_svm_linear_max = {}
    results_svm_rbf_max = {}
  
    # Set fixed random number seed
    torch.manual_seed(42)
  
    # Prepare dataset by concatenating Train/Test part; we split later.
    dataset = ConcatDataset([trainingSet_cached, testingSet_cached])
    #if args.cache == "yes":
    #    dataset_cached = CachedDataset(dataset, cache_path='./cache-' + extraPath + '/spkdataset',reset_cache=True)

  
    # Define the K-fold Cross Validator
    kfold = KFold(n_splits=k_folds, shuffle=True)
    
    # ----------------SVM Stuff
    # Set the hyperparameters for the linear SVM classifier
    parameters_linear = {'C': [1, 10, 100]}

    # Set the hyperparameters for the SVM classifier with an RBF kernel
    parameters_rbf = {'C': [1, 10, 100], 'gamma': [0.1, 1, 10, 100]}

    # Initialize the linear SVM classifier and the SVM classifier with an RBF kernel
    linear_svm = svm.SVC(kernel='linear')
    rbf_svm = svm.SVC(kernel='rbf')

    # Initialize the grid search object for the linear SVM classifier
    grid_search_linear = GridSearchCV(linear_svm, parameters_linear, cv=kfold)

    # Initialize the grid search object for the SVM classifier with an RBF kernel
    grid_search_rbf = GridSearchCV(rbf_svm, parameters_rbf, cv=kfold)
    # ---------------SVM stuff

    
    # Start print
    print('--------------------------------')

    # store accuracy per class for all folds
    accs_all = [];

    # Store mean accuracy for all folds for top K
    top_KK_acc_folds = [];

    # Store mean accuracy for all folds for top K (chosen K)
    top_KK_acc_chosenK_folds = [];

    # K-fold Cross Validation model evaluation
    for fold, (train_ids, test_ids) in enumerate(kfold.split(dataset)):
    
      # Print
      print(f'FOLD {fold}')
      print('--------------------------------')
    
      # Sample elements randomly from a given list of ids, no replacement.
      train_subsampler = torch.utils.data.SubsetRandomSampler(train_ids)
      test_subsampler = torch.utils.data.SubsetRandomSampler(test_ids)
    
      # Define data loaders for training and testing data in this fold
      #if args.cache == "yes":
      #    trainloader = torch.utils.data.DataLoader(
      #                      dataset_cached, 
      #                      batch_size=batch_size, sampler=train_subsampler)
      #    testloader = torch.utils.data.DataLoader(
      #                      dataset_cached,
      #                      batch_size=batch_size, sampler=test_subsampler)
      #else:
      trainloader = torch.utils.data.DataLoader(
                            dataset, 
                            batch_size=batch_size, sampler=train_subsampler)
      testloader = torch.utils.data.DataLoader(
                            dataset,
                            batch_size=batch_size, sampler=test_subsampler)
    
      # Init the neural network
      #model = mini_eMLP(x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      #model_best = mini_eMLP(x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size)
      model = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size, window_size=window_size)
      model_best = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, criterion=criterion, batch_size=batch_size, window_size=window_size)
      if args.retrain:
          model.load_state_dict(torch.load( savePath + '/snn-sg-ali.pt'))
          num_epochs = args.retrain




      #base_params = [model.i2h.weight, model.i2h.bias, model.h2o.weight, model.h2o.bias]
      base_params = [model.i2h.weight, model.i2h.bias, model.h2o.weight, model.h2o.bias, model.h2h.weight, model.h2h.bias]
      optimizer = torch.optim.Adam([{'params': base_params},], lr=learning_rate)




      # Training and Testing
      acc_hist_train_svm_linear, acc_hist_train_svm_rbf, acc_hist_test_svm_linear, acc_hist_test_svm_rbf = train_test(model, trainloader, testloader, optimizer, num_epochs, batch_size, grid_search_linear, grid_search_rbf) 
      acc_hist_test_svm_linear_max = np.max(acc_hist_test_svm_linear)
      acc_hist_test_svm_rbf_max = np.max(acc_hist_test_svm_rbf)
      epoch_max_linear = np.argmax(acc_hist_test_svm_linear)
      epoch_max_rbf = np.argmax(acc_hist_test_svm_rbf)




      #----------------------------------------------------------

 


      print('Linear SVM Accuracy for fold %d: %f %%' % (fold, 100.0 * acc_hist_train_svm_linear[-1]))
      print('--------------------------------')
      print('RBF SVM Accuracy for fold %d: %f %%' % (fold, 100.0 * acc_hist_train_svm_rbf[-1]))
      print('--------------------------------')
      print('--> At epoch = %d, Linear SVM Max: %f %%' % (epoch_max_linear, 100.0 * acc_hist_test_svm_linear_max))     
      print('--------------------------------')
      print('--> At epoch = %d, RBF SVM Max: %f %%' % (epoch_max_rbf, 100.0 * acc_hist_test_svm_rbf_max))       
      results_svm_linear[fold] =  100.0 * acc_hist_train_svm_linear[-1]
      results_svm_rbf[fold] = 100.0 * acc_hist_train_svm_rbf[-1]
      results_svm_linear_max[fold] =  100.0 * acc_hist_test_svm_linear_max
      results_svm_rbf_max[fold] = 100.0 * acc_hist_test_svm_rbf_max




    # Print fold results
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM Linear')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_linear.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'Average: {sum/len(results.items())} %')

    # Print fold results for SVM
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM RBF')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_rbf.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'Average: {sum/len(results.items())} %')

    # Print fold results
    print(f'MAX:   K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM Linear')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_linear_max.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'MAX Average: {sum/len(results.items())} %')

    # Print fold results
    print(f'MAX:   K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM RBF')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_rbf_max.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'MAX Average: {sum/len(results.items())} %')


    


    # Plot the results.


    # Learning accuracy
    plt.figure(1)
    plt.plot(acc_hist_train_svm_linear, label='Training (last fold) - SVM Linear')
    #plt.yscale('log')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title(savePath + '   svm-linear-train')
    plt.legend()
    plt.savefig(savePath + '/acc-svm-linear-train-lastfold.png')

    plt.figure(2)
    plt.plot(acc_hist_train_svm_rbf, label='Training (last fold) - SVM RBF')
    #plt.yscale('log')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title(savePath + '   svm-rbf-train')
    plt.legend()
    plt.savefig(savePath + '/acc-svm-linear-train-lastfold.png')

    plt.figure(3)
    plt.plot(acc_hist_test_svm_linear, label='Test (last fold) - SVM Linear')
    #plt.yscale('log')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title(savePath + '   svm-linear-test')
    plt.legend()
    plt.savefig(savePath + '/acc-svm-linear-test-lastfold.png')

    plt.figure(4)
    plt.plot(acc_hist_test_svm_linear, label='Test (last fold) - SVM RBF')
    #plt.yscale('log')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title(savePath + '   svm-rbf-test')
    plt.legend()
    plt.savefig(savePath + '/acc-svm-linear-test-lastfold.png')

    plt.show()





