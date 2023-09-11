clear all
close all
clearvars




figi=69;
kfolds=6


mr_cnt=192;

%% Effect of white noise on softmax SNN only
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_wnoise(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_wnoise(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_wnoise(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_wnoise(4,:) = parse_result(resultsPath)
%----SVM----
%----wnoise 0----

s=1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_wnoise(s,1,:)) mean(results_linear_max_wnoise(s,2,:)) mean(results_linear_max_wnoise(s,3,:)) mean(results_linear_max_wnoise(s,4,:)) mean(results_linear_max_wnoise(s,5,:)) mean(results_linear_max_wnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_wnoise(s,:) = results_linear_max_wnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

% ----wnoise 0----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)


mean_array_trainonclean = [mean(results_linear_max_wnoise_trainonclean(s,1,:)) mean(results_linear_max_wnoise_trainonclean(s,2,:)) mean(results_linear_max_wnoise_trainonclean(s,3,:)) mean(results_linear_max_wnoise_trainonclean(s,4,:)) mean(results_linear_max_wnoise_trainonclean(s,5,:)) mean(results_linear_max_wnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_wnoise_trainonclean(s,:) = results_linear_max_wnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----wnoise 0.01----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_wnoise(s,1,:)) mean(results_linear_max_wnoise(s,2,:)) mean(results_linear_max_wnoise(s,3,:)) mean(results_linear_max_wnoise(s,4,:)) mean(results_linear_max_wnoise(s,5,:)) mean(results_linear_max_wnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_wnoise(s,:) = results_linear_max_wnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

% ----wnoise 0.01----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0.01-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)


mean_array_trainonclean = [mean(results_linear_max_wnoise_trainonclean(s,1,:)) mean(results_linear_max_wnoise_trainonclean(s,2,:)) mean(results_linear_max_wnoise_trainonclean(s,3,:)) mean(results_linear_max_wnoise_trainonclean(s,4,:)) mean(results_linear_max_wnoise_trainonclean(s,5,:)) mean(results_linear_max_wnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_wnoise_trainonclean(s,:) = results_linear_max_wnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----wnoise 1----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_wnoise(s,1,:)) mean(results_linear_max_wnoise(s,2,:)) mean(results_linear_max_wnoise(s,3,:)) mean(results_linear_max_wnoise(s,4,:)) mean(results_linear_max_wnoise(s,5,:)) mean(results_linear_max_wnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_wnoise(s,:) = results_linear_max_wnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

% ----wnoise 1----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-1-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)


mean_array_trainonclean = [mean(results_linear_max_wnoise_trainonclean(s,1,:)) mean(results_linear_max_wnoise_trainonclean(s,2,:)) mean(results_linear_max_wnoise_trainonclean(s,3,:)) mean(results_linear_max_wnoise_trainonclean(s,4,:)) mean(results_linear_max_wnoise_trainonclean(s,5,:)) mean(results_linear_max_wnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_wnoise_trainonclean(s,:) = results_linear_max_wnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----wnoise 100----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_wnoise(s,1,:)) mean(results_linear_max_wnoise(s,2,:)) mean(results_linear_max_wnoise(s,3,:)) mean(results_linear_max_wnoise(s,4,:)) mean(results_linear_max_wnoise(s,5,:)) mean(results_linear_max_wnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_wnoise(s,:) = results_linear_max_wnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

% ----wnoise 100----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_wnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_wnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_wnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_wnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_wnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-wnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-100-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_wnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)


mean_array_trainonclean = [mean(results_linear_max_wnoise_trainonclean(s,1,:)) mean(results_linear_max_wnoise_trainonclean(s,2,:)) mean(results_linear_max_wnoise_trainonclean(s,3,:)) mean(results_linear_max_wnoise_trainonclean(s,4,:)) mean(results_linear_max_wnoise_trainonclean(s,5,:)) mean(results_linear_max_wnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_wnoise_trainonclean(s,:) = results_linear_max_wnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- wnoise plot ----
wnoise_arr = [0.01e-6 1e-6 100e-6];
results_max_wnoise_arr = [mean(results_max_wnoise(1,:)) mean(results_max_wnoise(2,:)) mean(results_max_wnoise(3,:)) mean(results_max_wnoise(4,:))]
results_linear_maxfold_wnoise_arr = [mean(results_linear_maxfold_wnoise(1,:)) mean(results_linear_max_wnoise(2,:)) mean(results_linear_maxfold_wnoise(3,:)) mean(results_linear_maxfold_wnoise(4,:))]

[maxsoft,Isoft] = max(results_max_wnoise_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_wnoise_arr);

results_linear_maxfold_wnoise_arr_trainonclean = [mean(results_linear_maxfold_wnoise_trainonclean(1,:)) mean(results_linear_max_wnoise_trainonclean(2,:)) mean(results_linear_maxfold_wnoise_trainonclean(3,:)) mean(results_linear_maxfold_wnoise_trainonclean(4,:))]

[maxlinear_trainonclean,Ilinear_trainonclean] = max(results_linear_maxfold_wnoise_arr_trainonclean);


h(1) = errorbar(wnoise_arr, results_max_wnoise_arr(2:4), [std(results_max_wnoise(2,:)) std(results_max_wnoise(3,:)) std(results_max_wnoise(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(wnoise_arr, results_linear_maxfold_wnoise_arr(2:4), [std(results_linear_maxfold_wnoise(2,:)) std(results_linear_maxfold_wnoise(3,:)) std(results_linear_maxfold_wnoise(4,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
% Plotting the first row as a line with error bar
h(3) = errorbar(wnoise_arr, [results_max_wnoise_arr(1) results_max_wnoise_arr(1) results_max_wnoise_arr(1)], [std(results_max_wnoise(1,:)) std(results_max_wnoise(1,:)) std(results_max_wnoise(1,:))],'--','Color','b','LineWidth',2);
h(4) = errorbar(wnoise_arr, [results_linear_maxfold_wnoise_arr(1) results_linear_maxfold_wnoise_arr(1) results_linear_maxfold_wnoise_arr(1)], [std(results_linear_maxfold_wnoise(1,:)) std(results_linear_maxfold_wnoise(1,:)) std(results_linear_maxfold_wnoise(1,:))],'--','Color','r','LineWidth',2);
% trainonclean
h(5) = errorbar(wnoise_arr, results_linear_maxfold_wnoise_arr_trainonclean(2:4), [std(results_linear_maxfold_wnoise_trainonclean(2,:)) std(results_linear_maxfold_wnoise_trainonclean(3,:)) std(results_linear_maxfold_wnoise_trainonclean(4,:))],'->','Color','g','LineWidth',3); 
h(6) = errorbar(wnoise_arr, [results_linear_maxfold_wnoise_arr_trainonclean(1) results_linear_maxfold_wnoise_arr_trainonclean(1) results_linear_maxfold_wnoise_arr_trainonclean(1)], [std(results_linear_maxfold_wnoise_trainonclean(1,:)) std(results_linear_maxfold_wnoise_trainonclean(1,:)) std(results_linear_maxfold_wnoise_trainonclean(1,:))],'--','Color','g','LineWidth',2);

set(gca,'XScale','log');
xlabel('AFE white noise power (V^{2})')
ylabel('Classification Accuracy (10 k-folds)')
title('vs AFE white noise')

%lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ AFE white noise=',num2str(wnoise_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(wnoise_arr(Ilinear))])
lgd = legend(h,['SNN'],['SNN + Linear SVM'],['SNN (ideal)'],['SNN + Linear SVM (ideal)'])
lgd.Location = 'Best';
xlim([0.5*wnoise_arr(1) 2*wnoise_arr(3)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;
h(3).MarkerSize = 8;
h(4).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;
h(3).LineWidth = 3;
h(4).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-wnoise-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-wnoise-',num2str(figi),'.png']);

%% Effect of flicker noise on softmax SNN only
figi=figi+1;
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_fnoise(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_fnoise(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_fnoise(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_fnoise(4,:) = parse_result(resultsPath)

%----SVM----
%----fnoise 0----

s=1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_fnoise(s,1,:)) mean(results_linear_max_fnoise(s,2,:)) mean(results_linear_max_fnoise(s,3,:)) mean(results_linear_max_fnoise(s,4,:)) mean(results_linear_max_fnoise(s,5,:)) mean(results_linear_max_fnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_fnoise(s,:) = results_linear_max_fnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----fnoise 0----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_fnoise_trainonclean(s,1,:)) mean(results_linear_max_fnoise_trainonclean(s,2,:)) mean(results_linear_max_fnoise_trainonclean(s,3,:)) mean(results_linear_max_fnoise_trainonclean(s,4,:)) mean(results_linear_max_fnoise_trainonclean(s,5,:)) mean(results_linear_max_fnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_fnoise_trainonclean(s,:) = results_linear_max_fnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%----fnoise 0.01----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_fnoise(s,1,:)) mean(results_linear_max_fnoise(s,2,:)) mean(results_linear_max_fnoise(s,3,:)) mean(results_linear_max_fnoise(s,4,:)) mean(results_linear_max_fnoise(s,5,:)) mean(results_linear_max_fnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_fnoise(s,:) = results_linear_max_fnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----fnoise 0.01----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.01-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_fnoise_trainonclean(s,1,:)) mean(results_linear_max_fnoise_trainonclean(s,2,:)) mean(results_linear_max_fnoise_trainonclean(s,3,:)) mean(results_linear_max_fnoise_trainonclean(s,4,:)) mean(results_linear_max_fnoise_trainonclean(s,5,:)) mean(results_linear_max_fnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_fnoise_trainonclean(s,:) = results_linear_max_fnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%----fnoise 0.1----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_fnoise(s,1,:)) mean(results_linear_max_fnoise(s,2,:)) mean(results_linear_max_fnoise(s,3,:)) mean(results_linear_max_fnoise(s,4,:)) mean(results_linear_max_fnoise(s,5,:)) mean(results_linear_max_fnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_fnoise(s,:) = results_linear_max_fnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----fnoise 0.1----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0.1-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_fnoise_trainonclean(s,1,:)) mean(results_linear_max_fnoise_trainonclean(s,2,:)) mean(results_linear_max_fnoise_trainonclean(s,3,:)) mean(results_linear_max_fnoise_trainonclean(s,4,:)) mean(results_linear_max_fnoise_trainonclean(s,5,:)) mean(results_linear_max_fnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_fnoise_trainonclean(s,:) = results_linear_max_fnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----fnoise 1----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_fnoise(s,1,:)) mean(results_linear_max_fnoise(s,2,:)) mean(results_linear_max_fnoise(s,3,:)) mean(results_linear_max_fnoise(s,4,:)) mean(results_linear_max_fnoise(s,5,:)) mean(results_linear_max_fnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_fnoise(s,:) = results_linear_max_fnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----fnoise 1----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-0/'
[results_linear_max_fnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-1/'
[results_linear_max_fnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-2/'
[results_linear_max_fnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-3/'
[results_linear_max_fnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-4/'
[results_linear_max_fnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-fnoise_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-1-mult-0-uV2-4-best-5/'
[results_linear_max_fnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_fnoise_trainonclean(s,1,:)) mean(results_linear_max_fnoise_trainonclean(s,2,:)) mean(results_linear_max_fnoise_trainonclean(s,3,:)) mean(results_linear_max_fnoise_trainonclean(s,4,:)) mean(results_linear_max_fnoise_trainonclean(s,5,:)) mean(results_linear_max_fnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_fnoise_trainonclean(s,:) = results_linear_max_fnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%--- fnoise plot ----
fnoise_arr = [0.01e-6 0.1e-6 1e-6];
results_max_fnoise_arr = [mean(results_max_fnoise(1,:)) mean(results_max_fnoise(2,:)) mean(results_max_fnoise(3,:))  mean(results_max_fnoise(4,:))]
results_linear_maxfold_fnoise_arr = [mean(results_linear_maxfold_fnoise(1,:)) mean(results_linear_max_fnoise(2,:)) mean(results_linear_maxfold_fnoise(3,:))  mean(results_linear_maxfold_fnoise(4,:))]

[maxsoft,Isoft] = max(results_max_fnoise_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_fnoise_arr);

results_linear_maxfold_fnoise_arr_trainonclean = [mean(results_linear_maxfold_fnoise_trainonclean(1,:)) mean(results_linear_max_fnoise_trainonclean(2,:)) mean(results_linear_maxfold_fnoise_trainonclean(3,:))  mean(results_linear_maxfold_fnoise_trainonclean(4,:))]
[maxlinear_trainonclean,Ilinear_trainonclean] = max(results_linear_maxfold_fnoise_arr_trainonclean);

h(1) = errorbar(fnoise_arr, results_max_fnoise_arr(2:4), [std(results_max_fnoise(2,:)) std(results_max_fnoise(3,:)) std(results_max_fnoise(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(fnoise_arr, results_linear_maxfold_fnoise_arr(2:4), [std(results_linear_maxfold_fnoise(2,:)) std(results_linear_maxfold_fnoise(3,:)) std(results_linear_maxfold_fnoise(4,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
% Plotting the first row as a line with error bar
h(3) = errorbar(fnoise_arr, [results_max_fnoise_arr(1) results_max_fnoise_arr(1) results_max_fnoise_arr(1)], [std(results_max_fnoise(1,:)) std(results_max_fnoise(1,:)) std(results_max_fnoise(1,:))],'--','Color','b','LineWidth',2);
h(4) = errorbar(fnoise_arr, [results_linear_maxfold_fnoise_arr(1) results_linear_maxfold_fnoise_arr(1) results_linear_maxfold_fnoise_arr(1)], [std(results_linear_maxfold_fnoise(1,:)) std(results_linear_maxfold_fnoise(1,:)) std(results_linear_maxfold_fnoise(1,:))],'--','Color','r','LineWidth',2);
h(5) = errorbar(fnoise_arr, results_linear_maxfold_fnoise_arr_trainonclean(2:4), [std(results_linear_maxfold_fnoise_trainonclean(2,:)) std(results_linear_maxfold_fnoise_trainonclean(3,:)) std(results_linear_maxfold_fnoise_trainonclean(4,:))],'->','Color','g','LineWidth',3); 
h(6) = errorbar(fnoise_arr, [results_linear_maxfold_fnoise_arr_trainonclean(1) results_linear_maxfold_fnoise_arr_trainonclean(1) results_linear_maxfold_fnoise_arr_trainonclean(1)], [std(results_linear_maxfold_fnoise_trainonclean(1,:)) std(results_linear_maxfold_fnoise_trainonclean(1,:)) std(results_linear_maxfold_fnoise_trainonclean(1,:))],'--','Color','g','LineWidth',2);



set(gca,'XScale','log');
xlabel('AFE flicker noise power at 1Hz (V^{2})')
ylabel('Classification Accuracy (10 k-folds)')
title('vs AFE flicker noise')

lgd = legend(h,['SNN'],['SNN + Linear SVM'],['SNN (ideal)'],['SNN + Linear SVM (ideal)'])
lgd.Location = 'Best';
xlim([0.5*fnoise_arr(1) 2*fnoise_arr(3)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;
h(3).MarkerSize = 8;
h(4).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;
h(3).LineWidth = 3;
h(4).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-fnoise-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-fnoise-',num2str(figi),'.png']);


%% Effect of threshold noise on softmax SNN only
figi=figi+1;
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thnoise(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thnoise(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thnoise(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thnoise(4,:) = parse_result(resultsPath)

%----SVM----
%----thnoise 0----

s=1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thnoise(s,1,:)) mean(results_linear_max_thnoise(s,2,:)) mean(results_linear_max_thnoise(s,3,:)) mean(results_linear_max_thnoise(s,4,:)) mean(results_linear_max_thnoise(s,5,:)) mean(results_linear_max_thnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thnoise(s,:) = results_linear_max_thnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 0----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thnoise_trainonclean(s,1,:)) mean(results_linear_max_thnoise_trainonclean(s,2,:)) mean(results_linear_max_thnoise_trainonclean(s,3,:)) mean(results_linear_max_thnoise_trainonclean(s,4,:)) mean(results_linear_max_thnoise_trainonclean(s,5,:)) mean(results_linear_max_thnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thnoise_trainonclean(s,:) = results_linear_max_thnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 0.01uV^2----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thnoise(s,1,:)) mean(results_linear_max_thnoise(s,2,:)) mean(results_linear_max_thnoise(s,3,:)) mean(results_linear_max_thnoise(s,4,:)) mean(results_linear_max_thnoise(s,5,:)) mean(results_linear_max_thnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thnoise(s,:) = results_linear_max_thnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 0.01uV^2----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-0.01-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thnoise_trainonclean(s,1,:)) mean(results_linear_max_thnoise_trainonclean(s,2,:)) mean(results_linear_max_thnoise_trainonclean(s,3,:)) mean(results_linear_max_thnoise_trainonclean(s,4,:)) mean(results_linear_max_thnoise_trainonclean(s,5,:)) mean(results_linear_max_thnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thnoise_trainonclean(s,:) = results_linear_max_thnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 1uV^2----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thnoise(s,1,:)) mean(results_linear_max_thnoise(s,2,:)) mean(results_linear_max_thnoise(s,3,:)) mean(results_linear_max_thnoise(s,4,:)) mean(results_linear_max_thnoise(s,5,:)) mean(results_linear_max_thnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thnoise(s,:) = results_linear_max_thnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 1uV^2----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-1-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thnoise_trainonclean(s,1,:)) mean(results_linear_max_thnoise_trainonclean(s,2,:)) mean(results_linear_max_thnoise_trainonclean(s,3,:)) mean(results_linear_max_thnoise_trainonclean(s,4,:)) mean(results_linear_max_thnoise_trainonclean(s,5,:)) mean(results_linear_max_thnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thnoise_trainonclean(s,:) = results_linear_max_thnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%----thnoise 100uV^2----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thnoise(s,1,:)) mean(results_linear_max_thnoise(s,2,:)) mean(results_linear_max_thnoise(s,3,:)) mean(results_linear_max_thnoise(s,4,:)) mean(results_linear_max_thnoise(s,5,:)) mean(results_linear_max_thnoise(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thnoise(s,:) = results_linear_max_thnoise(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thnoise 100uV^2----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thnoise_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thnoise_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thnoise_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thnoise_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thnoise_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thnoise_sweep_trainonclean-lcadc-0-uV2-100-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thnoise_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thnoise_trainonclean(s,1,:)) mean(results_linear_max_thnoise_trainonclean(s,2,:)) mean(results_linear_max_thnoise_trainonclean(s,3,:)) mean(results_linear_max_thnoise_trainonclean(s,4,:)) mean(results_linear_max_thnoise_trainonclean(s,5,:)) mean(results_linear_max_thnoise_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thnoise_trainonclean(s,:) = results_linear_max_thnoise_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- thnoise plot ----
thnoise_arr = [0.01e-6 1e-6 100e-6];
results_max_thnoise_arr = [mean(results_max_thnoise(1,:)) mean(results_max_thnoise(2,:)) mean(results_max_thnoise(3,:)) mean(results_max_thnoise(4,:))]
results_linear_maxfold_thnoise_arr = [mean(results_linear_maxfold_thnoise(1,:)) mean(results_linear_max_thnoise(2,:)) mean(results_linear_maxfold_thnoise(3,:)) mean(results_linear_maxfold_thnoise(4,:))]

[maxsoft,Isoft] = max(results_max_thnoise_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_thnoise_arr);

results_linear_maxfold_thnoise_arr_trainonclean = [mean(results_linear_maxfold_thnoise_trainonclean(1,:)) mean(results_linear_max_thnoise_trainonclean(2,:)) mean(results_linear_maxfold_thnoise_trainonclean(3,:)) mean(results_linear_maxfold_thnoise_trainonclean(4,:))]

[maxlinear_trainonclean,Ilinear_trainonclean] = max(results_linear_maxfold_thnoise_arr_trainonclean);

h(1) = errorbar(thnoise_arr, results_max_thnoise_arr(2:4), [std(results_max_thnoise(2,:)) std(results_max_thnoise(3,:)) std(results_max_thnoise(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(thnoise_arr, results_linear_maxfold_thnoise_arr(2:4), [std(results_linear_maxfold_thnoise(2,:)) std(results_linear_maxfold_thnoise(3,:)) std(results_linear_maxfold_thnoise(4,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
% Plotting the first row as a line with error bar
h(3) = errorbar(thnoise_arr, [results_max_thnoise_arr(1) results_max_thnoise_arr(1) results_max_thnoise_arr(1)], [std(results_max_thnoise(1,:)) std(results_max_thnoise(1,:)) std(results_max_thnoise(1,:))],'--','Color','b','LineWidth',2);
h(4) = errorbar(thnoise_arr, [results_linear_maxfold_thnoise_arr(1) results_linear_maxfold_thnoise_arr(1) results_linear_maxfold_thnoise_arr(1)], [std(results_linear_maxfold_thnoise(1,:)) std(results_linear_maxfold_thnoise(1,:)) std(results_linear_maxfold_thnoise(1,:))],'--','Color','r','LineWidth',2);
h(5) = errorbar(thnoise_arr, results_linear_maxfold_thnoise_arr_trainonclean(2:4), [std(results_linear_maxfold_thnoise_trainonclean(2,:)) std(results_linear_maxfold_thnoise_trainonclean(3,:)) std(results_linear_maxfold_thnoise_trainonclean(4,:))],'->','Color','g','LineWidth',3); 
h(6) = errorbar(thnoise_arr, [results_linear_maxfold_thnoise_arr_trainonclean(1) results_linear_maxfold_thnoise_arr_trainonclean(1) results_linear_maxfold_thnoise_arr_trainonclean(1)], [std(results_linear_maxfold_thnoise_trainonclean(1,:)) std(results_linear_maxfold_thnoise_trainonclean(1,:)) std(results_linear_maxfold_thnoise_trainonclean(1,:))],'--','Color','g','LineWidth',2);


set(gca,'XScale','log');
xlabel('Threshold Noise Power (V^{2})')
ylabel('Classification Accuracy (10 k-folds)')
title('vs Spiking Threshold white noise')

lgd = legend(h,['SNN'],['SNN + Linear SVM'],['SNN (ideal)'],['SNN + Linear SVM (ideal)'])
lgd.Location = 'Best';
xlim([0.5*thnoise_arr(1) 2*thnoise_arr(3)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;
h(3).MarkerSize = 8;
h(4).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;
h(3).LineWidth = 3;
h(4).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-thnoise-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-thnoise-',num2str(figi),'.png']);


%% Effect of threshold mismatch on softmax SNN only
figi=figi+1;
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thmismatch(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thmismatch(2,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thmismatch(3,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_thmismatch(4,:) = parse_result(resultsPath)

%----SVM----
%----thmismatch 0----

s=1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thmismatch(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thmismatch(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thmismatch(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thmismatch(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thmismatch(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thmismatch(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thmismatch(s,1,:)) mean(results_linear_max_thmismatch(s,2,:)) mean(results_linear_max_thmismatch(s,3,:)) mean(results_linear_max_thmismatch(s,4,:)) mean(results_linear_max_thmismatch(s,5,:)) mean(results_linear_max_thmismatch(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thmismatch(s,:) = results_linear_max_thmismatch(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thmismatch 0----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_thmismatch_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_thmismatch_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_thmismatch_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_thmismatch_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_thmismatch_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_thmismatch_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thmismatch_trainonclean(s,1,:)) mean(results_linear_max_thmismatch_trainonclean(s,2,:)) mean(results_linear_max_thmismatch_trainonclean(s,3,:)) mean(results_linear_max_thmismatch_trainonclean(s,4,:)) mean(results_linear_max_thmismatch_trainonclean(s,5,:)) mean(results_linear_max_thmismatch_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thmismatch_trainonclean(s,:) = results_linear_max_thmismatch_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thmismatch 1mVrms----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-0/'
[results_linear_max_thmismatch(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-1/'
[results_linear_max_thmismatch(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-2/'
[results_linear_max_thmismatch(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-3/'
[results_linear_max_thmismatch(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-4/'
[results_linear_max_thmismatch(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-5/'
[results_linear_max_thmismatch(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thmismatch(s,1,:)) mean(results_linear_max_thmismatch(s,2,:)) mean(results_linear_max_thmismatch(s,3,:)) mean(results_linear_max_thmismatch(s,4,:)) mean(results_linear_max_thmismatch(s,5,:)) mean(results_linear_max_thmismatch(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thmismatch(s,:) = results_linear_max_thmismatch(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thmismatch 1mVrms----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-0/'
[results_linear_max_thmismatch_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-1/'
[results_linear_max_thmismatch_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-2/'
[results_linear_max_thmismatch_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-3/'
[results_linear_max_thmismatch_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-4/'
[results_linear_max_thmismatch_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-1-uV2-4-best-5/'
[results_linear_max_thmismatch_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thmismatch_trainonclean(s,1,:)) mean(results_linear_max_thmismatch_trainonclean(s,2,:)) mean(results_linear_max_thmismatch_trainonclean(s,3,:)) mean(results_linear_max_thmismatch_trainonclean(s,4,:)) mean(results_linear_max_thmismatch_trainonclean(s,5,:)) mean(results_linear_max_thmismatch_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thmismatch_trainonclean(s,:) = results_linear_max_thmismatch_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%----thmismatch 10mVrms----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-0/'
[results_linear_max_thmismatch(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-1/'
[results_linear_max_thmismatch(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-2/'
[results_linear_max_thmismatch(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-3/'
[results_linear_max_thmismatch(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-4/'
[results_linear_max_thmismatch(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-5/'
[results_linear_max_thmismatch(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thmismatch(s,1,:)) mean(results_linear_max_thmismatch(s,2,:)) mean(results_linear_max_thmismatch(s,3,:)) mean(results_linear_max_thmismatch(s,4,:)) mean(results_linear_max_thmismatch(s,5,:)) mean(results_linear_max_thmismatch(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thmismatch(s,:) = results_linear_max_thmismatch(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thmismatch 10mVrms----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-0/'
[results_linear_max_thmismatch_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-1/'
[results_linear_max_thmismatch_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-2/'
[results_linear_max_thmismatch_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-3/'
[results_linear_max_thmismatch_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-4/'
[results_linear_max_thmismatch_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-100-uV2-4-best-5/'
[results_linear_max_thmismatch_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thmismatch_trainonclean(s,1,:)) mean(results_linear_max_thmismatch_trainonclean(s,2,:)) mean(results_linear_max_thmismatch_trainonclean(s,3,:)) mean(results_linear_max_thmismatch_trainonclean(s,4,:)) mean(results_linear_max_thmismatch_trainonclean(s,5,:)) mean(results_linear_max_thmismatch_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thmismatch_trainonclean(s,:) = results_linear_max_thmismatch_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%----thmismatch 100mVrms----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-0/'
[results_linear_max_thmismatch(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-1/'
[results_linear_max_thmismatch(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-2/'
[results_linear_max_thmismatch(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-3/'
[results_linear_max_thmismatch(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-4/'
[results_linear_max_thmismatch(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-5/'
[results_linear_max_thmismatch(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_thmismatch(s,1,:)) mean(results_linear_max_thmismatch(s,2,:)) mean(results_linear_max_thmismatch(s,3,:)) mean(results_linear_max_thmismatch(s,4,:)) mean(results_linear_max_thmismatch(s,5,:)) mean(results_linear_max_thmismatch(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_thmismatch(s,:) = results_linear_max_thmismatch(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----thmismatch 100mVrms----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-0/'
[results_linear_max_thmismatch_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-1/'
[results_linear_max_thmismatch_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-2/'
[results_linear_max_thmismatch_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-3/'
[results_linear_max_thmismatch_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-4/'
[results_linear_max_thmismatch_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-thmismatch_sweep_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-10000-uV2-4-best-5/'
[results_linear_max_thmismatch_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_thmismatch_trainonclean(s,1,:)) mean(results_linear_max_thmismatch_trainonclean(s,2,:)) mean(results_linear_max_thmismatch_trainonclean(s,3,:)) mean(results_linear_max_thmismatch_trainonclean(s,4,:)) mean(results_linear_max_thmismatch_trainonclean(s,5,:)) mean(results_linear_max_thmismatch_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_thmismatch_trainonclean(s,:) = results_linear_max_thmismatch_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%--- thmismatch plot ----
thmismatch_arr = [1e-3 10e-3 100e-3];
results_max_thmismatch_arr = [mean(results_max_thmismatch(1,:)) mean(results_max_thmismatch(2,:)) mean(results_max_thmismatch(3,:)) mean(results_max_thmismatch(4,:))]
results_linear_maxfold_thmismatch_arr = [mean(results_linear_maxfold_thmismatch(1,:)) mean(results_linear_max_thmismatch(2,:)) mean(results_linear_maxfold_thmismatch(3,:)) mean(results_linear_maxfold_thmismatch(4,:))]

[maxsoft,Isoft] = max(results_max_thmismatch_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_thmismatch_arr);

results_linear_maxfold_thmismatch_arr_trainonclean = [mean(results_linear_maxfold_thmismatch_trainonclean(1,:)) mean(results_linear_max_thmismatch_trainonclean(2,:)) mean(results_linear_maxfold_thmismatch_trainonclean(3,:)) mean(results_linear_maxfold_thmismatch_trainonclean(4,:))]
[maxlinear_trainonclean,Ilinear_trainonclean] = max(results_linear_maxfold_thmismatch_arr_trainonclean);


h(1) = errorbar(thmismatch_arr, results_max_thmismatch_arr(2:4), [std(results_max_thmismatch(2,:)) std(results_max_thmismatch(3,:)) std(results_max_thmismatch(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(thmismatch_arr, results_linear_maxfold_thmismatch_arr(2:4), [std(results_linear_maxfold_thmismatch(2,:)) std(results_linear_maxfold_thmismatch(3,:)) std(results_linear_maxfold_thmismatch(4,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
% Plotting the first row as a line with error bar
h(3) = errorbar(thmismatch_arr, [results_max_thmismatch_arr(1) results_max_thmismatch_arr(1) results_max_thmismatch_arr(1)], [std(results_max_thmismatch(1,:)) std(results_max_thmismatch(1,:)) std(results_max_thmismatch(1,:))],'--','Color','b','LineWidth',2);
h(4) = errorbar(thmismatch_arr, [results_linear_maxfold_thmismatch_arr(1) results_linear_maxfold_thmismatch_arr(1) results_linear_maxfold_thmismatch_arr(1)], [std(results_linear_maxfold_thmismatch(1,:)) std(results_linear_maxfold_thmismatch(1,:)) std(results_linear_maxfold_thmismatch(1,:))],'--','Color','r','LineWidth',2);
h(5) = errorbar(thmismatch_arr, results_linear_maxfold_thmismatch_arr_trainonclean(2:4), [std(results_linear_maxfold_thmismatch_trainonclean(2,:)) std(results_linear_maxfold_thmismatch_trainonclean(3,:)) std(results_linear_maxfold_thmismatch_trainonclean(4,:))],'->','Color','g','LineWidth',3); 
h(6) = errorbar(thmismatch_arr, [results_linear_maxfold_thmismatch_arr_trainonclean(1) results_linear_maxfold_thmismatch_arr_trainonclean(1) results_linear_maxfold_thmismatch_arr_trainonclean(1)], [std(results_linear_maxfold_thmismatch_trainonclean(1,:)) std(results_linear_maxfold_thmismatch_trainonclean(1,:)) std(results_linear_maxfold_thmismatch_trainonclean(1,:))],'--','Color','g','LineWidth',2);



%set(gca,'XScale','log');
xlabel('Threshold Mismatch (V_{RMS})')
ylabel('Classification Accuracy (10 k-folds)')
title('vs Spiking Threshold Mismatch')

lgd = legend(h,['SNN'],['SNN + Linear SVM'],['SNN (ideal)'],['SNN + Linear SVM (ideal)'])
lgd.Location = 'Best';
xlim([thmismatch_arr(1)-0.01 thmismatch_arr(3)+0.01])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;
h(3).MarkerSize = 8;
h(4).MarkerSize = 8;

h(1).LineWidth = 3;
h(2).LineWidth = 3;
h(3).LineWidth = 3;
h(4).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-thmismatch-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-thmismatch-',num2str(figi),'.png']);

%% Effect of combined non-idealities on softmax SNN only
figi=figi+1;
figure(figi)

%----SNN-------
resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_cleannoisy(1,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier/SNN_ep-150-isize-2-16-12-hsize-256-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-ALL_N_lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip_lchpf--1to40-1to40_sorted/'
results_max_cleannoisy(2,:) = parse_result(resultsPath)


%----SVM----
%----clean----

s=1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_cleannoisy(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_cleannoisy(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_cleannoisy(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_cleannoisy(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_cleannoisy(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_cleannoisy(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_cleannoisy(s,1,:)) mean(results_linear_max_cleannoisy(s,2,:)) mean(results_linear_max_cleannoisy(s,3,:)) mean(results_linear_max_cleannoisy(s,4,:)) mean(results_linear_max_cleannoisy(s,5,:)) mean(results_linear_max_cleannoisy(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_cleannoisy(s,:) = results_linear_max_cleannoisy(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----clean----train on clean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-0/'
[results_linear_max_cleannoisy_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-1/'
[results_linear_max_cleannoisy_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-2/'
[results_linear_max_cleannoisy_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-3/'
[results_linear_max_cleannoisy_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-4/'
[results_linear_max_cleannoisy_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-0-uV2-0-uV2-0-mult-0-uV2-4-best-5/'
[results_linear_max_cleannoisy_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_cleannoisy_trainonclean(s,1,:)) mean(results_linear_max_cleannoisy_trainonclean(s,2,:)) mean(results_linear_max_cleannoisy_trainonclean(s,3,:)) mean(results_linear_max_cleannoisy_trainonclean(s,4,:)) mean(results_linear_max_cleannoisy_trainonclean(s,5,:)) mean(results_linear_max_cleannoisy_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_cleannoisy_trainonclean(s,:) = results_linear_max_cleannoisy_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----ALL non-idealities----
s=s+1; 
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-0/'
[results_linear_max_cleannoisy(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-1/'
[results_linear_max_cleannoisy(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-2/'
[results_linear_max_cleannoisy(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-3/'
[results_linear_max_cleannoisy(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-4/'
[results_linear_max_cleannoisy(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-5/'
[results_linear_max_cleannoisy(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_cleannoisy(s,1,:)) mean(results_linear_max_cleannoisy(s,2,:)) mean(results_linear_max_cleannoisy(s,3,:)) mean(results_linear_max_cleannoisy(s,4,:)) mean(results_linear_max_cleannoisy(s,5,:)) mean(results_linear_max_cleannoisy(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_cleannoisy(s,:) = results_linear_max_cleannoisy(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%----ALL non-idealities----trainonclean
resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-0/'
[results_linear_max_cleannoisy_trainonclean(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-1/'
[results_linear_max_cleannoisy_trainonclean(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-2/'
[results_linear_max_cleannoisy_trainonclean(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-3/'
[results_linear_max_cleannoisy_trainonclean(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-4/'
[results_linear_max_cleannoisy_trainonclean(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier/SVM_svmep-5-svm_wsize-40-clean_noisy_trainonclean-lcadc-0-uV2-100-uV2-100-uV2-1-mult-0.01-uV2-4-best-5/'
[results_linear_max_cleannoisy_trainonclean(s,6,:)]= parse_result_svm(resultsPath)

mean_array_trainonclean = [mean(results_linear_max_cleannoisy_trainonclean(s,1,:)) mean(results_linear_max_cleannoisy_trainonclean(s,2,:)) mean(results_linear_max_cleannoisy_trainonclean(s,3,:)) mean(results_linear_max_cleannoisy_trainonclean(s,4,:)) mean(results_linear_max_cleannoisy_trainonclean(s,5,:)) mean(results_linear_max_cleannoisy_trainonclean(s,6,:))]
[~,foldidx] = max(mean_array_trainonclean)
results_linear_maxfold_cleannoisy_trainonclean(s,:) = results_linear_max_cleannoisy_trainonclean(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%--- combined nonidealities plot ----
cleannoisy_arr = [0 1];
results_max_cleannoisy_arr = [mean(results_max_cleannoisy(1,:)) mean(results_max_cleannoisy(2,:))]
results_linear_maxfold_cleannoisy_arr = [mean(results_linear_maxfold_cleannoisy(1,:)) mean(results_linear_max_cleannoisy(2,:))]

[maxsoft,Isoft] = max(results_max_cleannoisy_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_cleannoisy_arr);

results_linear_maxfold_cleannoisy_arr_trainonclean = [mean(results_linear_maxfold_cleannoisy_trainonclean(1,:)) mean(results_linear_max_cleannoisy_trainonclean(2,:))]
[maxlinear_trainonclean,Ilinear_trainonclean] = max(results_linear_maxfold_cleannoisy_arr_trainonclean);

h(1) = errorbar(cleannoisy_arr, results_max_cleannoisy_arr, [std(results_max_cleannoisy(1,:)) std(results_max_cleannoisy(2,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(cleannoisy_arr, results_linear_maxfold_cleannoisy_arr, [std(results_linear_maxfold_cleannoisy(1,:)) std(results_linear_maxfold_cleannoisy(2,:))],'->','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
h(3) = errorbar(cleannoisy_arr, results_linear_maxfold_cleannoisy_arr_trainonclean, [std(results_linear_maxfold_cleannoisy_trainonclean(1,:)) std(results_linear_maxfold_cleannoisy_trainonclean(2,:))],'->','Color','g','LineWidth',3); 


%set(gca,'XScale','log');
xlabel('Non-idealities')
ylabel('Classification Accuracy (10 k-folds)')
title('vs Combined Non-idealities')

lgd = legend(h,['SNN'],['SNN + Linear SVM'],['SNN (ideal)'],['SNN + Linear SVM (ideal)'])
lgd.Location = 'Best';
%xlim([cleannoisy_arr(1)-0.01 cleannoisy_arr(2)+0.01])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 8;
h(2).MarkerSize = 8;


h(1).LineWidth = 3;
h(2).LineWidth = 3;


set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-cleannoisy-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-cleannoisy-',num2str(figi),'.png']);
%% Combined plots for paper
figi=figi+1;
figure(figi)

hold on;

% Add labels on each data point for each array
data_arrays = {results_linear_maxfold_wnoise_arr, results_linear_maxfold_fnoise_arr, results_linear_maxfold_thnoise_arr, results_linear_maxfold_thmismatch_arr};
sweep_arrays = {[0 wnoise_arr], [0 1e-6*fnoise_arr], [0 thnoise_arr], [0 thmismatch_arr.^2]}
colors = {[0 0.4470 0.7410], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880]};
dummy_arr = [1 2 3 4]
h(1) = errorbar(dummy_arr, results_linear_maxfold_cleannoisy_arr(1)*ones(size(dummy_arr)), std(results_linear_maxfold_cleannoisy(1,:))*ones(size(dummy_arr)),'--','Color',[0.6350 0.0780 0.1840],'LineWidth',3); 
h(2) = errorbar(dummy_arr, results_linear_maxfold_cleannoisy_arr(2)*ones(size(dummy_arr)), std(results_linear_maxfold_cleannoisy(2,:))*ones(size(dummy_arr)),'--','Color',[0.6350 0.0780 0.1840],'LineWidth',3); 
h(3) = errorbar(dummy_arr, results_linear_maxfold_wnoise_arr(1:4), [std(results_linear_maxfold_wnoise(1,:)) std(results_linear_maxfold_wnoise(2,:)) std(results_linear_maxfold_wnoise(3,:)) std(results_linear_maxfold_wnoise(4,:))],'->','Color',colors{1},'LineWidth',3); 
h(4) = errorbar(dummy_arr, results_linear_maxfold_fnoise_arr(1:4), [std(results_linear_maxfold_fnoise(1,:)) std(results_linear_maxfold_fnoise(2,:)) std(results_linear_maxfold_fnoise(3,:)) std(results_linear_maxfold_fnoise(4,:))],'->','Color',colors{2},'LineWidth',3); 
h(5) = errorbar(dummy_arr, results_linear_maxfold_thnoise_arr(1:4), [std(results_linear_maxfold_thnoise(1,:)) std(results_linear_maxfold_thnoise(2,:)) std(results_linear_maxfold_thnoise(3,:)) std(results_linear_maxfold_thnoise(4,:))],'->','Color',colors{3},'LineWidth',3); 
h(6) = errorbar(dummy_arr, results_linear_maxfold_thmismatch_arr(1:4), [std(results_linear_maxfold_thmismatch(1,:)) std(results_linear_maxfold_thmismatch(2,:)) std(results_linear_maxfold_thmismatch(3,:)) std(results_linear_maxfold_thmismatch(4,:))],'->','Color',colors{4},'LineWidth',3); 


for array_idx = 1:length(sweep_arrays)
    data_arr = data_arrays{array_idx};
    sweep_arr = sweep_arrays{array_idx};
    color = colors{array_idx};
    
    for i = 1:numel(dummy_arr)
        x = dummy_arr(i);
        y = data_arr(i);
        label_str = sprintf('%.0e', sweep_arr(i));
        text(x, y, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', color, 'FontSize', 10); % Adjust font size if needed

    end
end

%xlabel('X-axis Label');
ylabel(['Classification Accuracies',newline,'(10 k-folds)']);
%title('Your Plot Title');
grid on;
hold off;
micasplot
lgd = legend(h,['Ideal spikes'],['Combined non-idealities'],['vs AFE white noise (V^{2})'],['vs AFE flicker noise (V^{2}/Hz @ 1Hz)'],['vs threshold white noise (V^{2})'],['vs threshold mismatch (V^{2})'])
lgd.Location = 'Best';
set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-combinedall-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-combinedall-',num2str(figi),'.png']);

grid off;
grid off;
%% Combined plots for paper

h=[];
figi=figi+1;
figure(figi)

wnoise_arr_ext = [1e-9 wnoise_arr]; % replace 0 with small value
fnoise_arr_ext = [1e-9 fnoise_arr];
thnoise_arr_ext = [1e-9 thnoise_arr];
thmismatch_arr_ext = [1e-4 thmismatch_arr];
thmismatch_arr_ext = thmismatch_arr_ext.^2;

subplot(4,1,1)

%h(1) = errorbar(wnoise_arr_ext, results_linear_maxfold_cleannoisy_arr(1)*ones(size(wnoise_arr_ext)), std(results_linear_maxfold_cleannoisy(1,:))*ones(size(wnoise_arr_ext)),'--','Color',[0.6350 0.0780 0.1840],'LineWidth',3); 
hold on; 
%h(2) = errorbar(wnoise_arr_ext, results_linear_maxfold_cleannoisy_arr(2)*ones(size(wnoise_arr_ext)), std(results_linear_maxfold_cleannoisy(2,:))*ones(size(wnoise_arr_ext)),'--','Color',[0.8500 0.3250 0.0980],'LineWidth',3); 
h(1) = errorbar(wnoise_arr_ext, results_linear_maxfold_wnoise_arr(1:4)./results_linear_maxfold_wnoise_arr(1), [std(results_linear_maxfold_wnoise(1,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise(2,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise(3,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise(4,:))./results_linear_maxfold_wnoise_arr(1)],'->','Color',colors{1},'LineWidth',3); 
h(2) = errorbar(wnoise_arr_ext, results_linear_maxfold_wnoise_arr_trainonclean(1:4)./results_linear_maxfold_wnoise_arr(1), [std(results_linear_maxfold_wnoise_trainonclean(1,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise_trainonclean(2,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise_trainonclean(3,:))./results_linear_maxfold_wnoise_arr(1) std(results_linear_maxfold_wnoise_trainonclean(4,:))./results_linear_maxfold_wnoise_arr(1)],'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3); 
xlim([0 max(wnoise_arr_ext)])
xlab_wnoise= xlabel('AFE white noise power (V^{2})')
ylab_wnoise= ylabel(['Normalized',newline,'Classification',newline,'Accuracy',newline,' (10 k-folds)'])
hold off;
xticks = unique([0 wnoise_arr_ext(2:4)]);
set(gca, 'YGrid', 'on');
set(gca, 'YTick', 0:0.05:1.5*max(results_linear_maxfold_wnoise_arr(1)));
set(gca,'XScale','log');
set(gca, 'XTick', xticks, 'XTickLabel', xticks);

subplot(4,1,2)
hold on; 
h(1) = errorbar(fnoise_arr_ext, results_linear_maxfold_fnoise_arr(1:4)./results_linear_maxfold_fnoise_arr(1), [std(results_linear_maxfold_fnoise(1,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise(2,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise(3,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise(4,:))./results_linear_maxfold_fnoise_arr(1)],'->','Color',colors{1},'LineWidth',3); 
h(2) = errorbar(fnoise_arr_ext, results_linear_maxfold_fnoise_arr_trainonclean(1:4)./results_linear_maxfold_fnoise_arr(1), [std(results_linear_maxfold_fnoise_trainonclean(1,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise_trainonclean(2,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise_trainonclean(3,:))./results_linear_maxfold_fnoise_arr(1) std(results_linear_maxfold_fnoise_trainonclean(4,:))./results_linear_maxfold_fnoise_arr(1)],'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3); 
xlim([0 max(fnoise_arr_ext)])
xlab_fnoise= xlabel('AFE flicker noise power at 1Hz (V^{2}/Hz)')
ylab_fnoise= ylabel(['Normalized',newline,'Classification',newline,'Accuracy',newline,' (10 k-folds)'])
hold off;
xticks = unique([0 fnoise_arr_ext(2:4)]);
set(gca, 'YGrid', 'on');
set(gca, 'YTick', 0:0.05:1.5*max(results_linear_maxfold_fnoise_arr(1)));
set(gca,'XScale','log');
set(gca, 'XTick', xticks, 'XTickLabel', xticks);

subplot(4,1,3)
hold on; 
h(1) = errorbar(thnoise_arr_ext, results_linear_maxfold_thnoise_arr(1:4)./results_linear_maxfold_thnoise_arr(1), [std(results_linear_maxfold_thnoise(1,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise(2,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise(3,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise(4,:))./results_linear_maxfold_thnoise_arr(1)],'->','Color',colors{1},'LineWidth',3); 
h(2) = errorbar(thnoise_arr_ext, results_linear_maxfold_thnoise_arr_trainonclean(1:4)./results_linear_maxfold_thnoise_arr(1), [std(results_linear_maxfold_thnoise_trainonclean(1,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise_trainonclean(2,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise_trainonclean(3,:))./results_linear_maxfold_thnoise_arr(1) std(results_linear_maxfold_thnoise_trainonclean(4,:))./results_linear_maxfold_thnoise_arr(1)],'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3); 
xlim([0 max(thnoise_arr_ext)])
xlab_thnoise= xlabel('Spiking Threshold Noise Power (V^{2})')
ylab_thnoise= ylabel(['Normalized',newline,'Classification',newline,'Accuracy',newline,' (10 k-folds)'])
hold off;
xticks = unique([0 thnoise_arr_ext(2:4)]);
set(gca, 'YGrid', 'on');
set(gca, 'YTick', 0:0.05:1.5*max(results_linear_maxfold_thnoise_arr(1)));
set(gca,'XScale','log');
set(gca, 'XTick', xticks, 'XTickLabel', xticks);

subplot(4,1,4)
hold on; 
h(1) = errorbar(thmismatch_arr_ext(1:3), results_linear_maxfold_thmismatch_arr(1:3)./results_linear_maxfold_thmismatch_arr(1), [std(results_linear_maxfold_thmismatch(1,:))./results_linear_maxfold_thmismatch_arr(1) std(results_linear_maxfold_thmismatch(2,:))./results_linear_maxfold_thmismatch_arr(1) std(results_linear_maxfold_thmismatch(3,:))./results_linear_maxfold_thmismatch_arr(1)],'->','Color',colors{1},'LineWidth',3); 
h(2) = errorbar(thmismatch_arr_ext(1:3), results_linear_maxfold_thmismatch_arr_trainonclean(1:3)./results_linear_maxfold_thmismatch_arr(1), [std(results_linear_maxfold_thmismatch_trainonclean(1,:))./results_linear_maxfold_thmismatch_arr(1) std(results_linear_maxfold_thmismatch_trainonclean(2,:))./results_linear_maxfold_thmismatch_arr(1) std(results_linear_maxfold_thmismatch_trainonclean(3,:))./results_linear_maxfold_thmismatch_arr(1)],'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3); 
xlim([0 max(thmismatch_arr_ext(1:3))])
xlab_thmismatch= xlabel('Spiking Threshold Noise Mismatch (V^{2})')
ylab_thmismatch= ylabel(['Normalized',newline,'Classification',newline,'Accuracy',newline,' (10 k-folds)'])
xticks = unique([0 thmismatch_arr_ext(2:3)]);
set(gca, 'YGrid', 'on');
set(gca, 'YTick', 0:0.05:1.5*max(results_linear_maxfold_thmismatch_arr(1)));
set(gca,'XScale','log');
set(gca, 'XTick', xticks, 'XTickLabel', xticks);
hold off;
grid off;
lgd = legend(h,'Trained on noisy data','Trained on clean data');



micasplot

% Change font size of x-axis label and y-axis label using handle
set(xlab_wnoise, 'FontSize', 12); % Adjust font size as needed
set(ylab_wnoise, 'FontSize', 10); % Adjust font size as needed
set(xlab_fnoise, 'FontSize', 12); % Adjust font size as needed
set(ylab_fnoise, 'FontSize', 10); % Adjust font size as needed
set(xlab_thnoise, 'FontSize', 12); % Adjust font size as needed
set(ylab_thnoise, 'FontSize', 10); % Adjust font size as needed
set(xlab_thmismatch, 'FontSize', 12); % Adjust font size as needed
set(ylab_thmismatch, 'FontSize', 10); % Adjust font size as needed


lgd.Location = 'Northwest';
set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 10; 

set(gcf, 'Position', [100, 100, 1000, 900]); saveas(gcf,['Kyl6-combinedall2-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-combinedall2-',num2str(figi),'.png']);

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
    for i=1:9
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        results_linear_max = [results_linear_max; str2num(tline_tokens{2})];   
    end
    fclose(fid);

    results_linear_max = results_linear_max ./ 100;

end