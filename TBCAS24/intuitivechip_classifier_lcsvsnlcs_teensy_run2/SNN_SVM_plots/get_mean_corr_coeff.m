%==== GET MEAN CORRELATION COEFFICIENT - orig vs reconstruction (START)=====
%VMODE

%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
%      [mean_corr_coeff_vmode_N3b_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N3b_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
%     [mean_corr_coeff_vmode_N4b_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
%     [mean_corr_coeff_vmode_N5b_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_tmaxms(s,:) ./ (1e-3*tmax_ms);

%VMODE (CORR)    
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N2b'
%     [mean_corr_coeff_vmode_N2b_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N2b_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N2b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b'
    [mean_corr_coeff_vmode_N3b_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N3b_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b'
    [mean_corr_coeff_vmode_N4b_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N4b_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b'
    [mean_corr_coeff_vmode_N5b_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N5b_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

% %VMODE (180mvpp)
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b'
%      [mean_corr_coeff_vmode_N3b_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N3b_180mvpp_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b'
%     [mean_corr_coeff_vmode_N4b_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_180mvpp_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b'
%     [mean_corr_coeff_vmode_N5b_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_180mvpp_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

%VMODE (CORR)    (180mvpp) 
    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N2b'
    [mean_corr_coeff_vmode_N2b_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N2b_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N2b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N3b'
    [mean_corr_coeff_vmode_N3b_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N3b_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N4b'
    [mean_corr_coeff_vmode_N4b_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N4b_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_N5b'
    [mean_corr_coeff_vmode_N5b_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_vmode_N5b_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);     

% %VMODE (manipulated OFF spikes)
% 
%      datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
%      [mean_corr_coeff_vmode_N3b_OFFdcard_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%      mean_corr_coeff_vmode_N3b_OFFdcard_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
%  
%      datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
%      [mean_corr_coeff_vmode_N3b_OFFmerg_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%      mean_corr_coeff_vmode_N3b_OFFmerg_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
%     [mean_corr_coeff_vmode_N4b_OFFdcard_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_OFFdcard_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
%     [mean_corr_coeff_vmode_N4b_OFFmerg_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_OFFmerg_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
%     [mean_corr_coeff_vmode_N5b_OFFdcard_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_OFFdcard_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_OFFdcard_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
%     [mean_corr_coeff_vmode_N5b_OFFmerg_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_OFFmerg_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_OFFmerg_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%  %VMODE (manipulated OFF spikes) (CORR)
% 
%      datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFdcard'
%      [mean_corr_coeff_vmode_N3b_OFFdcard_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%      mean_corr_coeff_vmode_N3b_OFFdcard_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
%  
%      datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N3b_OFFmerg'
%      [mean_corr_coeff_vmode_N3b_OFFmerg_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%      mean_corr_coeff_vmode_N3b_OFFmerg_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N3b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFdcard'
%     [mean_corr_coeff_vmode_N4b_OFFdcard_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_OFFdcard_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N4b_OFFmerg'
%     [mean_corr_coeff_vmode_N4b_OFFmerg_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N4b_OFFmerg_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N4b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFdcard'
%     [mean_corr_coeff_vmode_N5b_OFFdcard_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_OFFdcard_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_OFFdcard_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/VMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_N5b_OFFmerg'
%     [mean_corr_coeff_vmode_N5b_OFFmerg_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_vmode_N5b_OFFmerg_corr_tmaxms(s,:) = mean_corr_coeff_vmode_N5b_OFFmerg_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

 %======================
 %IMODE (18mvpp)
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
%     [mean_corr_coeff_imode_vil_0p8_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p8_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_tmaxms(s,:) ./ (1e-3*tmax_ms);   

%  %IMODE (18mvpp) (CORR)
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
%     [mean_corr_coeff_imode_vil_0p8_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p8_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);      

% %IMODE (180mvpp)
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
%     [mean_corr_coeff_imode_vil_0p8_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p8_180mvpp_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85'
%     [mean_corr_coeff_imode_vil_0p85_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p85_180mvpp_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p85_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);    
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
%     [mean_corr_coeff_imode_vil_0p9_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p9_180mvpp_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p9_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
%     [mean_corr_coeff_imode_vil_1_180mvpp_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_1_180mvpp_tmaxms(s,:) = mean_corr_coeff_imode_vil_1_180mvpp_tmaxms(s,:) ./ (1e-3*tmax_ms);

 %IMODE (180mvpp) (CORR)

    datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8'
    [mean_corr_coeff_imode_vil_0p8_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p85'
    [mean_corr_coeff_imode_vil_0p85_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_imode_vil_0p85_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p85_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

    datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p9'
    [mean_corr_coeff_imode_vil_0p9_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p9_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);

    datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_1'
    [mean_corr_coeff_imode_vil_1_180mvpp_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
    mean_corr_coeff_imode_vil_1_180mvpp_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_1_180mvpp_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

%  %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n
% 
% %     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
% %     [mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
% %     mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
%     [mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
%     [mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) = mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_tmaxms(s,:) ./ (1e-3*tmax_ms);   
%  
%     %IMODE (180mvpp) - ith_9p375n_ispk_1p4u_islew_1n (CORR)
% 
% %     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p8'
% %     [mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
% %     mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p8_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_0p9'
%     [mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_0p9_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);
% 
%     datasetPath = './SENSOR_DATASETS/METRICS/IMODE_allchannels_ALLCLASS_auto_corr_cleaned_1x8_180mvpp_250mvofs_onedac_itail_50nA_ith_9p375n_ispk_1p4u_islew_1n_vil_1'
%     [mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:)]=get_metric(datasetPath,"mean_corr_coeff")
%     mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) = mean_corr_coeff_imode_vil_1_180mvpp_ith_9p375n_ispk_1p4u_corr_tmaxms(s,:) ./ (1e-3*tmax_ms);   

% 
   
%==== GET MEAN CORRELATION COEFFICIENT - orig vs reconstruction (END)=====