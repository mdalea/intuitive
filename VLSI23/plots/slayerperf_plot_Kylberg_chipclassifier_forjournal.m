clear all
close all
clearvars




figi=69;
% TEST PERFORMANCE ONLY!!!
% ROW = Th noise sigma =  {0 200uV 1mV 5mV 10mV}
th_noise_sig = [0 200e-6 1e-3 5e-3 10e-3];
% COL = Th mismatch sigma = {0 40mV 100mV 150mV 200mV 500mV}
th_mis_sig = [0 40e-3 100e-3 150e-3 200e-3 500e-3];
N = [0.5 1 2 4]
kfolds=6


mr_cnt=192;
%% Dataset: Kylbert6
hold on;


datasetPath = 'datasetPath/N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/';
spikerate_ave = parse_spikerate(datasetPath,240)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6/';
results_max = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/';
[results_linear_max, results_rbf_max] = parse_result_svm(resultsPath)


%% Effect of Ts on softmax SNN
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-1.0-kfolds-6/'
results_max_Ts(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-5.0-kfolds-6/'
results_max_Ts(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6/'
results_max_Ts(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-100.0-kfolds-6/'
results_max_Ts(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-400.0-kfolds-6/'
results_max_Ts(5,:) = parse_result(resultsPath)

Ts_arr = [1 5 10 100 400];
results_max_Ts_arr = [mean(results_max_Ts(1,:)) mean(results_max_Ts(2,:)) mean(results_max_Ts(3,:)) mean(results_max_Ts(4,:))  mean(results_max_Ts(5,:))];
[maxTs,ITs] = max(results_max_Ts_arr);

h(1) = errorbar(Ts_arr, results_max_Ts_arr, [std(results_max_Ts(1,:)) std(results_max_Ts(2,:)) std(results_max_Ts(3,:)) std(results_max_Ts(4,:)) std(results_max_Ts(5,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;

lgd = legend(h(1),{['12x16 spiking taxels; hidden layer size = 512, ep=50. Max.accuracy:',num2str(maxTs*100),'% @Ts=',num2str(Ts_arr(ITs))]})
lgd.Location = 'southwest';
set(gca,'XScale','log');
xlabel('Time bin width (ms)')
ylabel('Classification Accuracy (6 k-folds)')
%title('Classification Performance versus Ts: Kylberg 6-class Texture Dataset')

%ylim([0 1])
grid on
%text(1/5,0.3,displayFormula("Spike_Rate * (1 + 2 * log2(sqrt(Sensor_Count)))"))
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%% Effect of Hidden Layer size on Softmax SNN
%------------ Texture 7.2mVpp N=4b
% epoch=150
figi = figi+1;
figure(figi)

% softmax
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(5,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(6,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/'
results_max_hid(7,:) = parse_result(resultsPath)

% svm - dim: [sweep, modelfold loaded, fold]


%hid=128
s=1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=150
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=175
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=200
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=256
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=512
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=1024
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

hidlayer_arr = [128 150 175 200 256 512 1024];
results_max_hid_arr = [mean(results_max_hid(1,:)) mean(results_max_hid(2,:)) mean(results_max_hid(3,:)) mean(results_max_hid(4,:)) mean(results_max_hid(5,:)) mean(results_max_hid(6,:)) mean(results_max_hid(7,:))]
results_linear_maxfold_hid_arr = [mean(results_linear_maxfold_hid(1,:)) mean(results_linear_max_hid(2,:)) mean(results_linear_maxfold_hid(3,:)) mean(results_linear_maxfold_hid(4,:))  mean(results_linear_maxfold_hid(5,:))  mean(results_linear_maxfold_hid(6,:))   mean(results_linear_maxfold_hid(7,:))]
results_rbf_maxfold_hid_arr = [mean(results_rbf_maxfold_hid(1,:)) mean(results_rbf_maxfold_hid(2,:)) mean(results_rbf_maxfold_hid(3,:)) mean(results_rbf_maxfold_hid(4,:))   mean(results_rbf_maxfold_hid(5,:))   mean(results_rbf_maxfold_hid(6,:))   mean(results_rbf_maxfold_hid(7,:))]

[maxsoft,Isoft] = max(results_max_hid_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_hid_arr);
[maxrbf,Irbf] = max(results_rbf_maxfold_hid_arr);

h(1) = errorbar(hidlayer_arr, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(hidlayer_arr, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(hidlayer_arr, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 

set(gca,'XScale','log');
xlabel('Hidden Layer Size')
ylabel('Classification Accuracy (6 k-folds)')
%title('vs Hidden Layer Size: Kylberg 6-class Texture Dataset (Vpp = 7.2mVpp,  epoch = 150)')

%text(14,0.5,['Max. Linear SVM Accuracy: ',max(results_linear_maxfold_hid_arr),' %'])
%text(14,0.5,['Max. RBF SVM Accuracy: ',max(results_rbf_maxfold_hid_arr),' %'])

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Ilinear))],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Irbf))])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%% Effect of Hidden Layer Size on softmax SNN
%----------- Texture 180mVpp N=3b
figi = figi+1;
figure(figi)

% softmax
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(5,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6/'
results_max_hid(6,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6/'
results_max_hid(7,:) = parse_result(resultsPath)

% svm - dim: [sweep, modelfold loaded, fold]
% epoch=50

%hid=128
s=1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-128-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=150
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-150-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=175
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-175-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=200
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-200-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=256
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=512
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=1024
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-0-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-1-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-2-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-3-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-4-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-1024-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-5-best-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

hidlayer_arr = [128 150 175 200 256 512 1024];
results_max_hid_arr = [mean(results_max_hid(1,:)) mean(results_max_hid(2,:)) mean(results_max_hid(3,:)) mean(results_max_hid(4,:)) mean(results_max_hid(5,:)) mean(results_max_hid(6,:)) mean(results_max_hid(7,:))]
results_linear_maxfold_hid_arr = [mean(results_linear_maxfold_hid(1,:)) mean(results_linear_max_hid(2,:)) mean(results_linear_maxfold_hid(3,:)) mean(results_linear_maxfold_hid(4,:))  mean(results_linear_maxfold_hid(5,:))  mean(results_linear_maxfold_hid(6,:))   mean(results_linear_maxfold_hid(7,:))]
results_rbf_maxfold_hid_arr = [mean(results_rbf_maxfold_hid(1,:)) mean(results_rbf_maxfold_hid(2,:)) mean(results_rbf_maxfold_hid(3,:)) mean(results_rbf_maxfold_hid(4,:))   mean(results_rbf_maxfold_hid(5,:))   mean(results_rbf_maxfold_hid(6,:))   mean(results_rbf_maxfold_hid(7,:))]

[maxsoft,Isoft] = max(results_max_hid_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_hid_arr);
[maxrbf,Irbf] = max(results_rbf_maxfold_hid_arr);

h(1) = errorbar(hidlayer_arr, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(hidlayer_arr, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(hidlayer_arr, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 

set(gca,'XScale','log');
xlabel('Hidden Layer Size')
ylabel('Classification Accuracy (6 k-folds)')
%title('vs Hidden Layer Size: Kylberg 6-class Texture Dataset (Vpp = 180mVpp,  epoch = 50)')

%text(14,0.5,['Max. Linear SVM Accuracy: ',max(results_linear_maxfold_hid_arr),' %'])
%text(14,0.5,['Max. RBF SVM Accuracy: ',max(results_rbf_maxfold_hid_arr),' %'])

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Ilinear))],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Irbf))])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
micasplot; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%----------------------------------
%epoch=150
%% Effect of Hidden Layer Size on softmax SNN
figi = figi+1;
figure(figi)

% softmax
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(5,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(6,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs/'
results_max_hid(7,:) = parse_result(resultsPath)

% svm - dim: [sweep, modelfold loaded, fold]

%hid=128
s=1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=150
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=175
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=200
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=256
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

actualspikes_linear = results_linear_maxfold_hid(s,:);
actualspikes_rbf = results_rbf_maxfold_hid(s,:);

%hid=512
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=1024
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

hidlayer_arr = [128 150 175 200 256 512 1024];
results_max_hid_arr = [mean(results_max_hid(1,:)) mean(results_max_hid(2,:)) mean(results_max_hid(3,:)) mean(results_max_hid(4,:)) mean(results_max_hid(5,:)) mean(results_max_hid(6,:)) mean(results_max_hid(7,:))]
results_linear_maxfold_hid_arr = [mean(results_linear_maxfold_hid(1,:)) mean(results_linear_max_hid(2,:)) mean(results_linear_maxfold_hid(3,:)) mean(results_linear_maxfold_hid(4,:))  mean(results_linear_maxfold_hid(5,:))  mean(results_linear_maxfold_hid(6,:))   mean(results_linear_maxfold_hid(7,:))]
results_rbf_maxfold_hid_arr = [mean(results_rbf_maxfold_hid(1,:)) mean(results_rbf_maxfold_hid(2,:)) mean(results_rbf_maxfold_hid(3,:)) mean(results_rbf_maxfold_hid(4,:))   mean(results_rbf_maxfold_hid(5,:))   mean(results_rbf_maxfold_hid(6,:))   mean(results_rbf_maxfold_hid(7,:))]

[maxsoft,Isoft] = max(results_max_hid_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_hid_arr);
[maxrbf,Irbf] = max(results_rbf_maxfold_hid_arr);

h(1) = errorbar(hidlayer_arr, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(hidlayer_arr, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(hidlayer_arr, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 

set(gca,'XScale','log');
xlabel('Hidden Layer Size')
ylabel('Classification Accuracy (6 k-folds)')
%title('vs Hidden Layer Size: Kylberg 6-class Texture Dataset (Vpp = 180mVpp,  epoch = 150)')

%text(14,0.5,['Max. Linear SVM Accuracy: ',max(results_linear_maxfold_hid_arr),' %'])
%text(14,0.5,['Max. RBF SVM Accuracy: ',max(results_rbf_maxfold_hid_arr),' %'])

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Ilinear))],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Irbf))])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
micasplot; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 


set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%-----------------------------------

%% Effect of Rolling Average Window Size on softmax SNN
figi = figi+1;
figure(figi)

hold on;

% 512 hidden layer

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-5-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin(1,:),results_rbf_max_svmwin(1,:)]   = parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-20-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin(2,:),results_rbf_max_svmwin(2,:)]   =  parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-30-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin(3,:),results_rbf_max_svmwin(3,:)]   = parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-512-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin(4,:),results_rbf_max_svmwin(4,:)]   =  parse_result_svm(resultsPath)

