# add train1K.txt & test100.txt
# add network_ALL_smax_args.yaml

# ssh -X gliese
# source slayer.sh
# cd ~/Documents/chip_spikeclassifier



# Texture 180mVpp
#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly_nodataloader.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/ --epochs 5 --hidden_size 128 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --svm_window_size 40 --retrainPath /users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/chip-classifier-test-0-best.pt

# Texture 7.2mVpp
#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly_nodataloader.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/ --epochs 5 --hidden_size 128 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --svm_window_size 40 --retrainPath /users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/chip-classifier-test-0-best.pt

# Texture 9mVpp
#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly_nodataloader.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs/ --epochs 5 --hidden_size 256 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --svm_window_size 40 --retrainPath /users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs/chip-classifier-test-0-best.pt

# Model texture 7.2mVpp
#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly_nodataloader.py --datasetPath /users/micas/malea/Documents/all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-8-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/ --epochs 5 --hidden_size 256 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --svm_window_size 40 --retrainPath /users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-8-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/chip-classifier-test-0-best.pt --retrainPath_id modelspikes-8b-0-best

# Vibration
#CUDA_VISIBLE_DEVICES=0 python snn_ali_confmat_noslayer_svmonly_nodataloader.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/ --epochs 5 --hidden_size 128 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --svm_window_size 40 --retrainPath /users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/chip-classifier-test-0-best.pt 

"""
Train SVM Classifier on the Filtered Output Spikes of the Hidden Layer
Texture recognition using tacile sensors
Author: Ali Safa - IMEC- KU Leuven, Federico Corradi - IMEC-NL
Modified by: Mark Alea - KU Leuven
"""
import sys, os
CURRENT_TEST_DIR = os.getcwd()
sys.path.append(CURRENT_TEST_DIR + "/../../src")

import numpy as np
#from eNetworks import mini_eCNN
from eNetworks_svmonly import mini_eMLP
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
parser.add_argument("--retrainPath",type=str,help="Re-train existing network. Enter model path .pt",required=False)
parser.add_argument("--kfolds",type=int,help="No. of k-folds",required=True)
parser.add_argument("--save_bestmodel",type=str,help="Save best model and run k-fold with it",required=False)
parser.add_argument("--cache",type=str,help="Cache dataset for faster access",required=True)
parser.add_argument("--svm_window_size",type=int,help="SVM window size",required=False)
parser.add_argument("--scaler",type=str,help="Use scaler on filtered spikes before SVM",required=False)
parser.add_argument("--retrainPath_id",type=str,help="Custom ID to differentiate which model was loaded",required=False)



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

if args.scaler:
    scaler = '-scaler-'
else:
    scaler = ''

"""
if args.retrainPath:
    tokens_slash = args.retrainPath.split('/')
    #print(tokens_slash[-1])
    tokens_dot = tokens_slash[-1].split('.')
    tokens = tokens_dot[0].split('-')
    #print(modelname[0])
    retrainPath = '-retrainPath-' + tokens[-2] + '-' + tokens[-1]
else:
    retrainPath = ''
"""

if args.retrainPath_id:
    retrainPath = '-' + args.retrainPath_id

else:
    if args.retrainPath:
        tokens_slash = args.retrainPath.split('/')
        print(tokens_slash[-2])
        print(tokens_slash[-1])
        tokens_dot = tokens_slash[-1].split('.')
        tokens = tokens_dot[0].split('-')
        #print(modelname[0])
        retrainPath = '-retrainPath-' + tokens_slash[-2] + '-' + tokens[-2] + '-' + tokens[-1]
        print(retrainPath)
    else:
        retrainPath = ''

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

if args.datasetPath:
    tokens_slash = args.datasetPath.split('/')
    #print(tokens_slash[-1])
    #print(tokens_slash[-2])
    #modelname = tokens_slash[-1].split('.')
    #print(modelname[0])
    datasetPath = '-datasetPath-' + tokens_slash[-2]
else:
    datasetPath = ''

if args.retrainPath:
    extraPath =  'svmonly-ep-' + str(args.epochs) + '-svm_wsize-' + str(window_size) + scaler + retrainPath 
else:
    extraPath =  'svmonly-epochs-' + str(args.epochs) + '-input_size-' + str(ch_size) + '-' + str(x_size) + '-' + str(y_size) + '-hidden_size-' + str(args.hidden_size) + '-batch_size-' + str(args.batch_size) + '-svm_window_size-' + str(window_size) + '-lr-' + str(learning_rate) + '-tmax_ms-' + str(args.tmax_ms) + '-Ts-' + str(args.Ts) + "-kfolds-" + str(args.kfolds) + scaler + retrainPath 

