%% for sensor spikes
clear all
close all
clearvars




figi=1;
kfolds=6


mr_cnt=8;

%% Effect of Ts on softmax SNN only

%%====tmax_ms=100=====
s=1; % used to index sweep variable (tmax_ms)
%----SNN-------

%VMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875/'
results_max_imode_vil_0p875_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925/'
results_max_imode_vil_0p925_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast/'
results_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast/'
results_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-100.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast/'
results_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)



%----SVM----
%VMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%IMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-0/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-1/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-2/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-3/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-4/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-5/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-0/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-1/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-2/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-3/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-4/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-5/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-0/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-1/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-2/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-3/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-4/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-5/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-0/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-1/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-2/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-3/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-4/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-5/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-0/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-1/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-2/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-3/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-4/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-10-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-5/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%%====tmax_ms=200=====
s=2; % used to index sweep variable (tmax_ms)
%----SNN-------

%VMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875/'
results_max_imode_vil_0p875_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925/'
results_max_imode_vil_0p925_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast/'
results_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast/'
results_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-200.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast/'
results_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)



%----SVM----
%VMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%IMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-0/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-1/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-2/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-3/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-4/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-5/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-0/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-1/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-2/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-3/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-4/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-5/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-0/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-1/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-2/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-3/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-4/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-5/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-0/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-1/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-2/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-3/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-4/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-5/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-0/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-1/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-2/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-3/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-4/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-20-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-5/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%%====tmax_ms=300=====
s=3; % used to index sweep variable (tmax_ms)
%----SNN-------

%VMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875/'
results_max_imode_vil_0p875_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925/'
results_max_imode_vil_0p925_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast/'
results_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast/'
results_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-300.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast/'
results_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)



%----SVM----
%VMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%IMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-0/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-1/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-2/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-3/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-4/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-5/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-0/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-1/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-2/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-3/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-4/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-5/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-0/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-1/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-2/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-3/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-4/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-5/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-0/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-1/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-2/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-3/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-4/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-5/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-0/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-1/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-2/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-3/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-4/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-30-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-5/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%%====tmax_ms=400=====
s=4; % used to index sweep variable (tmax_ms)
%----SNN-------

%VMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875/'
results_max_imode_vil_0p875_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925/'
results_max_imode_vil_0p925_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast/'
results_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast/'
results_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast/'
results_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = parse_result(resultsPath)



%----SVM----
%VMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%IMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-0/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-1/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-2/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-3/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-4/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875-242-best-5/'
[results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-0/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-1/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-2/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-3/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-4/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925-242-best-5/'
[results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (FAST)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-0/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-1/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-2/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-3/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-4/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p875_fast-242-best-5/'
[results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p875_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-0/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-1/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-2/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-3/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-4/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9_fast-242-best-5/'
[results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-0/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-1/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-2/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-3/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-4/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_9mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p925_fast-242-best-5/'
[results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p925_fast_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models







%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
tmaxms_arr = 1e3*[100e-3 200e-3 300e-3 400e-3]; %s

%VMODE
results_max_vmode_N3b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_234_tmaxms(1,:)) mean(results_max_vmode_N3b_hsize_234_tmaxms(2,:)) mean(results_max_vmode_N3b_hsize_234_tmaxms(3,:)) mean(results_max_vmode_N3b_hsize_234_tmaxms(4,:))]

results_linear_maxfold_vmode_N3b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(4,:))]

h(1) = errorbar(tmaxms_arr, results_max_vmode_N3b_hsize_234_tmaxms_arr, [std(results_max_vmode_N3b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N4b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_234_tmaxms(1,:)) mean(results_max_vmode_N4b_hsize_234_tmaxms(2,:)) mean(results_max_vmode_N4b_hsize_234_tmaxms(3,:)) mean(results_max_vmode_N4b_hsize_234_tmaxms(4,:))]

results_linear_maxfold_vmode_N4b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(4,:))]


%h(2) = errorbar(tmaxms_arr, results_max_vmode_N4b_hsize_234_tmaxms_arr, [std(results_max_vmode_N4b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

results_max_vmode_N5b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_234_tmaxms(1,:)) mean(results_max_vmode_N5b_hsize_234_tmaxms(2,:)) mean(results_max_vmode_N5b_hsize_234_tmaxms(3,:)) mean(results_max_vmode_N5b_hsize_234_tmaxms(4,:))]

results_linear_maxfold_vmode_N5b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(4,:))]


%h(3) = errorbar(tmaxms_arr, results_max_vmode_N5b_hsize_234_tmaxms_arr, [std(results_max_vmode_N5b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

%VMODE (larger hidden layer)
results_max_vmode_N3b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N3b_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N3b_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N3b_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N3b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(4,:))]


%h(4) = errorbar(tmaxms_arr, results_max_vmode_N3b_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N4b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N4b_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N4b_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N4b_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N4b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(4,:))]


