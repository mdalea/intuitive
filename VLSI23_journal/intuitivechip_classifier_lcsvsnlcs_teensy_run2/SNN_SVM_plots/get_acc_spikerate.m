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
%     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b'
%      [spike_cnt_vmode_N2b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_vmode_N2b_tmaxms(s,:) = spike_cnt_vmode_N2b_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
     [spike_cnt_vmode_N3b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_tmaxms(s,:) = spike_cnt_vmode_N3b_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_tmaxms(s,:) = spike_cnt_vmode_N4b_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_tmaxms(s,:) = spike_cnt_vmode_N5b_tmaxms(s,:) ./ (1e-3*tmax_ms);

%VMODE (CORR)    

%     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b'
%     [spike_cnt_vmode_N2b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_vmode_N2b_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
    [spike_cnt_vmode_N3b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

%VMODE (manipulated OFF spikes)

%      datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard'
%      [spike_cnt_vmode_N2b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%      spike_rate_vmode_N2b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%      datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg'
%      [spike_cnt_vmode_N2b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%      spike_rate_vmode_N2b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);

 %VMODE (manipulated OFF spikes) (CORR)

%      datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard'
%      [spike_cnt_vmode_N2b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%      spike_rate_vmode_N2b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
%  
%      datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg'
%      [spike_cnt_vmode_N2b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%      spike_rate_vmode_N2b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %VMODE (180mvpp)

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b'
     [spike_cnt_vmode_N2b_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N2b_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N2b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b'
     [spike_cnt_vmode_N3b_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N3b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N4b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N5b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

%VMODE (CORR)  (180mvpp)  

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b'
    [spike_cnt_vmode_N2b_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N2b_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b'
    [spike_cnt_vmode_N3b_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N3b_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b'
    [spike_cnt_vmode_N4b_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b'
    [spike_cnt_vmode_N5b_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

%VMODE (manipulated OFF spikes)  (180mvpp)

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard'
     [spike_cnt_vmode_N2b_OFFdcard_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N2b_OFFdcard_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFdcard_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg'
     [spike_cnt_vmode_N2b_OFFmerg_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N2b_OFFmerg_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFmerg_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_180mvpp_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

 %VMODE (manipulated OFF spikes) (CORR) (180mvpp)

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard'
     [spike_cnt_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg'
     [spike_cnt_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
     [spike_cnt_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
 
     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
     [spike_cnt_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
    [spike_cnt_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
    [spike_cnt_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
    [spike_cnt_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
    [spike_cnt_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(s,:) = spike_cnt_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   
   

 %======================
 %IMODE (18mvpp)

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_tmaxms(s,:) = spike_cnt_imode_vil_0p8_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %IMODE (18mvpp) (CORR)

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);      

%IMODE (180mvpp)

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85'
    [spike_cnt_imode_vil_0p85_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p85_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_0p85_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1'
    [spike_cnt_imode_vil_1p1_180mvpp_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1p1_180mvpp_tmaxms(s,:) = spike_cnt_imode_vil_1p1_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %IMODE (180mvpp) (CORR)

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [spike_cnt_imode_vil_0p8_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85'
    [spike_cnt_imode_vil_0p85_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p85_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1'
    [spike_cnt_imode_vil_1p1_180mvpp_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1p1_180mvpp_corr_tmaxms(s,:) = spike_cnt_imode_vil_1p1_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);    

 %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n

%     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
%     [spike_cnt_imode_vil_0p8_180mvpp_ilsb5_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_imode_vil_0p8_180mvpp_ilsb5_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_ilsb5_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
    [spike_cnt_imode_vil_0p9_180mvpp_ilsb5_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_0p9_180mvpp_ilsb5_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_ilsb5_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
    [spike_cnt_imode_vil_1_180mvpp_ilsb5_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
    spike_rate_imode_vil_1_180mvpp_ilsb5_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_ilsb5_tmaxms(s,:) ./ (1e-3*tmax_ms);   
 
    %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n (CORR)

%     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
%     [spike_cnt_imode_vil_0p8_180mvpp_ilsb5_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
%     spike_rate_imode_vil_0p8_180mvpp_ilsb5_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p8_180mvpp_ilsb5_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
     [spike_cnt_imode_vil_0p9_180mvpp_ilsb5_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_imode_vil_0p9_180mvpp_ilsb5_corr_tmaxms(s,:) = spike_cnt_imode_vil_0p9_180mvpp_ilsb5_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

     datasetPath = './SENSOR_DATASETS/PROCESSED_SPIKES/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
     [spike_cnt_imode_vil_1_180mvpp_ilsb5_corr_tmaxms(s,:)]=count_spikes_dataset(datasetPath,tex_cnt,trialcnt)
     spike_rate_imode_vil_1_180mvpp_ilsb5_corr_tmaxms(s,:) = spike_cnt_imode_vil_1_180mvpp_ilsb5_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

% 
   
%==== GET SPIKE RATES (END)=====

%----SNN-------

%VMODE
resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (CORR)
resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes) (CORR)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (180mvpp)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b/'
max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b/'
max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (CORR) (180mvpp)
resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b/'
max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-234-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b/'
max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b/'
max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b/'
max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-2-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b/'
max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes) (180mvpp)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard/'
max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg/'
max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%VMODE (manipulated OFF spikes) (CORR) (180mvpp)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard/'
max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg/'
max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard/'
max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg/'
max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard/'
max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg/'
max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard/'
max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg/'
max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (18mvpp)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
max_imode_vil_0p8_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

% resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
% max_imode_vil_0p9_hsize_242_tmaxms(s,:) = parse_result(resultsPath)
% 
% resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
% max_imode_vil_1_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (18mvpp) (CORR)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
max_imode_vil_0p8_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)


%IMODE (180mvpp)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85/'
max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1/'
max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (180mvpp) (CORR)
resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8/'
max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85/'
max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9/'
max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1/'
max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1/'
max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%IMODE (180mvpp) (ith_9p375n_ispk_1p4u)
% resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8/'
% max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9/'
max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1/'
max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,:) = parse_result(resultsPath)


%IMODE (180mvpp) (ith_9p375n_ispk_1p4u) (CORR)
% resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8/'
% max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9/'
max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

resultsPath = './SNN_ep-150-isize-1-8-1-hsize-242-bsize-32-lr-0.001-tmax_ms-400.0-Ts-10.0-k-6-dsetPath-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1/'
max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,:) = parse_result(resultsPath)

%==========
%----SVM----
%VMODE

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[svm_max_vmode_N3b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_hsize_234_tmaxms(s,:) = svm_max_vmode_N3b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[svm_max_vmode_N4b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_hsize_234_tmaxms(s,:) = svm_max_vmode_N4b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[svm_max_vmode_N5b_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_hsize_234_tmaxms(s,:) = svm_max_vmode_N5b_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[svm_max_vmode_N3b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[svm_max_vmode_N4b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[svm_max_vmode_N5b_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged)


resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%VMODE (CORR)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N3b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N4b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N5b_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer) (CORR)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded) (CORR)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged) (CORR)


resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (180mvpp)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-0/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-1/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-2/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-3/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-4/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-5/'
[svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_180mvpp_hsize_234_tmaxms(s,:) = svm_max_vmode_N2b_180mvpp_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_180mvpp_hsize_234_tmaxms(s,:) = svm_max_vmode_N3b_180mvpp_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_180mvpp_hsize_234_tmaxms(s,:) = svm_max_vmode_N4b_180mvpp_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_180mvpp_hsize_234_tmaxms(s,:) = svm_max_vmode_N5b_180mvpp_hsize_234_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-0/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-1/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-2/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-3/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-4/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-5/'
[svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N2b_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-0/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-1/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-2/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-3/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-4/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-5/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-0/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-1/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-2/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-3/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-4/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-5/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,:) = svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%VMODE (CORR) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-0/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-1/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-2/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-3/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-4/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-234-best-5/'
[svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-0/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-1/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-2/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-3/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-4/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-234-best-5/'
[svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-0/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-1/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-2/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-3/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-4/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-234-best-5/'
[svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-0/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-1/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-2/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-3/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-4/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-234-best-5/'
[svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,:) = svm_max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (larger hidden layer) (CORR) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-0/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-1/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-2/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-3/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-4/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b-242-best-5/'
[svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-0/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-1/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-2/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-3/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-4/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b-242-best-5/'
[svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-0/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-1/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-2/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-3/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-4/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b-242-best-5/'
[svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-0/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-1/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-2/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-3/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-4/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b-242-best-5/'
[svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF discarded) (CORR) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-0/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-1/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-2/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-3/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-4/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFdcard-242-best-5/'
[svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-0/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-1/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-2/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-3/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-4/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard-242-best-5/'
[svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-0/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-1/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-2/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-3/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-4/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard-242-best-5/'
[svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-0/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-1/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-2/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-3/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-4/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard-242-best-5/'
[svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


%VMODE (OFF merged) (CORR) (180mvpp)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-0/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-1/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-2/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-3/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-4/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b_OFFmerg-242-best-5/'
[svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-0/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-1/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-2/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-3/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-4/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg-242-best-5/'
[svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-0/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-1/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-2/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-3/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-4/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg-242-best-5/'
[svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-0/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-1/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-2/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-3/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-4/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg-242-best-5/'
[svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

%============================
%IMODE (18mvpp)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[svm_max_imode_vil_0p8_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p8_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p8_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p8_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
% [svm_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)
% 
% 
% mean_array = [mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p9_hsize_242_tmaxms(s,6,:))]
% [~,foldidx] = max(mean_array)
% svm_maxfold_imode_vil_0p9_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p9_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models
% 
% 
% 
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)
% 
% resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
% [svm_max_imode_vil_1_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)
% 
% 
% mean_array = [mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_1_hsize_242_tmaxms(s,6,:))]
% [~,foldidx] = max(mean_array)
% svm_maxfold_imode_vil_1_hsize_242_tmaxms(s,:) = svm_max_imode_vil_1_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models
% 

%IMODE (18mvpp) (CORR)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_0p8_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (180mvpp)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-0/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-1/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-2/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-3/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-4/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-5/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
[svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(s,:) = svm_max_imode_vil_1_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-0/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-1/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-2/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-3/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-4/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-5/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,:) = svm_max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



%IMODE (180mvpp) (CORR)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-0/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-1/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-2/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-3/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-4/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8-242-best-5/'
[svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-0/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-1/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-2/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-3/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-4/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85-242-best-5/'
[svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models



resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-0/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-1/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-2/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-3/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-4/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9-242-best-5/'
[svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-0/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-1/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-2/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-3/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-4/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1-242-best-5/'
[svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-0/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-1/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-2/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-3/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-4/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1p1-242-best-5/'
[svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




% IMODE (ith_9p375n_ispk_1p4u)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-0/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-1/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-2/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-3/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-4/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-5/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,:) = svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-0/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-1/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-2/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-3/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-4/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-5/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,1,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,2,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,3,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,4,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,5,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,:) = svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models


% IMODE (ith_9p375n_ispk_1p4u) (CORR)
resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-0/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-1/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-2/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-3/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-4/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9-242-best-5/'
[svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-0/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,1,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-1/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,2,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-2/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,3,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-3/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,4,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-4/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,5,:)]= parse_result_svm(resultsPath)

resultsPath = './SVM_svmep-5-svm_wsize-40-fair_tmaxsweep-IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1-242-best-5/'
[svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,6,:)]= parse_result_svm(resultsPath)


mean_array = [mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,1,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,2,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,3,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,4,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,5,:)) mean(svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,6,:))]
[~,foldidx] = max(mean_array)
svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,:) = svm_max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(s,foldidx,:) % contains 6 values (from folds) of max acc across diff. starting models




%% - compile results
%VMODE
max_vmode_N3b_hsize_234_tmaxms_arr = [mean(max_vmode_N3b_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N3b_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_hsize_234_tmaxms(2,:))]


max_vmode_N4b_hsize_234_tmaxms_arr = [mean(max_vmode_N4b_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N4b_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_hsize_234_tmaxms(2,:))]


max_vmode_N5b_hsize_234_tmaxms_arr = [mean(max_vmode_N5b_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N5b_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_hsize_234_tmaxms(2,:))]

%VMODE (CORR)
max_vmode_N3b_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N3b_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_hsize_234_corr_tmaxms(2,:))]


max_vmode_N4b_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N4b_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_hsize_234_corr_tmaxms(2,:))]


max_vmode_N5b_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N5b_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_hsize_234_corr_tmaxms(2,:))]

%VMODE (larger hidden layer)
max_vmode_N3b_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_hsize_242_tmaxms(2,:))]


max_vmode_N4b_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_hsize_242_tmaxms(2,:))]


max_vmode_N5b_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_hsize_242_tmaxms(2,:))]

%VMODE (larger hidden layer) (CORR)
max_vmode_N3b_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_hsize_242_corr_tmaxms(2,:))]



%VMODE (OFF discarded)
max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:))]


max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:))]


max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:))]

%VMODE (OFF discarded) (CORR)
max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFdcard_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFdcard_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFdcard_hsize_242_corr_tmaxms(2,:))]

%VMODE (OFF merged as ON)
max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:))]


max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:))]


max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:))]

%VMODE (OFF merged as ON) (CORR)
max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFmerg_hsize_242_corr_tmaxms(2,:))]


%VMODE (180mvpp)
max_vmode_N2b_180mvpp_hsize_234_tmaxms_arr = [mean(max_vmode_N2b_180mvpp_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N2b_180mvpp_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_tmaxms(2,:))]


max_vmode_N3b_180mvpp_hsize_234_tmaxms_arr = [mean(max_vmode_N3b_180mvpp_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N3b_180mvpp_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_tmaxms(2,:))]


max_vmode_N4b_180mvpp_hsize_234_tmaxms_arr = [mean(max_vmode_N4b_180mvpp_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N4b_180mvpp_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_tmaxms(2,:))]


max_vmode_N5b_180mvpp_hsize_234_tmaxms_arr = [mean(max_vmode_N5b_180mvpp_hsize_234_tmaxms(2,:))]

svm_maxfold_vmode_N5b_180mvpp_hsize_234_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_tmaxms(2,:))]

