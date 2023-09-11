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


mr_cnt=64;
%% Dataset: Kylbert6

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

% Plot classification rate vs datarate
figi = figi+1;
figure(figi)

hold on

scatter(apdsm_200m_dr(1),apdsm_200m_perf(1,:),'magenta','o')
scatter(apdsm_200m_dr(2),apdsm_200m_perf(2,:),'magenta','d')
scatter(apdsm_200m_dr(3),apdsm_200m_perf(3,:),'magenta','+')
scatter(apdsm_200m_dr(4),apdsm_200m_perf(3,:),'magenta','+')

scatter(frame_1000_dr(1),frame_1000_perf(1,:),'green','o')
scatter(frame_1000_dr(2),frame_1000_perf(2,:),'green','d')
scatter(frame_1000_dr(3),frame_1000_perf(3,:),'green','+')

set(gca,'XScale','log');
xlabel('Data-rate (bps)')
ylabel('Classification Performance across 6 folds')
title('Classification Performance versus Data-rate')
ylim([0 1])
grid on

micasplot

% Plot classification rate vs datarate (errorbar)
figi = figi+1;
figure(figi)

hold on
j=1;




h(j) = errorbar(apdsm_200m_dr(1),mean(apdsm_200m_perf(1,:)),std(apdsm_200m_perf(1,:)),'blue'); j=j+1;
h(j) = errorbar(apdsm_200m_dr(2),mean(apdsm_200m_perf(2,:)),std(apdsm_200m_perf(2,:)),'blue'); j=j+1;
h(j) = errorbar(apdsm_200m_dr(3),mean(apdsm_200m_perf(3,:)),std(apdsm_200m_perf(3,:)),'blue'); j=j+1;
h(j) = errorbar(apdsm_200m_dr(4),mean(apdsm_200m_perf(4,:)),std(apdsm_200m_perf(4,:)),'blue'); j=j+1;


h(j) = errorbar(frame_1000_dr(1),mean(frame_1000_perf(1,:)),std(frame_1000_perf(1,:)),'green'); j=j+1;
h(j) = errorbar(frame_1000_dr(2),mean(frame_1000_perf(2,:)),std(frame_1000_perf(2,:)),'green'); j=j+1;
h(j) = errorbar(frame_1000_dr(3),mean(frame_1000_perf(3,:)),std(frame_1000_perf(3,:)),'green'); j=j+1;

set(gca,'XScale','log');
xlabel('Data-rate (bps)')
ylabel('Classification Performance across 6 folds')
title('Classification Performance versus Data-rate: LMT11 dataset')
lgd = legend(h,['SLAYER: delta-th=1b tau=20ms'],['SLAYER: delta-th=3b tau=20ms'],['SLAYER: delta-th=4b tau=20ms'],['SLAYER: delta-th=1b tau=200ms'],['SLAYER: delta-th=3b tau=200ms'],['SLAYER: delta-th=4b tau=200ms'],['SLAYER: delta-th=6b tau=200ms'],['SLAYER: delta-th=1b tau=2000ms'],['SLAYER: delta-th=3b tau=2000ms'],['SLAYER: delta-th=4b tau=2000ms'],['SLAYER: delta-th=6b tau=2000ms'],['RNN: N=4b fsample=100Hz'],['RNN: N=8b fsample=100Hz'],['RNN: N=16b fsample=100Hz'])
lgd.FontSize = 9; lgd.Location = 'northwest';
ylim([0 1])
grid on

micasplot

% Plot classification rate vs datarate (errorbar)
figi = figi+1;
figure(figi)

hold on
j=1;