%h(5) = errorbar(tmaxms_arr, results_max_vmode_N4b_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N5b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N5b_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N5b_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N5b_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N5b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(4,:))]


%h(6) = errorbar(tmaxms_arr, results_max_vmode_N5b_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



%VMODE (OFF discarded)
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))]


h(7) = errorbar(tmaxms_arr, results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))]


%h(8) = errorbar(tmaxms_arr, results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))]


%h(9) = errorbar(tmaxms_arr, results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%VMODE (OFF merged as ON)
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))]


h(10) = errorbar(tmaxms_arr, results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))]


%h(11) = errorbar(tmaxms_arr, results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))]

results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))]


%h(12) = errorbar(tmaxms_arr, results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



%IMODE
results_max_imode_vil_0p875_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p875_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p875_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p875_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p875_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(4,:))]


h(13) = errorbar(tmaxms_arr, results_max_imode_vil_0p875_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p875_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



results_max_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p9_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p9_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p9_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p9_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(4,:))]


h(14) = errorbar(tmaxms_arr, results_max_imode_vil_0p9_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p9_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_imode_vil_0p925_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p925_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p925_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p925_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p925_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(4,:))]


h(15) = errorbar(tmaxms_arr, results_max_imode_vil_0p925_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p925_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



%IMODE (FAST)
results_max_imode_vil_0p875_fast_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))]


%h(16) = errorbar(tmaxms_arr, results_max_imode_vil_0p875_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_imode_vil_0p9_fast_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))]


%h(17) = errorbar(tmaxms_arr, results_max_imode_vil_0p9_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


results_max_imode_vil_0p925_fast_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) mean(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) mean(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) mean(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))]

results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) mean(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) mean(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) mean(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))]


%h(18) = errorbar(tmaxms_arr, results_max_imode_vil_0p925_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



set(gca,'XScale','log');
xlabel('Time window (ms)')
ylabel('Classification Accuracy (6 k-folds)')

%lgd = legend(h,['N=3b (hidden layer=234'],['N=4b (hidden layer=234'],['N=5b (hidden layer=234'],['N=3b (hidden layer=242'],['N=4b (hidden layer=242'],['N=5b (hidden layer=242'],['N=3b (OFF discarded; hidden layer=242'], ['N=4b (OFF discarded; hidden layer=242'],['N=5b (OFF discarded; hidden layer=242'],['N=3b (OFF merged; hidden layer=242'],['N=4b (OFF merged; hidden layer=242'],['N=5b (OFF merged; hidden layer=242'],['vil=0.875V (hidden layer=242'],['vil=0.9V (hidden layer=242'],['vil=0.925V (hidden layer=242'],['vil=0.875V FAST (hidden layer=242'],['vil=0.9V FAST (hidden layer=242'],['vil=0.925V FAST (hidden layer=242'])
%lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242', 'N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.875V FAST (hidden layer=242','vil=0.9V FAST (hidden layer=242','vil=0.925V FAST (hidden layer=242')
lgd = legend('N=3b (hidden layer=234','N=3b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242')

lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

%set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['-tmaxms_sweep-snn','.fig']); saveas(gcf,['tmaxms_sweep-snn','.png']);

hold off;
%% === PLOT SVM results ====
figure
hold on;
p(1) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(2) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(3) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(4) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(5) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(6) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(7) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(8) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(9) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(10) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(11) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(12) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(13) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(14) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(15) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(16) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(17) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(18) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


set(gca,'XScale','log');
xlabel('Time window (ms)')
ylabel('Classification Accuracy (6 k-folds)')

%lgd = legend(h,['N=3b (hidden layer=234'],['N=4b (hidden layer=234'],['N=5b (hidden layer=234'],['N=3b (hidden layer=242'],['N=4b (hidden layer=242'],['N=5b (hidden layer=242'],['N=3b (OFF discarded; hidden layer=242'], ['N=4b (OFF discarded; hidden layer=242'],['N=5b (OFF discarded; hidden layer=242'],['N=3b (OFF merged; hidden layer=242'],['N=4b (OFF merged; hidden layer=242'],['N=5b (OFF merged; hidden layer=242'],['vil=0.875V (hidden layer=242'],['vil=0.9V (hidden layer=242'],['vil=0.925V (hidden layer=242'],['vil=0.875V FAST (hidden layer=242'],['vil=0.9V FAST (hidden layer=242'],['vil=0.925V FAST (hidden layer=242'])
lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242', 'N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.875V FAST (hidden layer=242','vil=0.9V FAST (hidden layer=242','vil=0.925V FAST (hidden layer=242')
lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%p(1:end).MarkerSize = 8;

%p(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

%set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['-tmaxms_sweep-svm','.fig']); saveas(gcf,['tmaxms_sweep-svm','.png']);




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