%VMODE (CORR) (180mvpp)
max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(2,:))]


max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(2,:))]


max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(2,:))]


max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(2,:))]

%VMODE (larger hidden layer) (180mvpp)
max_vmode_N2b_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N2b_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N2b_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N3b_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N4b_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N5b_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_tmaxms(2,:))]

%VMODE (larger hidden layer) (CORR) (180mvpp)
max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(2,:))]



%VMODE (OFF discarded) (180mvpp)
max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(2,:))]

%VMODE (OFF discarded) (CORR) (180mvpp)
max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(2,:))]

%VMODE (OFF merged as ON) (180mvpp)
max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]


max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(2,:))]

%VMODE (OFF merged as ON) (CORR) (180mvpp)
max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]

  
max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(2,:))]
%============
%IMODE (18mvpp)
max_imode_vil_0p8_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p8_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_0p8_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_hsize_242_tmaxms(2,:))]


% max_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p9_hsize_242_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_hsize_242_tmaxms(2,:))]
% 
% 
% max_imode_vil_1_hsize_242_tmaxms_arr = [mean(max_imode_vil_1_hsize_242_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_1_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_hsize_242_tmaxms(2,:))]

%IMODE (18mvpp) (CORR)
max_imode_vil_0p8_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p8_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_hsize_242_corr_tmaxms(2,:))]