pop_dr=10e3*mr_cnt;
% h(j) = errorbar([lcadc_dr(1) lcadc_dr(2) lcadc_dr(3)],[mean(lcadc_perf(1,:)) mean(lcadc_perf(2,:)) mean(lcadc_perf(3,:))], [std(lcadc_perf(1,:)) std(lcadc_perf(2,:)) std(lcadc_perf(3,:))],'Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;
% h(j) = errorbar([apdsm_200m_dr(1) apdsm_200m_dr(2) apdsm_200m_dr(3) apdsm_200m_dr(4)],[mean(apdsm_200m_perf(1,:)) mean(apdsm_200m_perf(2,:)) mean(apdsm_200m_perf(3,:)) mean(apdsm_200m_perf(4,:))], [std(apdsm_200m_perf(1,:)) std(apdsm_200m_perf(2,:)) std(apdsm_200m_perf(3,:)) std(apdsm_200m_perf(4,:))],'Color',[0.8500 0.3250 0.0980],'LineWidth',3); j=j+1;
% h(j) = errorbar([frame_1000_dr(1) frame_1000_dr(2) frame_1000_dr(3)], [mean(frame_1000_perf(1,:)) mean(frame_1000_perf(2,:)) mean(frame_1000_perf(3,:))] ,[std(frame_1000_perf(1,:)) std(frame_1000_perf(2,:)) std(frame_1000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
% h(j) = errorbar([frame_5000_dr(1) frame_5000_dr(2) frame_5000_dr(3)], [mean(frame_5000_perf(1,:)) mean(frame_5000_perf(2,:)) mean(frame_5000_perf(3,:))] ,[std(frame_5000_perf(1,:)) std(frame_5000_perf(2,:)) std(frame_5000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
h(j) = errorbar([lcadc_dr(1) lcadc_dr(2) lcadc_dr(3) lcadc_dr(4)]./pop_dr,[mean(lcadc_perf(1,:)) mean(lcadc_perf(2,:)) mean(lcadc_perf(3,:)) mean(lcadc_perf(4,:))], [std(lcadc_perf(1,:)) std(lcadc_perf(2,:)) std(lcadc_perf(3,:)) std(lcadc_perf(4,:))],'->','Color',[0 0.4470 0.7410],'LineWidth',3); j=j+1;
h(j) = errorbar([apdsm_200m_dr(1) apdsm_200m_dr(2) apdsm_200m_dr(3) apdsm_200m_dr(4)]./pop_dr,[mean(apdsm_200m_perf(1,:)) mean(apdsm_200m_perf(2,:)) mean(apdsm_200m_perf(3,:)) mean(apdsm_200m_perf(4,:))], [std(apdsm_200m_perf(1,:)) std(apdsm_200m_perf(2,:)) std(apdsm_200m_perf(3,:))  std(apdsm_200m_perf(4,:))],'-s','Color',[0.8500 0.3250 0.0980],'LineWidth',3); j=j+1;
%h(j) = errorbar([frame_1000_dr(1) frame_1000_dr(2) frame_1000_dr(3)], [mean(frame_1000_perf(1,:)) mean(frame_1000_perf(2,:)) mean(frame_1000_perf(3,:))] ,[std(frame_1000_perf(1,:)) std(frame_1000_perf(2,:)) std(frame_1000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
%h(j) = errorbar([frame_5000_dr(1) frame_5000_dr(2) frame_5000_dr(3)], [mean(frame_5000_perf(1,:)) mean(frame_5000_perf(2,:)) mean(frame_5000_perf(3,:))] ,[std(frame_5000_perf(1,:)) std(frame_5000_perf(2,:)) std(frame_5000_perf(3,:))],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
h(j) = line([0.01 10], [0.7458 0.7458],'LineStyle','--','Color',[0.4660 0.6740 0.1880]);
% function datarate = spkrate_to_datarate_lc(spkrate, mr_cnt)
%     
%     datarate = spkrate*(1+2*log2(sqrt(mr_cnt)));
% 
% end
% 
% 
% function datarate = spkrate_to_datarate(spkrate, mr_cnt)
%     
%     datarate = spkrate*2*log2(sqrt(mr_cnt));


set(gca,'XScale','log');
%xlabel('Data-rate (bps)')
xlabel('Output Data-rate (AER encoding) Normalized to the Frame Output Data-rate')
ylabel('Classification Performance across 6 folds')
%title('Classification Performance versus Data-rate: Kylberg 6-class Texture Dataset')
title('Classification Performance versus Normalized Data-rate: Kylberg 6-class Texture Dataset')
%lgd = legend(h,['SNN: LCADC'],['SNN: N-LCADC tau=200ms'],['Frame-trained RNN: fsample=1000Hz'],['Frame-trained RNN: fsample=5000Hz'])

lgd = legend(h,['SNN: LCS'],['SNN: N-LCS tau=200ms'],['RNN: Frame 10-bit fs=5kHz'])
lgd.Location = 'southwest';
ylim([0 1])
grid on
%text(1/5,0.3,displayFormula("Spike_Rate * (1 + 2 * log2(sqrt(Sensor_Count)))"))
micasplot
set(findall(gcf,'-property','FontSize'),'FontSize',15)
h(1).MarkerSize = 18;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;

set(findall(gcf,'-property','FontSize'),'FontSize',20)
lgd.FontSize = 25; 

% Plot classification rate PER datarate
figi = figi+1;
figure(figi)

hold on
apdsm_20m=[mean(apdsm_20m_perf(2,1:kfolds))/apdsm_20m_dr(2) mean(apdsm_20m_perf(4,1:kfolds))/apdsm_20m_dr(4)];
apdsm_2000m=[mean(apdsm_2000m_perf(2,1:kfolds))/apdsm_2000m_dr(2) mean(apdsm_2000m_perf(4,1:kfolds))/apdsm_2000m_dr(4)];
frame_1000=[mean(frame_1000_perf(1,1:kfolds))/frame_1000_dr(1) mean(frame_1000_perf(2,1:kfolds))/frame_1000_dr(2) mean(frame_1000_perf(3,1:kfolds))/frame_1000_dr(3)];

bar([apdsm_20m apdsm_2000m frame_1000])

%% Power model for APDSM and SAR (for same resolution)
maxSR=200*ones(1,6);  
mr_cnt=mr_cnt*ones(1,6)
inputBW=100;
[Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2([0.5 1 2 3 4 6],[4 4 4 4 4 4],2000e-3,maxSR,inputBW,apdsm_2000m_sr,mr_cnt,1000e-6*ones(1,6))


figure
h(1)=plot([0.5 1 2 3 4 6],Pafe_tot); hold on;
h(2)=plot([0.5 1 2 3 4 6],P_v2i); hold on;
h(3)=plot([0.5 1 2 3 4 6],Picomp_stat); hold on;
h(4)=plot([0.5 1 2 3 4 6],Pcomp_dyn); hold on;
h(5)=plot([0.5 1 2 3 4 6],Pave_recfilt); hold on;
h(6)=plot([0.5 1 2 3 4 6],Pdig); hold on;
h(7)=plot([0.5 1 2 3 4 6],Pbias); hold on;
h(8)=plot([0.5 1 2 3 4 6],Paer); hold on;
h(9)=plot([0.5 1 2 3 4 6],Ptot); hold on;
h(10)=plot([0.5 1 2 3 4 6],Pafe_sar_tot,'--'); hold on;
h(11)=plot([0.5 1 2 3 4 6],Psar_adc,'--'); hold on;
h(12)=plot([0.5 1 2 3 4 6],Pframes_io,'--'); hold on;
h(13)=plot([0.5 1 2 3 4 6],Pframes,'--'); hold on;
set(gca,'YScale','log');
xlabel('Nx')
ylabel('Power consumption (W)')
%title('Classification Performance versus Data-rate: LMT11 dataset')
lgd = legend(h,['P_{AFE}'],['P_{V2I}'],['P_{comparator,static}'],['P_{comparator,dyn}'],['P_{reconstruction filter}'],['P_{digital}'],['P_{rowcolumn biasing}'],['P_{IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northwest';
grid on;

%% sweep Nth == Nx
[Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2([1 2 3 4 5 6],[1 2 3 4 5 6],2000e-3,maxSR,inputBW,apdsm_2000m_sr,mr_cnt,1e-3*ones(1,6))


figure
h(1)=plot([0.5 1 2 3 4 6],Pafe_tot); hold on;
h(2)=plot([0.5 1 2 3 4 6],P_v2i); hold on;
h(3)=plot([0.5 1 2 3 4 6],Picomp_stat); hold on;
h(4)=plot([0.5 1 2 3 4 6],Pcomp_dyn); hold on;
h(5)=plot([0.5 1 2 3 4 6],Pave_recfilt); hold on;
h(6)=plot([0.5 1 2 3 4 6],Pdig); hold on;
h(7)=plot([0.5 1 2 3 4 6],Pbias); hold on;
h(8)=plot([0.5 1 2 3 4 6],Paer); hold on;
h(9)=plot([0.5 1 2 3 4 6],Ptot); hold on;
h(10)=plot([0.5 1 2 3 4 6],Pafe_sar_tot,'--'); hold on;
h(11)=plot([0.5 1 2 3 4 6],Psar_adc,'--'); hold on;
h(12)=plot([0.5 1 2 3 4 6],Pframes_io,'--'); hold on;
h(13)=plot([0.5 1 2 3 4 6],Pframes,'--'); hold on;
set(gca,'YScale','log');
xlabel('Nth == Nx')
ylabel('Power consumption (W)')
%title('Classification Performance versus Data-rate: LMT11 dataset')
lgd = legend(h,['P_{AFE}'],['P_{V2I}'],['P_{comparator,static}'],['P_{comparator,dyn}'],['P_{reconstruction filter}'],['P_{digital}'],['P_{rowcolumn biasing}'],['P_{IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northwest';
grid on;


%% Accuracy per power
%fom_2000m(1) = mean(apdsm_20m_perf(1,1:kfolds)
%fom_2000m(2) = mean(apdsm_20m_perf(2,1:kfolds)



%%-----------------------------------------------------------------
%%-----------------------------------------------------------------
%% Dataset: Kursun
% APDSM 1b TAU=20ms

% TRAIN PERF
% mean(0) placeholder for empty cells
% i indexing to easily insert rows
i=1;
% NOISELESS
apdsm_20m_perf(1,1:kfolds) = [0];  % 0.5b
apdsm_20m_perf(2,1:kfolds) = [32.605555555555554 44.27962962962963 43.281481481481485 44.22592592592592 48.294444444444444 44.5462962962963]./100;  % 1b
apdsm_20m_perf(3,1:kfolds) = [0];  % 2b
apdsm_20m_perf(4,1:kfolds) = [31.292592592592595 28.77962962962963 32.76111111111111 27.424074074074074 29.71666666666667 24.881481481481483]./100;  % 3b

apdsm_2000m_perf(1,1:kfolds) = [0];  % 0.5b
apdsm_2000m_perf(2,1:kfolds) = [29.425925925925927 28.125925925925927 29.42222222222222 29.246296296296297 26.625925925925927 28.44074074074074]./100;  % 1b
apdsm_2000m_perf(3,1:kfolds) = [0];  % 2b
apdsm_2000m_perf(4,1:kfolds) = [45.181481481481484 45.21666666666667 44.92407407407407 47.37407407407407 44.80925925925926 44.922222222222224]./100;  % 3b

frame_1000_perf(1,1:kfolds) = [55 55 45 35 55 35]./100;  % 4b
frame_1000_perf(2,1:kfolds) = [85 40 35 85 80 60]./100;  % 8b
frame_1000_perf(3,1:kfolds) = [55 50 60 40 60 60]./100;  % 16b

% spikerate over 1.67s 
apdsm_20m_sr(1) = 5569.21656686627; %4.6740e+03;  % 0.5b
apdsm_20m_sr(2) = 7423.18363273453; %6.2813e+03;  % 1b
apdsm_20m_sr(3) = 13644.001996008; %1.1569e+04;  % 2b
apdsm_20m_sr(4) = 26020.1696606786; %2.2155e+04;  % 3b

apdsm_20m_dr(1) = spkrate_to_datarate(apdsm_20m_sr(i,1),mr_cnt);  % 0.5b
apdsm_20m_dr(2) = spkrate_to_datarate(apdsm_20m_sr(i,2),mr_cnt);  % 1b
apdsm_20m_dr(3) = spkrate_to_datarate(apdsm_20m_sr(i,3),mr_cnt);  % 2b
apdsm_20m_dr(4) = spkrate_to_datarate(apdsm_20m_sr(i,4),mr_cnt);  % 3b

apdsm_2000m_sr(1) = 42.7944111776447;  % 0.5b
apdsm_2000m_sr(2) = 51.3173652694611;  % 1b
apdsm_2000m_sr(3) = 95.2794411177645;  % 2b
apdsm_2000m_sr(4) = 195.204590818363;  % 3b

apdsm_2000m_dr(1) = spkrate_to_datarate(apdsm_2000m_sr(i,1),mr_cnt);  % 0.5b
apdsm_2000m_dr(2) = spkrate_to_datarate(apdsm_2000m_sr(i,2),mr_cnt);  % 1b
apdsm_2000m_dr(3) = spkrate_to_datarate(apdsm_2000m_sr(i,3),mr_cnt);  % 2b
apdsm_2000m_dr(4) = spkrate_to_datarate(apdsm_2000m_sr(i,4),mr_cnt);  % 3b

frame_1000_dr(1) = frame_to_datarate(100,4,mr_cnt);  % 4b
frame_1000_dr(2) = frame_to_datarate(100,8,mr_cnt);  % 8b
frame_1000_dr(3) = frame_to_datarate(100,16,mr_cnt);  % 16b

% Plot classification rate vs datarate
figi = figi+1;
figure(figi)

hold on
scatter(apdsm_20m_dr(2),apdsm_20m_perf(2,:),'red','o')
scatter(apdsm_20m_dr(4),apdsm_20m_perf(4,:),'red','d')

scatter(apdsm_2000m_dr(2),apdsm_2000m_perf(2,:),'magenta','o')
scatter(apdsm_2000m_dr(4),apdsm_2000m_perf(4,:),'magenta','d')

scatter(frame_1000_dr(1),frame_1000_perf(1,:),'green','o')
scatter(frame_1000_dr(2),frame_1000_perf(2,:),'green','d')
scatter(frame_1000_dr(3),frame_1000_perf(3,:),'green','+')

ylim([0 1])
grid on

% Plot classification rate vs datarate (errorbar)
figi = figi+1;
figure(figi)

hold on
h(1) = errorbar(apdsm_20m_dr(2),mean(apdsm_20m_perf(2,:)),std(apdsm_20m_perf(2,:)),'red');
h(2) = errorbar(apdsm_20m_dr(4),mean(apdsm_20m_perf(4,:)),std(apdsm_20m_perf(4,:)),'red');

h(3) = errorbar(apdsm_2000m_dr(2),mean(apdsm_2000m_perf(2,:)),std(apdsm_2000m_perf(2,:)),'magenta');
h(4) = errorbar(apdsm_2000m_dr(4),mean(apdsm_2000m_perf(4,:)),std(apdsm_2000m_perf(4,:)),'magenta');

h(5) = errorbar(frame_1000_dr(1),mean(frame_1000_perf(1,:)),std(frame_1000_perf(1,:)),'green');
h(6) = errorbar(frame_1000_dr(2),mean(frame_1000_perf(2,:)),std(frame_1000_perf(2,:)),'green');
h(7) = errorbar(frame_1000_dr(3),mean(frame_1000_perf(3,:)),std(frame_1000_perf(3,:)),'green');

set(gca,'XScale','log');
xlabel('Data-rate (bps)')
ylabel('Classification Performance across 6 folds')
title('Classification Performance versus Data-rate: Kursun12 dataset')
lgd = legend(h,['SLAYER: delta-th=1b tau=20ms'],['SLAYER: delta-th=3b tau=20ms'],['SLAYER: delta-th=1b tau=2000ms'],['SLAYER: delta-th=3b tau=2000ms'],['RNN: N=4b fsample=100Hz'],['RNN: N=8b fsample=100Hz'],['RNN: N=16b fsample=100Hz'])
lgd.FontSize = 9; lgd.Location = 'northwest';
ylim([0 1])
grid on

% Plot classification rate PER datarate
figi = figi+1;
figure(figi)

hold on
apdsm_20m=[mean(apdsm_20m_perf(2,1:kfolds))/apdsm_20m_dr(2) mean(apdsm_20m_perf(4,1:kfolds))/apdsm_20m_dr(4)];
apdsm_2000m=[mean(apdsm_2000m_perf(2,1:kfolds))/apdsm_2000m_dr(2) mean(apdsm_2000m_perf(4,1:kfolds))/apdsm_2000m_dr(4)];
frame_1000=[mean(frame_1000_perf(1,1:kfolds))/frame_1000_dr(1) mean(frame_1000_perf(2,1:kfolds))/frame_1000_dr(2) mean(frame_1000_perf(3,1:kfolds))/frame_1000_dr(3)];

bar([apdsm_20m apdsm_2000m frame_1000])

function datarate = spkrate_to_datarate_lc(spkrate, mr_cnt)
    
    datarate = spkrate*(1+2*log2(sqrt(mr_cnt)));

end


function datarate = spkrate_to_datarate(spkrate, mr_cnt)
    
    datarate = spkrate*2*log2(sqrt(mr_cnt));

end


function datarate = frame_to_datarate(samplerate, bit_res, mr_cnt)
    
    datarate = samplerate * bit_res * mr_cnt;

end