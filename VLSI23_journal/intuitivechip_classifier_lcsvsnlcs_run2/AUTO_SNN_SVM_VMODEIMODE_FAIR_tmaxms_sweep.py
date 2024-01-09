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
runID = 'fair_tmaxsweep'


for tmax_ms in [100,200,300,400]:
	#tmax_ms=400
	Ts=10

	svm_window_size=int(tmax_ms/Ts)

	##-----VMODE------
	hidden_size=256 - 6 - 2*1*8

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")


	##-----VMODE (larger hidden layer)------
	hidden_size=256 - 6 - 1*1*8

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 2 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 2 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-2-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")



	#------VMODE (DISCARDED OFF SPIKES)------
	hidden_size=256 - 6 - 1*1*8
	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	#------VMODE (MERGED OFF SPIKES AS ON SPIKES)------
	hidden_size=256 - 6 - 1*1*8
	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")







	##-----IMODE------
	hidden_size=256 - 6 - 1*1*8
	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	##-----IMODE (FAST)------
	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")

	## 
	datasetID = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast'

	os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_snn_sg.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs {epochs} --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes --save_bestmodel yes --ch_size 1 --x_size 8 --y_size 1")

	for fold in range(kfolds):
	    os.system(f"CUDA_VISIBLE_DEVICES={cuda} python intuitivespikes_svmclassifier.py --datasetPath ../SENSOR_DATASETS/PROCESSED_SPIKES/{datasetID}/ --epochs 5 --hidden_size {hidden_size} --num_classes 6 --batch_size 32 --tmax_ms {tmax_ms} --Ts {Ts} --kfolds 6 --cache yes  --ch_size 1 --x_size 8 --y_size 1 --svm_window_size {svm_window_size} --retrainPath SNN_ep-{epochs}-isize-1-8-1-hsize-{hidden_size}-bsize-32-lr-0.001-tmax_ms-{tmax_ms}.0-Ts-{Ts}.0-k-6-dsetPath-{datasetID}/chip-classifier-test-{fold}-best.pt --retrainPath_id {runID}-{datasetID}-{hidden_size}-best-{fold}")