% max_imode_vil_0p9_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p9_hsize_242_corr_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_0p9_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_hsize_242_corr_tmaxms(2,:))]
% 
% 
% max_imode_vil_1_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_1_hsize_242_corr_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_1_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_hsize_242_corr_tmaxms(2,:))]


%IMODE (180mvpp)
max_imode_vil_0p8_180mvpp_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(2,:))]


max_imode_vil_0p85_180mvpp_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_tmaxms(2,:))]


max_imode_vil_0p9_180mvpp_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(2,:))]


max_imode_vil_1_180mvpp_hsize_242_tmaxms_arr = [mean(max_imode_vil_1_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(2,:))]


max_imode_vil_1p1_180mvpp_hsize_242_tmaxms_arr = [mean(max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_tmaxms(2,:))]


%IMODE (180mvpp) (CORR)
max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(2,:))]

%IMODE (180mvpp) (ith_9p375n_ispk_1p4u)
% max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_0p8_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]


max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]


max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]

svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(2,:))]


%IMODE (180mvpp) (ith_9p375n_ispk_1p4u) (CORR)
% max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p8_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]
% 
% svm_maxfold_imode_vil_0p8_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p8_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]


max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]

svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms_arr = [mean(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(2,:))]



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

function max = parse_result(resultsPath)

    max = [];
    fid = fopen([resultsPath,'results_max.txt']);
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    max = [max; str2num(tline_tokens{2})];
    %while ischar(tline)
    for i=1:5
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        max = [max; str2num(tline_tokens{2})];   
    end

    max = max ./ 100;
    fclose(fid);
end

function [svm_max] = parse_result_svm(resultsPath)

    svm_max = [];
    fid = fopen([resultsPath,'results_svm_linear_max.txt']);
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    svm_max = [svm_max; str2num(tline_tokens{2})];
    %while ischar(tline)
    for i=1:5
        disp(tline)
        tline = fgets(fid);
        tline_tokens = split(tline,':')
        svm_max = [svm_max; str2num(tline_tokens{2})];   
    end
    fclose(fid);

    svm_max = svm_max ./ 100;

end
