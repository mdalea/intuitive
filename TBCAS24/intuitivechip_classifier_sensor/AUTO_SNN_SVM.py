import os
import numpy as np
import argparse

path = os.getcwd()
parser = argparse.ArgumentParser("Automate SNN and SVM")
parser.add_argument("--cuda",type=int,help="CUDA core used", required=False)
parser.add_argument("--epochs",type=int,help="No. of epochs of training",required=False)

args = parser.parse_args()
'''

parser.add_argument("--batch_size",type=int,help="Training batch size",required=False)
parser.add_argument("--hidden_size",type=int,help="MLP hidden size",required=False)
parser.add_argument("--tmax_ms",type=float,help="Maximum sensor recording considered",required=False)
parser.add_argument("--Ts",type=float,help="Sampling time",required=False)
parser.add_argument("--kfolds",type=int,help="No. of k-folds",required=False)
parser.add_argument("--svm_window_size",type=int,help="SVM window size",required=False)





if args.svm_window_size:
    window_size = args.svm_window_size
else:
    window_size = 100
'''

if args.cuda:
    cuda = args.cuda
else:
    cuda = 0

if args.epochs:
    epochs = args.epochs
else:
    epochs = 150

kfolds=6
runID = 'indentperiod'
tmax_ms=10000
Ts=500

hidden_size=256
svm_window_size=int(tmax_ms/Ts)

denoise_time_win=10000


## 
datasetID = 'sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600'

os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 5 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes")

for fold in range(kfolds):
    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 5 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-16-12-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-best-{fold}")

##DENOISE
os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 5 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --denoise {denoise_time_win}")

for fold in range(kfolds):
    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 5 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --svm_window_size {svm_window_size} --denoise 10000 --retrainPath SNN_ep-{epochs}-isize-2-16-12-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-denoise-{denoise_time_win}-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-denoise-{denoise_time_win}-{datasetID}-best-{fold}")