% 256 hidden layer

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-5-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin_256(1,:),results_rbf_max_svmwin_256(1,:)]   = parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-20-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin_256(2,:),results_rbf_max_svmwin_256(2,:)]   =  parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-30-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin_256(3,:),results_rbf_max_svmwin_256(3,:)]   = parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-epochs-5-input_size-2-16-12-hidden_size-256-batch_size-32-svm_window_size-40-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-retrainPath-chip-classifier-test-0-best/'
[results_linear_max_svmwin_256(4,:),results_rbf_max_svmwin_256(4,:)]   =  parse_result_svm(resultsPath)

h(1) = errorbar([5 20 30 40],[mean(results_linear_max_svmwin(1,:)) mean(results_linear_max_svmwin(2,:)) mean(results_linear_max_svmwin(3,:)) mean(results_linear_max_svmwin(4,:))], [std(results_linear_max_svmwin(1,:)) std(results_linear_max_svmwin(2,:)) std(results_linear_max_svmwin(3,:)) std(results_linear_max_svmwin(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;
h(2) = errorbar([5 20 30 40],[mean(results_rbf_max_svmwin(1,:)) mean(results_rbf_max_svmwin(2,:)) mean(results_rbf_max_svmwin(3,:)) mean(results_rbf_max_svmwin(4,:))], [std(results_rbf_max_svmwin(1,:)) std(results_rbf_max_svmwin(2,:)) std(results_rbf_max_svmwin(3,:)) std(results_rbf_max_svmwin(4,:))],'-s','Color',[0.8500 0.3250 0.0980],'LineWidth',3); j=j+1;
h(3) = errorbar([5 20 30 40],[mean(results_linear_max_svmwin_256(1,:)) mean(results_linear_max_svmwin_256(2,:)) mean(results_linear_max_svmwin_256(3,:)) mean(results_linear_max_svmwin_256(4,:))], [std(results_linear_max_svmwin_256(1,:)) std(results_linear_max_svmwin_256(2,:)) std(results_linear_max_svmwin_256(3,:)) std(results_linear_max_svmwin_256(4,:))],'->','LineWidth',3); j=j+1;
h(4) = errorbar([5 20 30 40],[mean(results_rbf_max_svmwin_256(1,:)) mean(results_rbf_max_svmwin_256(2,:)) mean(results_rbf_max_svmwin_256(3,:)) mean(results_rbf_max_svmwin_256(4,:))], [std(results_rbf_max_svmwin_256(1,:)) std(results_rbf_max_svmwin_256(2,:)) std(results_rbf_max_svmwin_256(3,:)) std(results_rbf_max_svmwin_256(4,:))],'-s','LineWidth',3); j=j+1;



%set(gca,'XScale','log');
xlabel('Rolling Average Window Size (bins)')
ylabel('Classification Accuracy (6 k-folds)')
title('versus Rolling Average Window Size: Kylberg 6-class Texture Dataset')

lgd = legend(h,['SNN + Linear SVM (hidden layer size=512)'],['SNN + RBF SVM (hidden layer size=512)'],['SNN + Linear SVM (hidden layer size=256)'],['SNN + RBF SVM (hidden layer size=256)'])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
%text(1/5,0.3,displayFormula("Spike_Rate * (1 + 2 * log2(sqrt(Sensor_Count)))"))
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%-----------------------------------



i=1;
% NOISELESS

apdsm_200m_perf(1,1:kfolds) = [57.5 62.5 65 52.5 65 55]./100;  % 4b
apdsm_200m_perf(2,1:kfolds) = [72.5 70 67.5 70 65 65]./100;  % 6b
apdsm_200m_perf(3,1:kfolds) = [62.5 82.5 85 87.5 65 75]./100; % 8b
apdsm_200m_perf(4,1:kfolds) = [80.0 67.5 72.5 75 70 65]./100; % 10b

lcadc_perf(1,1:kfolds) = [52.5 60 57.5 57.5 57.5 52.5]./100;  % 2b
lcadc_perf(2,1:kfolds) = [85 75 75 75 75 77.5]./100;  % 4b
lcadc_perf(3,1:kfolds) = [95 80 97.5 87.5 85 82.5]./100;  % 6b
lcadc_perf(4,1:kfolds) = [57.5 67.5 40 87.5 85 75]./100; % 8b

frame_1000_perf(1,1:3) = [56.25 45 51.25]./100;  % 6b
frame_1000_perf(2,1:3) = [47.5 48.75 56.25]./100;  % 8b
frame_1000_perf(3,1:3) = [48.75 46.25 51.25]./100;  % 10b

frame_5000_perf(1,1:1) = [33.75]./100;  % 6b  STILL RUNNING
frame_5000_perf(2,1:1) = [75]./100;  % 8b
frame_5000_perf(3,1:1) = [70]./100;  % 10b

apdsm_200m_sr(1) = 3009.60416666667;  % 1b
apdsm_200m_sr(2) = 12359.0520833333;   % 2b
apdsm_200m_sr(3) = 49640.125;   % 3b
apdsm_200m_sr(4) = 199268.604166667;   % 4b


apdsm_200m_dr(1) = spkrate_to_datarate(apdsm_200m_sr(i,1),mr_cnt);  % 4b
apdsm_200m_dr(2) = spkrate_to_datarate(apdsm_200m_sr(i,2),mr_cnt);  % 6b
apdsm_200m_dr(3) = spkrate_to_datarate(apdsm_200m_sr(i,3),mr_cnt);  % 8b
apdsm_200m_dr(4) = spkrate_to_datarate(apdsm_200m_sr(i,4),mr_cnt);  % 10b

lcadc_sr(1) = 2429.47916666667;  % 2b
lcadc_sr(2) = 20338.5416666667;  % 4b
lcadc_sr(3) = 99110.8541666667;   % 6b
lcadc_sr(4) = 400133.96875;   % 8b

lcadc_dr(1) = spkrate_to_datarate_lc(lcadc_sr(i,1),mr_cnt);  % 2b
lcadc_dr(2) = spkrate_to_datarate_lc(lcadc_sr(i,2),mr_cnt);  % 4b
lcadc_dr(3) = spkrate_to_datarate_lc(lcadc_sr(i,3),mr_cnt);  % 6b
lcadc_dr(4) = spkrate_to_datarate_lc(lcadc_sr(i,4),mr_cnt);  % 6b

frame_1000_dr(1) = frame_to_datarate(1000,6,mr_cnt);  % 6b
frame_1000_dr(2) = frame_to_datarate(1000,8,mr_cnt);  % 8b
frame_1000_dr(3) = frame_to_datarate(1000,10,mr_cnt);  % 10b

frame_5000_dr(1) = frame_to_datarate(5000,6,mr_cnt);  % 6b
frame_5000_dr(2) = frame_to_datarate(5000,8,mr_cnt);  % 8b
frame_5000_dr(3) = frame_to_datarate(5000,10,mr_cnt);  % 10b

% Plot classification rate vs datarate (errorbar)
figi = figi+1;
figure(figi)

hold on
j=1;

%pop_dr=10e3*mr_cnt;   %% used in BioCAS paper
pop_dr = 10*5e3*mr_cnt;
% h(j) = errorbar([lcadc_dr(1) lcadc_dr(2) lcadc_dr(3)],[mean(lcadc_perf(1,:)) mean(lcadc_perf(2,:)) mean(lcadc_perf(3,:))], [std(lcadc_perf(1,:)) std(lcadc_perf(2,:)) std(lcadc_perf(3,:))],'Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;
% h(j) = errorbar([apdsm_200m_dr(1) apdsm_200m_dr(2) apdsm_200m_dr(3) apdsm_200m_dr(4)],[mean(apdsm_200m_perf(1,:)) mean(apdsm_200m_perf(2,:)) mean(apdsm_200m_perf(3,:)) mean(apdsm_200m_perf(4,:))], [std(apdsm_200m_perf(1,:)) std(apdsm_200m_perf(2,:)) std(apdsm_200m_perf(3,:)) std(apdsm_200m_perf(4,:))],'Color',[0.8500 0.3250 0.0980],'LineWidth',3); j=j+1;
% h(j) = errorbar([frame_1000_dr(1) frame_1000_dr(2) frame_1000_dr(3)], [mean(frame_1000_perf(1,:)) mean(frame_1000_perf(2,:)) mean(frame_1000_perf(3,:))] ,[std(frame_1000_perf(1,:)) std(frame_1000_perf(2,:)) std(frame_1000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
% h(j) = errorbar([frame_5000_dr(1) frame_5000_dr(2) frame_5000_dr(3)], [mean(frame_5000_perf(1,:)) mean(frame_5000_perf(2,:)) mean(frame_5000_perf(3,:))] ,[std(frame_5000_perf(1,:)) std(frame_5000_perf(2,:)) std(frame_5000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
h(j) = errorbar([lcadc_dr(1) lcadc_dr(2) lcadc_dr(3) lcadc_dr(4)]./pop_dr,[mean(lcadc_perf(1,:)) mean(lcadc_perf(2,:)) mean(lcadc_perf(3,:)) mean(lcadc_perf(4,:))], [std(lcadc_perf(1,:)) std(lcadc_perf(2,:)) std(lcadc_perf(3,:)) std(lcadc_perf(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;
h(j) = errorbar([apdsm_200m_dr(1) apdsm_200m_dr(2) apdsm_200m_dr(3) apdsm_200m_dr(4)]./pop_dr,[mean(apdsm_200m_perf(1,:)) mean(apdsm_200m_perf(2,:)) mean(apdsm_200m_perf(3,:)) mean(apdsm_200m_perf(4,:))], [std(apdsm_200m_perf(1,:)) std(apdsm_200m_perf(2,:)) std(apdsm_200m_perf(3,:))  std(apdsm_200m_perf(4,:))],'-s','Color',[0.8500 0.3250 0.0980],'LineWidth',3); j=j+1;
%h(j) = errorbar([frame_1000_dr(1) frame_1000_dr(2) frame_1000_dr(3)], [mean(frame_1000_perf(1,:)) mean(frame_1000_perf(2,:)) mean(frame_1000_perf(3,:))] ,[std(frame_1000_perf(1,:)) std(frame_1000_perf(2,:)) std(frame_1000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
%h(j) = errorbar([frame_5000_dr(1) frame_5000_dr(2) frame_5000_dr(3)], [mean(frame_5000_perf(1,:)) mean(frame_5000_perf(2,:)) mean(frame_5000_perf(3,:))] ,[std(frame_5000_perf(1,:)) std(frame_5000_perf(2,:)) std(frame_5000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
h(j) = line([0.0001 10], [0.7458 0.7458],'LineStyle','--','Color',[0.4660 0.6740 0.1880]); j=j+1;
h(j) = errorbar(spikerate_ave./pop_dr, mean(results_max), std(results_max),'-x','LineWidth',3); j=j+1;
h(j) = errorbar(spikerate_ave./pop_dr, mean(results_linear_max), std(results_linear_max),'-o','LineWidth',5); j=j+1;
h(j) = errorbar(spikerate_ave./pop_dr, mean(results_rbf_max), std(results_rbf_max),'-s','LineWidth',4); j=j+1;

set(gca,'XScale','log');
%xlabel('Data-rate (bps)')
xlabel('Output Data-rate (AER encoding) Normalized to the Frame Output Data-rate')
ylabel('Classification Accuracy (6 k-folds)')
%title('Classification Performance versus Data-rate: Kylberg 6-class Texture Dataset')
title('versus Normalized Data-rate: Kylberg 6-class Texture Dataset')
%lgd = legend(h,['SNN: LCADC'],['SNN: N-LCADC tau=200ms'],['Frame-trained RNN: fsample=1000Hz'],['Frame-trained RNN: fsample=5000Hz'])

lgd = legend(h,['(Model) SNN: LCS'],['(Model) SNN: N-LCS tau=200ms'],['(Model) RNN: Frame 10-bit fs=5kHz'],['(Chip) SNN: LCS'],['(Chip) SNN + Linear SVM on LCS'],['(Chip) SNN + RBF SVM on LCS'])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
%text(1/5,0.3,displayFormula("Spike_Rate * (1 + 2 * log2(sqrt(Sensor_Count)))"))
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;
h(5).MarkerSize = 18;
h(6).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%% ----------- flutter frequency
figi = figi+1;
figure(figi)

%% Effect of Ts on softmax SNN
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-1.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_Ts(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-5.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_Ts(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_Ts(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-100.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_Ts(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-400.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_Ts(5,:) = parse_result(resultsPath)

Ts_arr = [1 5 10 100 400];
results_max_Ts_arr = [mean(results_max_Ts(1,:)) mean(results_max_Ts(2,:)) mean(results_max_Ts(3,:)) mean(results_max_Ts(4,:))  mean(results_max_Ts(5,:))];
[maxTs,ITs] = max(results_max_Ts_arr);

h(1) = errorbar(Ts_arr, results_max_Ts_arr, [std(results_max_Ts(1,:)) std(results_max_Ts(2,:)) std(results_max_Ts(3,:)) std(results_max_Ts(4,:)) std(results_max_Ts(5,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;

lgd = legend(h,{['12x16 spiking taxels; hidden layer size = 256, ep=150. Max.accuracy:',num2str(maxTs*100),'% @Ts=',num2str(Ts_arr(ITs))]})
lgd.Location = 'southwest';
set(gca,'XScale','log');
xlabel('Time bin width (ms)')
ylabel('Classification Accuracy (6 k-folds)')
title('Classification Performance versus Ts: Flutter Frequency')

%ylim([0 1])
grid on
%text(1/5,0.3,displayFormula("Spike_Rate * (1 + 2 * log2(sqrt(Sensor_Count)))"))
micasplot; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);


%% Effect of Hidden Layer size on Softmax SNN
%------------ Flutter frequency
% epoch=150
figi = figi+1;
figure(figi)

% softmax
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(5,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(6,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/'
results_max_hid(7,:) = parse_result(resultsPath)

% svm - dim: [sweep, modelfold loaded, fold]


%hid=128
s=1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-128-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=150
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-150-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=175
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-175-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=256
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-200-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=512
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%hid=1024
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-retrainPath-TrainedALL_epochs-150-input_size-2-16-12-hidden_size-1024-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

hidlayer_arr = [128 150 175 200 256 512 1024];
results_max_hid_arr = [mean(results_max_hid(1,:)) mean(results_max_hid(2,:)) mean(results_max_hid(3,:)) mean(results_max_hid(4,:)) mean(results_max_hid(5,:)) mean(results_max_hid(6,:)) mean(results_max_hid(7,:))]
results_linear_maxfold_hid_arr = [mean(results_linear_maxfold_hid(1,:)) mean(results_linear_max_hid(2,:)) mean(results_linear_maxfold_hid(3,:)) mean(results_linear_maxfold_hid(4,:))  mean(results_linear_maxfold_hid(5,:))  mean(results_linear_maxfold_hid(6,:))   mean(results_linear_maxfold_hid(7,:))]
results_rbf_maxfold_hid_arr = [mean(results_rbf_maxfold_hid(1,:)) mean(results_rbf_maxfold_hid(2,:)) mean(results_rbf_maxfold_hid(3,:)) mean(results_rbf_maxfold_hid(4,:))   mean(results_rbf_maxfold_hid(5,:))   mean(results_rbf_maxfold_hid(6,:))   mean(results_rbf_maxfold_hid(7,:))]

[maxsoft,Isoft] = max(results_max_hid_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_hid_arr);
[maxrbf,Irbf] = max(results_rbf_maxfold_hid_arr);

h(1) = errorbar(hidlayer_arr, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(hidlayer_arr, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(hidlayer_arr, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 

set(gca,'XScale','log');
xlabel('Hidden Layer Size')
ylabel('Classification Accuracy (6 k-folds)')
title('vs Hidden Layer Size: Flutter frequency (Vpp = 7.2mVpp & 18mVpp,  epoch = 150)')

%text(14,0.5,['Max. Linear SVM Accuracy: ',max(results_linear_maxfold_hid_arr),' %'])
%text(14,0.5,['Max. RBF SVM Accuracy: ',max(results_rbf_maxfold_hid_arr),' %'])

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Ilinear))],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ HiddenLayer=',num2str(hidlayer_arr(Irbf))])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
micasplot; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);


%---------------------------------
%% Effect of Bit Resolution
%------------ Model Spikes 7.2mVpp 
% epoch=150
figi = figi+1;
figure(figi)

% softmax
resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-2-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(1,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-3-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(2,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(3,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-5-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(4,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-6-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(5,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-7-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(6,:) = parse_result(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_epochs-150-input_size-2-16-12-hidden_size-256-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-10.0-kfolds-6-datasetPath-ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-8-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale_chip--1to40-1to40_sorted/'
results_max_hid(7,:) = parse_result(resultsPath)

% svm - dim: [sweep, modelfold loaded, fold]


%N=2b
s=1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-2b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=3b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-3b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=4b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-4b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=5b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-5b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=6b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-6b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=7b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-7b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

%N=8b
s=s+1; 
resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-0-best/'
[results_linear_max_hid(s,1,:), results_rbf_max_hid(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-1-best/'
[results_linear_max_hid(s,2,:), results_rbf_max_hid(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-2-best/'
[results_linear_max_hid(s,3,:), results_rbf_max_hid(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-3-best/'
[results_linear_max_hid(s,4,:), results_rbf_max_hid(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-4-best/'
[results_linear_max_hid(s,5,:), results_rbf_max_hid(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = 'chip_spikeclassifier/TrainedALL_svmonly-ep-5-svm_wsize-40-modelspikes-8b-5-best/'
[results_linear_max_hid(s,6,:), results_rbf_max_hid(s,6,:)]= parse_result_svm(resultsPath)

mean_array = [mean(results_linear_max_hid(s,1,:)) mean(results_linear_max_hid(s,2,:)) mean(results_linear_max_hid(s,3,:)) mean(results_linear_max_hid(s,4,:)) mean(results_linear_max_hid(s,5,:)) mean(results_linear_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_hid(s,:) = results_linear_max_hid(s,foldidx,:)

mean_array = [mean(results_rbf_max_hid(s,1,:)) mean(results_rbf_max_hid(s,2,:)) mean(results_rbf_max_hid(s,3,:)) mean(results_rbf_max_hid(s,4,:)) mean(results_rbf_max_hid(s,5,:)) mean(results_rbf_max_hid(s,6,:))]
[~,foldidx] = max(mean_array)
results_rbf_maxfold_hid(s,:) = results_rbf_max_hid(s,foldidx,:)

N_arr = [2 3 4 5 6 7 8];

results_max_hid_arr = [mean(results_max_hid(1,:)) mean(results_max_hid(2,:)) mean(results_max_hid(3,:)) mean(results_max_hid(4,:)) mean(results_max_hid(5,:)) mean(results_max_hid(6,:)) mean(results_max_hid(7,:))]
results_linear_maxfold_hid_arr = [mean(results_linear_maxfold_hid(1,:)) mean(results_linear_max_hid(2,:)) mean(results_linear_maxfold_hid(3,:)) mean(results_linear_maxfold_hid(4,:))  mean(results_linear_maxfold_hid(5,:))  mean(results_linear_maxfold_hid(6,:))   mean(results_linear_maxfold_hid(7,:))]
results_rbf_maxfold_hid_arr = [mean(results_rbf_maxfold_hid(1,:)) mean(results_rbf_maxfold_hid(2,:)) mean(results_rbf_maxfold_hid(3,:)) mean(results_rbf_maxfold_hid(4,:))   mean(results_rbf_maxfold_hid(5,:))   mean(results_rbf_maxfold_hid(6,:))   mean(results_rbf_maxfold_hid(7,:))]

[maxsoft,Isoft] = max(results_max_hid_arr);
[maxlinear,Ilinear] = max(results_linear_maxfold_hid_arr);
[maxrbf,Irbf] = max(results_rbf_maxfold_hid_arr);

h(1) = errorbar(N_arr, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(N_arr, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(N_arr, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 
h(4) = errorbar(3,mean(actualspikes_linear),std(actualspikes_linear),'LineWidth',3)
h(5) = errorbar(3,mean(actualspikes_rbf),std(actualspikes_rbf),'LineWidth',3)

%set(gca,'XScale','log');
xlabel('Spike encoding resolution (bits)')
ylabel('Classification Accuracy (6 k-folds)')
title('vs Spike bits: Kylberg 6-class Texture Dataset (Model Spikes, Vpp = 7.2mVpp,  epoch = 150)')

%text(14,0.5,['Max. Linear SVM Accuracy: ',max(results_linear_maxfold_hid_arr),' %'])
%text(14,0.5,['Max. RBF SVM Accuracy: ',max(results_rbf_maxfold_hid_arr),' %'])

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ N=',num2str(N_arr(Isoft))],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ N=',num2str(N_arr(Ilinear))],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ N=',num2str(N_arr(Irbf))],['Actual Spikes (Linear SVM) - Max:',num2str(mean(actualspikes_linear)*100),'%'],['Actual Spikes (RBF SVM) - Max:',num2str(mean(actualspikes_rbf)*100),'%'])
lgd.Location = 'southwest';
%ylim([0 1])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

%% ------ BELOW DEPRECATED OR UNFINISHED CODE (NEVER USED) --------------
%% Effect of SpikeRate -- DEPRECATED
%------------ ModelSpikes 7.2mVpp
% epoch=150
figi = figi+1;
figure(figi)

spikerate_ave = [];
spikerate_ave(1) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-2-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(2) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-3-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(3) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-4-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(4) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-5-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(5) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-6-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(6) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-7-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave(7) = parse_spikerate_fromfile('all_scripts-slayer/global_outfile/spikegen/ALL_N_lcadc-0-uV-v2-0-uV-0-uV-0-pct-8-mr_cnt-192-multitrial-Kylberg_filt_6_scan_actualdimscale180mvpp_chip--1to40-1to40_sorted/')
spikerate_ave_linear = parse_spikerate('ArduinoRead_2/ArduinoRead/out/N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/',240)
spikerate_ave_rbf = parse_spikerate('ArduinoRead_2/ArduinoRead/out/N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_7p20mvpp_250mvofs/',240)

h(1) = errorbar(spikerate_ave, results_max_hid_arr, [std(results_max_hid(1,:)) std(results_max_hid(2,:)) std(results_max_hid(3,:)) std(results_max_hid(4,:)) std(results_max_hid(5,:)) std(results_max_hid(6,:)) std(results_max_hid(7,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); hold on;
h(2) = errorbar(spikerate_ave, results_linear_maxfold_hid_arr, [std(results_linear_maxfold_hid(1,:)) std(results_linear_maxfold_hid(2,:)) std(results_linear_maxfold_hid(3,:)) std(results_linear_maxfold_hid(4,:))   std(results_linear_maxfold_hid(5,:))   std(results_linear_maxfold_hid(6,:))   std(results_linear_maxfold_hid(7,:))],'->','LineWidth',3); 
h(3) = errorbar(spikerate_ave, results_rbf_maxfold_hid_arr, [std(results_rbf_maxfold_hid(1,:)) std(results_rbf_maxfold_hid(2,:)) std(results_rbf_maxfold_hid(3,:)) std(results_rbf_maxfold_hid(4,:))  std(results_rbf_maxfold_hid(5,:))  std(results_rbf_maxfold_hid(6,:))  std(results_rbf_maxfold_hid(7,:))],'->','LineWidth',3); 
h(4) = errorbar(spikerate_ave_linear,mean(actualspikes_linear),std(actualspikes_linear),'LineWidth',3)
h(5) = errorbar(spikerate_ave_rbf,mean(actualspikes_rbf),std(actualspikes_rbf),'LineWidth',3)

set(gca,'XScale','log');
xlabel('Spiking Rate (Hz)')
ylabel('Classification Accuracy (6 k-folds)')
title('vs Spiking Rate: Kylberg 6-class Texture Dataset (Model Spikes, Vpp = 7.2mVpp,  epoch = 150)')

lgd = legend(h,['SNN ','-Max. Softmax Accuracy: ',num2str(maxsoft*100),' % @ SR=',num2str(spikerate_ave(Isoft)),'Hz'],['SNN + Linear SVM ','-Max. Linear SVM Accuracy: ',num2str(maxlinear*100),' % @ SR=',num2str(spikerate_ave(Ilinear)),'Hz'],['SNN + RBF SVM ','-Max. RBF SVM Accuracy: ',num2str(maxrbf*100),' % @ SR=',num2str(spikerate_ave(Irbf)),'Hz'],['Actual Spikes (Linear SVM) - Max:',num2str(mean(actualspikes_linear)*100),'%'],['Actual Spikes (RBF SVM) - Max:',num2str(mean(actualspikes_rbf)*100),'%'])
lgd.Location = 'southwest';
xlim([1e3 1000e3])
%ylim([0 1])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
h(1).MarkerSize = 12;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 9; 

set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.fig']); saveas(gcf,['Kyl6-classifier-',num2str(figi),'.png']);

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

function [results_linear_max, results_rbf_max] = parse_result_svm(resultsPath)

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

    results_rbf_max = [];
    fid = fopen([resultsPath,'results_svm_rbf_max.txt']);
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    results_rbf_max = [results_rbf_max; str2num(tline_tokens{2})];
    %while ischar(tline)
    for i=1:5
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        results_rbf_max = [results_rbf_max; str2num(tline_tokens{2})];   
    end
    fclose(fid);        

    results_rbf_max = results_rbf_max ./ 100;    
end