sampleFile_train = args.datasetPath + "train1K.txt"
sampleFile_test = args.datasetPath + "test100.txt"
savePath = path + "/TrainedALL_" + extraPath
#savePath = path + "/" + extraPath


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
        images = []
        labels = []
        for i, (image, label) in enumerate(train_loader):
            images.append(image)
            labels.append(label)

        images = torch.cat(images,dim=0)
        labels = torch.cat(labels,dim=0)
        print(images.shape)
        print(labels.shape)
            
        hidden_mem =  torch.zeros(model.hidden_size_1) # random init
        output_mem =  torch.zeros(model.output_size) #random init
        hidden_spike = torch.zeros(model.hidden_size_1)
        output_spike = torch.zeros(model.output_size)
            
        #print(images.shape)

        hidden_spike_filt = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)

        # batch_size x hidden_size x timewindows
        hidden_spike_filt_np = hidden_spike_filt.detach().numpy()

        # batch_size x hidden_size*timewindows
        hidden_spike_filt_np = hidden_spike_filt_np.reshape(hidden_spike_filt_np.shape[0],-1)
        if args.scaler:
            hidden_spike_filt_sc = scaler.fit_transform(hidden_spike_filt_np)
        else:
            hidden_spike_filt_sc = hidden_spike_filt_np

        # Train the linear classifier using hidden_spike_filt and labels
        grid_search_linear.fit(hidden_spike_filt_sc, labels)
        predicted_linear = grid_search_linear.predict(hidden_spike_filt_sc)
        print(labels)
        print(predicted_linear)

        #print(predicted_linear == labels.numpy())
        correct_linear += (predicted_linear == labels.numpy()).sum() 
        total += labels.size(0) 

        # Train the RBF classifier using hidden_spike_filt and labels
        grid_search_rbf.fit(hidden_spike_filt_sc, labels)
        predicted_rbf = grid_search_rbf.predict(hidden_spike_filt_sc)
        print("RBF")
        print(labels)
        print(predicted_rbf)

        #print(predicted_linear == labels.numpy())
        correct_rbf += (predicted_rbf == labels.numpy()).sum() 

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the linear SVC classifier:", grid_search_linear.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual train score: " + str(correct_linear/total) + "  Best train score for the linear SVC classifier:",  grid_search_linear.best_score_)

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the RBF SVC classifier:", grid_search_rbf.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual train score: " + str(correct_rbf/total) + "  Best train score for the RBF SVC classifier:", grid_search_rbf.best_score_)

        #acc_hist_train_svm_linear.append(grid_search_linear.best_score_)
        #acc_hist_train_svm_rbf.append(grid_search_rbf.best_score_)     
        acc_hist_train_svm_linear.append(correct_linear/total)
        acc_hist_train_svm_rbf.append(correct_linear/total)         

        correct_linear = 0
        correct_rbf = 0
        total = 0

        images = []
        labels = []
        # Evaluationfor this fold
        for i, (image, label) in enumerate(test_loader):
       	    images.append(image)
            labels.append(label)

        images = torch.cat(images,dim=0)
        labels = torch.cat(labels,dim=0)

        hidden_mem =  torch.zeros(model.hidden_size_1) # random init
        output_mem =  torch.zeros(model.output_size) #random init
        hidden_spike = torch.zeros(model.hidden_size_1)
        output_spike = torch.zeros(model.output_size)
            
        hidden_spike_filt = model(images, labels, hidden_mem, hidden_spike, output_mem, output_spike)
        # batch_size x hidden_size x timewindows
        hidden_spike_filt_np = hidden_spike_filt.detach().numpy()
        print(hidden_spike_filt_np.shape)

        # batch_size x hidden_size*timewindows
        hidden_spike_filt_np = hidden_spike_filt_np.reshape(hidden_spike_filt_np.shape[0],-1)
        if args.scaler:
            hidden_spike_filt_sc = scaler.fit_transform(hidden_spike_filt_np)
        else:
            hidden_spike_filt_sc = hidden_spike_filt_np

        hidden_spike_filt_sc = hidden_spike_filt_np
        print(hidden_spike_filt_sc.shape)

        # Train the linear classifier using hidden_spike_filt and labels
        test_linear = grid_search_linear.score(hidden_spike_filt_sc, labels)
        predicted_linear = grid_search_linear.predict(hidden_spike_filt_sc)
        print(labels)
        print(predicted_linear)

        correct_linear += (predicted_linear == labels.numpy()).sum() 
        total += labels.size(0) 

        # Train the RBF classifier using hidden_spike_filt and labels
        test_rbf = grid_search_rbf.score(hidden_spike_filt_sc, labels)
        predicted_rbf = grid_search_rbf.predict(hidden_spike_filt_sc)

        correct_rbf += (predicted_rbf == labels.numpy()).sum() 

        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the linear SVC classifier:", grid_search_linear.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual test score: " + str(correct_linear/total) + "  Best test score for the linear SVC classifier:",  grid_search_linear.best_score_ )
 
        # Print the best hyperparameters and the best score
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Best hyperparameters for the RBF SVC classifier:", grid_search_rbf.best_params_)
        print("Fold: " + str(fold) + " Epoch: " + str(e) + "  Manual test score: " + str(correct_rbf/total) + "  Best test score for the RBF SVC classifier:", grid_search_rbf.best_score_)

        #acc_hist_test_svm_linear.append(test_linear)
        #acc_hist_test_svm_rbf.append(test_rbf)  
        acc_hist_test_svm_linear.append(correct_linear/total)
        acc_hist_test_svm_rbf.append(correct_rbf/total)   

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
            input = input.reshape(-1, ch_size, y_size, x_size)
            print(input.shape)
            print(classLabel)
            plt.subplot(5,5,i+1)
            plt.ylabel("Class: " + str(classLabel))
            #print ON channel spikes
            plt.imshow(input[0][0])
        plt.show()

        for i in range(8):
            input, classLabel = trainingSet[0]
            input = input.reshape(-1, ch_size, y_size, x_size)
            plt.subplot(5,5,i+1)
            plt.ylabel("Class: " + str(classLabel))
            #print ON channel spikes
            plt.imshow(input[i][0])
        plt.show()

    # Configuration options
    k_folds = args.kfolds
  
    # For fold results
    results_svm_linear = {}
    results_svm_rbf = {}
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
    parameters_linear = {'C': [0.1, 1, 10, 100]}

    # Set the hyperparameters for the SVM classifier with an RBF kernel
    parameters_rbf = {'C': [0.1, 1, 10, 100], 'gamma': [0.1, 1, 10, 100]}

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
      model = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, window_size=window_size)
      model_best = mini_eMLP(ch_size, x_size, y_size, hidden_size, num_classes, window_size=window_size)
      if args.retrain:
          model.load_state_dict(torch.load( savePath + '/chip-classifier.pt'))
          num_epochs = args.retrain

      if args.retrainPath:
          model.load_state_dict(torch.load(args.retrainPath))     




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

 


      print('Linear SVM Accuracy for fold %d: %f %%' % (fold, 100.0 * acc_hist_test_svm_linear[-1]))
      print('--------------------------------')
      print('RBF SVM Accuracy for fold %d: %f %%' % (fold, 100.0 * acc_hist_test_svm_rbf[-1]))
      print('--------------------------------')
      print('--> At epoch = %d, Linear SVM Max: %f %%' % (epoch_max_linear, 100.0 * acc_hist_test_svm_linear_max))     
      print('--------------------------------')
      print('--> At epoch = %d, RBF SVM Max: %f %%' % (epoch_max_rbf, 100.0 * acc_hist_test_svm_rbf_max))       
      results_svm_linear[fold] =  100.0 * acc_hist_test_svm_linear[-1]
      results_svm_rbf[fold] = 100.0 * acc_hist_test_svm_rbf[-1]
      results_svm_linear_max[fold] =  100.0 * acc_hist_test_svm_linear_max
      results_svm_rbf_max[fold] = 100.0 * acc_hist_test_svm_rbf_max




    # Print fold results
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM Linear')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_linear.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'Average: {sum/len(results_svm_linear.items())} %')

    # Print fold results for SVM
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM RBF')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_rbf.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'Average: {sum/len(results_svm_rbf.items())} %')

    # Print fold results
    print(f'MAX:   K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM Linear')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_linear_max.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'MAX Average: {sum/len(results_svm_linear_max.items())} %')

    # Print fold results
    print(f'MAX:   K-FOLD CROSS VALIDATION RESULTS FOR {k_folds} FOLDS - SVM RBF')
    print('--------------------------------')
    sum = 0.0
    for key, value in results_svm_rbf_max.items():
      print(f'Fold {key}: {value} %')
      sum += value
    print(f'MAX Average: {sum/len(results_svm_rbf_max.items())} %')

    with open(savePath + '/results_svm_linear.txt', 'w') as f:
      sum = 0.0
      for key, value in results_svm_linear.items():
        f.write("Fold %d: %f \n" % (key, value))
        sum += value
      f.write("Average: %f %%\n" % (sum/len(results_svm_linear.items())))
    
    with open(savePath + '/results_svm_rbf.txt', 'w') as f:
      sum = 0.0
      for key, value in results_svm_rbf.items():
        f.write("Fold %d: %f \n" % (key, value))
        sum += value
      f.write("Average: %f %%\n" % (sum/len(results_svm_rbf.items())))

    with open(savePath + '/results_svm_linear_max.txt', 'w') as f:
      sum = 0.0
      for key, value in results_svm_linear_max.items():
        f.write("Fold %d: %f \n" % (key, value))
        sum += value
      f.write("Average: %f %%\n" % (sum/len(results_svm_linear_max.items())))
    
    with open(savePath + '/results_svm_rbf_max.txt', 'w') as f:
      sum = 0.0
      for key, value in results_svm_rbf_max.items():
        f.write("Fold %d: %f \n" % (key, value))
        sum += value
      f.write("Average: %f %%\n" % (sum/len(results_svm_rbf_max.items())))

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





