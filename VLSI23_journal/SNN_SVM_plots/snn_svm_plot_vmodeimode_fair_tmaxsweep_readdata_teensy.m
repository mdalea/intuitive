%% for sensor spikes
clear all
close all
clearvars




figi=1;
kfolds=6

folderPath = pwd;

mr_cnt=8;
tex_cnt=6; 
trialcnt=10;
tduration=0.4;

%% Effect of Ts on softmax SNN only


%%====tmax_ms=400=====
tmax_ms=400;
s=2; % used to index sweep variable (tmax_ms)

%==== GET SPIKE RATES (START)=====
%VMODE

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
     [spike_cnt_vmode_N3b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_tmaxms(s,:) = spike_cnt_vmode_N3b_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_tmaxms(s,:) = spike_cnt_vmode_N4b_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_tmaxms(s,:) = spike_cnt_vmode_N5b_tmaxms(s,:) ./ (1e-3*tmax_ms);

%VMODE (CORR)    

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
    [spike_cnt_vmode_N3b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

%VMODE (manipulated OFF spikes)

     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

 %VMODE (manipulated OFF spikes) (CORR)

     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %======================
 %IMODE (18mvpp)

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_tmaxms(s,:) = spike_cnt_imode_vil_0p8_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %IMODE (18mvpp) (CORR)

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);      

%IMODE (180mvpp)

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

 %IMODE (180mvpp) (CORR)

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n

%     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
%     [spike_cnt_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);   
 
    %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n (CORR)

%     datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
%     [spike_cnt_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = '../SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

% 
   
%==== GET SPIKE RATES (END)=====

%----SNN-------

%VMODE
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
results_max_vmode_N3b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
results_max_vmode_N4b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
results_max_vmode_N5b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes) (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
results_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
results_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
results_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
results_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
results_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
results_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (18mvpp)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
results_max_imode_vil_0p8_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
% results_max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
% results_max_imode_vil_1_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (18mvpp) (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
results_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)


%IMODE (180mvpp)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
results_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
results_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (180mvpp) (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
results_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
results_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (180mvpp) (ith_9p375n_ispk_1p4u)
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8/'
% results_max_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9/'
results_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1/'
results_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%==========
%----SVM----
%VMODE

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%VMODE (CORR)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_234_corr_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_234_corr_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_234_corr_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer) (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N3b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N4b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N5b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded) (CORR)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged) (CORR)


resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,:) = results_linear_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%============================
%IMODE (18mvpp)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p8_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p8_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
% [results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)
% 
% 
% mean_array = [mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
% [~,foldidx] = max(mean_array)
% results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models
% 
% 
% 
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
% [results_linear_max_imode_vil_1_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)
% 
% 
% mean_array = [mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_1_hsize_242_tmaxms(s,6,:))]
% [~,foldidx] = max(mean_array)
% results_linear_maxfold_imode_vil_1_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_1_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models
% 

%IMODE (18mvpp) (CORR)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms(s,:) = results_linear_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (180mvpp)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%IMODE (180mvpp) (CORR)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,:) = results_linear_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,:) = results_linear_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
[results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,:) = results_linear_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



% IMODE (ith_9p375n_ispk_1p4u)
resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-0/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-1/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-2/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-3/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-4/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-5/'
[results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-0/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-1/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-2/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-3/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-4/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = '../intuitivechip_classifier_lcsvsnlcs_teensy/SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-5/'
[results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,1,:)) mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,2,:)) mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,3,:)) mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,4,:)) mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,5,:)) mean(results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
results_linear_maxfold_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,:) = results_linear_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models







%% - compile results
%VMODE
results_max_vmode_N3b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_234_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(2,:))]


results_max_vmode_N4b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_234_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(2,:))]


results_max_vmode_N5b_hsize_234_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_234_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_hsize_234_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(2,:))]

%VMODE (CORR)
results_max_vmode_N3b_hsize_234_corr_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_234_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_hsize_234_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_234_corr_tmaxms(2,:))]


results_max_vmode_N4b_hsize_234_corr_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_234_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_hsize_234_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_234_corr_tmaxms(2,:))]


results_max_vmode_N5b_hsize_234_corr_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_234_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_hsize_234_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_234_corr_tmaxms(2,:))]

%VMODE (larger hidden layer)
results_max_vmode_N3b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(2,:))]


results_max_vmode_N4b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(2,:))]


results_max_vmode_N5b_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(2,:))]

%VMODE (larger hidden layer) (CORR)
results_max_vmode_N3b_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N3b_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N4b_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N4b_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N5b_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N5b_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_hsize_242_corr_tmaxms(2,:))]



%VMODE (OFF discarded)
results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:))]


results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:))]


results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:))]

%VMODE (OFF discarded) (CORR)
results_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

%VMODE (OFF merged as ON)
results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:))]


results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:))]


results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:))]

%VMODE (OFF merged as ON) (CORR)
results_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


results_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


%============
%IMODE (18mvpp)
results_max_imode_vil_0p8_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p8_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p8_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p8_hsize_242_tmaxms(2,:))]


% results_max_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p9_hsize_242_tmaxms(2,:))]
% 
% results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(2,:))]
% 
% 
% results_max_imode_vil_1_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_1_hsize_242_tmaxms(2,:))]
% 
% results_linear_maxfold_imode_vil_1_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_1_hsize_242_tmaxms(2,:))]

%IMODE (18mvpp) (CORR)
results_max_imode_vil_0p8_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_0p8_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms(2,:))]


% results_max_imode_vil_0p9_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_0p9_hsize_242_corr_tmaxms(2,:))]
% 
% results_linear_maxfold_imode_vil_0p9_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_hsize_242_corr_tmaxms(2,:))]
% 
% 
% results_max_imode_vil_1_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_1_hsize_242_corr_tmaxms(2,:))]
% 
% results_linear_maxfold_imode_vil_1_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_1_hsize_242_corr_tmaxms(2,:))]


%IMODE (180mvpp)
results_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(2,:))]


results_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(2,:))]


results_max_imode_vil_1_180mvpp_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_1_180mvpp_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(2,:))]

%IMODE (180mvpp) (CORR)
results_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(2,:))]


results_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(2,:))]


results_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(2,:))]

results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(2,:))]

%IMODE (180mvpp) (ith_9p375n_ispk_1p4u)
% results_max_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]
% 
% results_linear_maxfold_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]


results_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]


results_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_max_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]

results_linear_maxfold_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms_arr = [mean(results_linear_maxfold_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_hsize_242_tmaxms(2,:))]



% functions
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
