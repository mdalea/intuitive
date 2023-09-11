%% for sensor spikes
clear all
close all
clearvars




figi=69;
kfolds=6


mr_cnt=192;

%% Effect of Ts on softmax SNN only
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-100.0-k-6-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_Ts(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_Ts(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-1000.0-k-6-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_Ts(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-5000.0-k-6-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_Ts(4,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-10000.0-k-6-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_Ts(5,:) = parse_result(resultsPath)

%----SNN-------denoise
resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-100.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoise_Ts(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoise_Ts(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-1000.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoise_Ts(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-5000.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoise_Ts(4,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-10000.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoise_Ts(5,:) = parse_result(resultsPath)

%----SVM----
%--- Ts 100ms ----
s=1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-100-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_Ts(s,1,:)) mean(results_linear_max_Ts(s,2,:)) mean(results_linear_max_Ts(s,3,:)) mean(results_linear_max_Ts(s,4,:)) mean(results_linear_max_Ts(s,5,:)) mean(results_linear_max_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_Ts(s,:) = results_linear_max_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 100ms----denoise
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoise_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoise_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoise_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoise_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoise_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-100-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoise_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoise_Ts(s,1,:)) mean(results_linear_max_denoise_Ts(s,2,:)) mean(results_linear_max_denoise_Ts(s,3,:)) mean(results_linear_max_denoise_Ts(s,4,:)) mean(results_linear_max_denoise_Ts(s,5,:)) mean(results_linear_max_denoise_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoise_Ts(s,:) = results_linear_max_denoise_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 500ms----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_Ts(s,1,:)) mean(results_linear_max_Ts(s,2,:)) mean(results_linear_max_Ts(s,3,:)) mean(results_linear_max_Ts(s,4,:)) mean(results_linear_max_Ts(s,5,:)) mean(results_linear_max_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_Ts(s,:) = results_linear_max_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 500ms----denoise
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoise_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoise_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoise_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoise_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoise_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoise_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoise_Ts(s,1,:)) mean(results_linear_max_denoise_Ts(s,2,:)) mean(results_linear_max_denoise_Ts(s,3,:)) mean(results_linear_max_denoise_Ts(s,4,:)) mean(results_linear_max_denoise_Ts(s,5,:)) mean(results_linear_max_denoise_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoise_Ts(s,:) = results_linear_max_denoise_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 1000ms----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_Ts(s,1,:)) mean(results_linear_max_Ts(s,2,:)) mean(results_linear_max_Ts(s,3,:)) mean(results_linear_max_Ts(s,4,:)) mean(results_linear_max_Ts(s,5,:)) mean(results_linear_max_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_Ts(s,:) = results_linear_max_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 1000ms----denoise
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoise_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoise_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoise_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoise_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoise_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-10-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoise_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoise_Ts(s,1,:)) mean(results_linear_max_denoise_Ts(s,2,:)) mean(results_linear_max_denoise_Ts(s,3,:)) mean(results_linear_max_denoise_Ts(s,4,:)) mean(results_linear_max_denoise_Ts(s,5,:)) mean(results_linear_max_denoise_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoise_Ts(s,:) = results_linear_max_denoise_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 5000ms----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_Ts(s,1,:)) mean(results_linear_max_Ts(s,2,:)) mean(results_linear_max_Ts(s,3,:)) mean(results_linear_max_Ts(s,4,:)) mean(results_linear_max_Ts(s,5,:)) mean(results_linear_max_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_Ts(s,:) = results_linear_max_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 5000ms----denoise
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoise_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoise_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoise_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoise_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoise_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-2-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoise_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoise_Ts(s,1,:)) mean(results_linear_max_denoise_Ts(s,2,:)) mean(results_linear_max_denoise_Ts(s,3,:)) mean(results_linear_max_denoise_Ts(s,4,:)) mean(results_linear_max_denoise_Ts(s,5,:)) mean(results_linear_max_denoise_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoise_Ts(s,:) = results_linear_max_denoise_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 10000ms----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_Ts(s,1,:)) mean(results_linear_max_Ts(s,2,:)) mean(results_linear_max_Ts(s,3,:)) mean(results_linear_max_Ts(s,4,:)) mean(results_linear_max_Ts(s,5,:)) mean(results_linear_max_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_Ts(s,:) = results_linear_max_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----Ts 10000ms----denoise
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoise_Ts(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoise_Ts(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoise_Ts(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoise_Ts(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoise_Ts(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-1-indentperiod_Ts_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoise_Ts(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoise_Ts(s,1,:)) mean(results_linear_max_denoise_Ts(s,2,:)) mean(results_linear_max_denoise_Ts(s,3,:)) mean(results_linear_max_denoise_Ts(s,4,:)) mean(results_linear_max_denoise_Ts(s,5,:)) mean(results_linear_max_denoise_Ts(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoise_Ts(s,:) = results_linear_max_denoise_Ts(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%--- Ts plot ----
Ts_arr = 1e3*[100e-3 500e-3 1000e-3 5000e-3 10000e-3]; %s
results_max_Ts_arr = [mean(results_max_Ts(1,:)) mean(results_max_Ts(2,:)) mean(results_max_Ts(3,:)) mean(results_max_Ts(4,:)) mean(results_max_Ts(5,:))]
results_linear_maxfold_Ts_arr = [mean(results_linear_maxfold_Ts(1,:)) mean(results_linear_maxfold_Ts(2,:)) mean(results_linear_maxfold_Ts(3,:)) mean(results_linear_maxfold_Ts(4,:)) mean(results_linear_maxfold_Ts(5,:))]

[maxsoft,Isoft] = max(results_max_Ts_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_Ts_arr)

results_max_denoise_Ts_arr = [mean(results_max_denoise_Ts(1,:)) mean(results_max_denoise_Ts(2,:)) mean(results_max_denoise_Ts(3,:)) mean(results_max_denoise_Ts(4,:)) mean(results_max_denoise_Ts(5,:))]
results_linear_maxfold_denoise_Ts_arr = [mean(results_linear_maxfold_denoise_Ts(1,:)) mean(results_linear_maxfold_denoise_Ts(2,:)) mean(results_linear_maxfold_denoise_Ts(3,:)) mean(results_linear_maxfold_denoise_Ts(4,:)) mean(results_linear_maxfold_denoise_Ts(5,:))]

[maxsoft_denoise,Isoft_denoise] = max(results_max_denoise_Ts_arr);
[maxlinear_denoise,Ilinear_denoise] = max(results_linear_maxfold_denoise_Ts_arr)


h(1) = errorbar(Ts_arr, results_max_Ts_arr, [std(results_max_Ts(1,:)) std(results_max_Ts(2,:)) std(results_max_Ts(3,:)) std(results_max_Ts(4,:)) std(results_max_Ts(5,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(Ts_arr, results_linear_maxfold_Ts_arr, [std(results_linear_maxfold_Ts(1,:)) std(results_linear_maxfold_Ts(2,:)) std(results_linear_maxfold_Ts(3,:)) std(results_linear_maxfold_Ts(4,:)) std(results_linear_maxfold_Ts(5,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
%h(3) = errorbar(Ts_arr, results_max_denoise_Ts_arr, [std(results_max_denoise_Ts(1,:)) std(results_max_denoise_Ts(2,:)) std(results_max_denoise_Ts(3,:)) std(results_max_denoise_Ts(4,:)) std(results_max_denoise_Ts(5,:))],'--','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
%h(4) = errorbar(Ts_arr, results_linear_maxfold_denoise_Ts_arr, [std(results_linear_maxfold_denoise_Ts(1,:)) std(results_linear_maxfold_denoise_Ts(2,:)) std(results_linear_maxfold_denoise_Ts(3,:)) std(results_linear_maxfold_denoise_Ts(4,:)) std(results_linear_maxfold_denoise_Ts(5,:))],'--','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 

set(gca,'XScale','log');
xlabel('Time bin width (ms)')
ylabel('Classification Accuracy (6 k-folds)')
%title('vs time bin width')

%lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ AFE white noise=',num2str(wnoise_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(wnoise_arr(Ilinear))])
lgd = legend(h,['SNN: Max=',num2str(maxsoft*100),'% @ time bin width=',num2str(Ts_arr(Isoft)),'ms'],['SNN + Linear SVM: Max=',num2str(maxlinear*100),'% @ time bin width=',num2str(Ts_arr(Ilinear)),'ms'])
lgd.Location = 'Best';
xlim([0.5*Ts_arr(1) 2*Ts_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-sensor-Ts-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-sensor-Ts-',num2str(figi),'.png']);

%% Effect of denoise BW 
figi=figi+1;
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-50000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoisebw(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-10000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoisebw(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-5000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoisebw(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-1000-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoisebw(4,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SNN_ep-50-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-10000.0-Ts-500.0-k-6-denoise-500-dsetPath-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600/'
results_max_denoisebw(5,:) = parse_result(resultsPath)

%----SVM----
%--- denoiseBW 50000 us ----
s=1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoisebw(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoisebw(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoisebw(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoisebw(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoisebw(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-50000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoisebw(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoisebw(s,1,:)) mean(results_linear_max_denoisebw(s,2,:)) mean(results_linear_max_denoisebw(s,3,:)) mean(results_linear_max_denoisebw(s,4,:)) mean(results_linear_max_denoisebw(s,5,:)) mean(results_linear_max_denoisebw(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoisebw(s,:) = results_linear_max_denoisebw(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%--- denoiseBW 10000 us ----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoisebw(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoisebw(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoisebw(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoisebw(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoisebw(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-10000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoisebw(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoisebw(s,1,:)) mean(results_linear_max_denoisebw(s,2,:)) mean(results_linear_max_denoisebw(s,3,:)) mean(results_linear_max_denoisebw(s,4,:)) mean(results_linear_max_denoisebw(s,5,:)) mean(results_linear_max_denoisebw(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoisebw(s,:) = results_linear_max_denoisebw(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- denoiseBW 5000 us ----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoisebw(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoisebw(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoisebw(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoisebw(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoisebw(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-5000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoisebw(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoisebw(s,1,:)) mean(results_linear_max_denoisebw(s,2,:)) mean(results_linear_max_denoisebw(s,3,:)) mean(results_linear_max_denoisebw(s,4,:)) mean(results_linear_max_denoisebw(s,5,:)) mean(results_linear_max_denoisebw(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoisebw(s,:) = results_linear_max_denoisebw(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- denoiseBW 1000 us ----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoisebw(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoisebw(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoisebw(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoisebw(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoisebw(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-1000-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoisebw(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoisebw(s,1,:)) mean(results_linear_max_denoisebw(s,2,:)) mean(results_linear_max_denoisebw(s,3,:)) mean(results_linear_max_denoisebw(s,4,:)) mean(results_linear_max_denoisebw(s,5,:)) mean(results_linear_max_denoisebw(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoisebw(s,:) = results_linear_max_denoisebw(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- denoiseBW 500 us ----
s=s+1; 
resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-0/'
[results_linear_max_denoisebw(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-1/'
[results_linear_max_denoisebw(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-2/'
[results_linear_max_denoisebw(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-3/'
[results_linear_max_denoisebw(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-4/'
[results_linear_max_denoisebw(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_sensor/SVM_svmep-5-svm_wsize-20-indentperiod_denoise_sweep-denoise-500-sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod-trunc-1600-best-5/'
[results_linear_max_denoisebw(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_denoisebw(s,1,:)) mean(results_linear_max_denoisebw(s,2,:)) mean(results_linear_max_denoisebw(s,3,:)) mean(results_linear_max_denoisebw(s,4,:)) mean(results_linear_max_denoisebw(s,5,:)) mean(results_linear_max_denoisebw(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_denoisebw(s,:) = results_linear_max_denoisebw(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%--- denoisebw plot ----
denoisebw_arr = 1e-3*[50e3 10e3 5e3 1e3 500]; %ms
results_max_denoisebw_arr = [mean(results_max_denoisebw(1,:)) mean(results_max_denoisebw(2,:)) mean(results_max_denoisebw(3,:)) mean(results_max_denoisebw(4,:)) mean(results_max_denoisebw(5,:))]
results_linear_maxfold_denoisebw_arr = [mean(results_linear_maxfold_denoisebw(1,:)) mean(results_linear_maxfold_denoisebw(2,:)) mean(results_linear_maxfold_denoisebw(3,:)) mean(results_linear_maxfold_denoisebw(4,:)) mean(results_linear_maxfold_denoisebw(5,:))]

[maxsoft,Isoft] = max(results_max_denoisebw_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_denoisebw_arr)

h(1) = errorbar(denoisebw_arr, results_max_denoisebw_arr, [std(results_max_denoisebw(1,:)) std(results_max_denoisebw(2,:)) std(results_max_denoisebw(3,:)) std(results_max_denoisebw(4,:)) std(results_max_denoisebw(5,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(denoisebw_arr, results_linear_maxfold_denoisebw_arr, [std(results_linear_maxfold_denoisebw(1,:)) std(results_linear_maxfold_denoisebw(2,:)) std(results_linear_maxfold_denoisebw(3,:)) std(results_linear_maxfold_denoisebw(4,:)) std(results_linear_maxfold_denoisebw(5,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 

set(gca,'XScale','log');
xlabel('Denoise time window (ms)')
ylabel('Classification Accuracy (6 k-folds)')
%title('vs time bin width')

%lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ AFE white noise=',num2str(wnoise_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(wnoise_arr(Ilinear))])
lgd = legend(h,['SNN'],['SNN + Linear SVM'])
lgd.Location = 'Best';
xlim([0.5*denoisebw_arr(5) 2*denoisebw_arr(1)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-sensor-denoisebw-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-sensor-denoisebw-',num2str(figi),'.png']);
%%
function datarate = spkrate_to_datarate_lc(spkrate, mr_cnt)
    
    datarate = spkrate*(1+2*log2(sqrt(mr_cnt)));

end


function datarate = spkrate_to_datarate(spkrate, mr_cnt)
    
    datarate = spkrate*2*log2(sqrt(mr_cnt));

end


function datarate = frame_to_datarate(samplerate, bit_res, mr_cnt)
    
    datarate = samplerate * bit_res * mr_cnt;

end

function spikerate_ave = parse_spikerate(datasetPath,datasetSize)

    spikerate = 0;
    for i=1:datasetSize % go through the dataset
        filename = [datasetPath,num2str(i),'.bs2']
        TD = Read_Ndataset(filename);
        spikerate = spikerate + size(TD.ts,1);
    end

    spikerate_ave = spikerate / datasetSize;
end

function spikerate_ave = parse_spikerate_fromfile(datasetPath)
    fid = fopen([datasetPath,'ave_pop_nSpk.txt']);
    spikerate_ave =  fscanf(fid, ['%d\n'])

end

function results_max = parse_result(resultsPath)

    results_max = [];
    fid = fopen([resultsPath,'results_max.txt']);
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    results_max = [results_max; str2num(tline_tokens{2})];
    %while ischar(tline)
    for i=1:5
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        results_max = [results_max; str2num(tline_tokens{2})];   
    end

    results_max = results_max ./ 100;
    fclose(fid);
end

function [results_linear_max] = parse_result_svm(resultsPath)

    results_linear_max = [];
    fid = fopen([resultsPath,'results_svm_linear_max.txt']);
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    results_linear_max = [results_linear_max; str2num(tline_tokens{2})];
    %while ischar(tline)
    for i=1:5
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        results_linear_max = [results_linear_max; str2num(tline_tokens{2})];   
    end
    fclose(fid);

    results_linear_max = results_linear_max ./ 100;

end