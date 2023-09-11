close all
clearvars

%% AFE noise sweep
% compare SAR vs spike-based

%noise_array = [1e-6 100e-6 1e-3 10e-3];
noise_array = logspace(-4,-2,30)
maxSR=120;  
mr_cnt=64
inputBW=10e3;
%Nth=[4 4 4 4 1 1 1 1];
%Nx=[4 4 4 4 1 1 1 1];
%tau=[2000e-3*ones(1,2*size(noise_array,2)) 200e-3*ones(1,2*size(noise_array,2)) 20e-3*ones(1,2*size(noise_array,2))];
N=6; Nth=6; tau=200e-3;
N_arr = N*ones(1,size(noise_array,2));
Nth_arr = Nth*ones(1,size(noise_array,2));
tau_arr = tau*ones(1,size(noise_array,2));
[Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2(N_arr,Nth_arr,tau_arr,maxSR,inputBW,spikerate_fit(tau_arr,N_arr,Nth_arr),mr_cnt,noise_array);
Pspike_tot = P_v2i + Picomp_stat + Pcomp_dyn + Pdig + Pbias + Pave_recfilt;

% Neuron-like
figure
h(1)=plot(noise_array,Pafe_tot,'r'); hold on;
%h(2)=plot(noise_array,Pspike_tot,'Color',[0 0.4470 0.7410]); hold on;
h(2)=plot(noise_array,Paer,'Color',[0.4660 0.6740 0.1880]); hold on;
%h(4)=plot(noise_array,Ptot,'r'); hold on;
h(3)=plot(noise_array,Pafe_sar_tot,'--','Color','r'); hold on;
%h(6)=plot(noise_array,Psar_adc,'--','Color',[0 0.4470 0.7410]); hold on;
h(4)=plot(noise_array,Pframes_io,'--','Color',[0.4660 0.6740 0.1880]); hold on;
%h(8)=plot(noise_array,Pframes,'r--'); hold on;
set(gca,'YScale','log'); set(gca,'XScale','log');
xlabel('AFE Output noise RMS')
ylabel('Power consumption (W)')
title(['Frame (' , num2str(N) , 'b SAR) vs Spike Readout (' , num2str(N) , 'b Neuron-like) - Power Consumption vs Noise - ' , num2str(mr_cnt) , ' sensors'])
lgd = legend(h,['P_{AFE}'],['P_{AER IO}'],['P_{AFE SAR}'],['P_{frames IO}'])
lgd.FontSize = 11; lgd.Location = 'northeast';
grid on;


micasplot

%% AFE noise sweep
% compare SAR vs spike-based


[Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2(N_arr,Nth_arr,tau_arr,maxSR,inputBW,spikerate_fit(tau_arr,N_arr,Nth_arr),mr_cnt,noise_array);
Pspike_tot = P_v2i + Picomp_stat + Pcomp_dyn + Pdig + Pbias + Pave_recfilt;

% Neuron-like
figure
h(1)=plot(noise_array,Pafe_tot,'Color',[0.9290 0.6940 0.1250]); hold on;
h(2)=plot(noise_array,Pspike_tot,'Color',[0 0.4470 0.7410]); hold on;
h(3)=plot(noise_array,Paer,'Color',[0.4660 0.6740 0.1880]); hold on;
h(4)=plot(noise_array,Ptot,'r'); hold on;
h(5)=plot(noise_array,Pafe_sar_tot,'--','Color',[0.9290 0.6940 0.1250]); hold on;
h(6)=plot(noise_array,Psar_adc,'--','Color',[0 0.4470 0.7410]); hold on;
h(7)=plot(noise_array,Pframes_io,'--','Color',[0.4660 0.6740 0.1880]); hold on;
h(8)=plot(noise_array,Pframes,'r--'); hold on;
set(gca,'YScale','log'); set(gca,'XScale','log');
xlabel('AFE Output noise RMS')
ylabel('Power consumption (W)')
title(['Frame (' , num2str(N) , 'b SAR) vs Spike Readout (' , num2str(N) , 'b Neuron-like) - Power Consumption vs Noise - ' , num2str(mr_cnt) , ' sensors'])
lgd = legend(h,['P_{AFE}'],['P_{spike}'],['P_{AER IO}'],['P_{spike readout (TOTAL)}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO}'],['P_{frame readout (TOTAL)}'])
lgd.FontSize = 11; lgd.Location = 'northeast';
grid on;


micasplot

%% AFE noise sweep
% compare SAR vs spike-based (LCADC)


[Pafe_lcadc_tot, Picomp_stat_lcadc,Pcomp_dyn_lcadc,Pdac_lcadc,Pdig_lcadc, Pbias_lcadc, Paer_lcadc,Ptot_lcadc,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = lcadc_pow2(Nth_arr,maxSR,inputBW,spikerate_fit_lcadc(Nth_arr),mr_cnt,noise_array);
Pspike_lcadc_tot = Picomp_stat_lcadc + Pcomp_dyn_lcadc + Pdac_lcadc + Pdig_lcadc + Pbias_lcadc;

% LCADC
figure
h(1)=plot(noise_array,Pafe_lcadc_tot,'Color',[0.9290 0.6940 0.1250]); hold on;
h(2)=plot(noise_array,Pspike_lcadc_tot,'Color',[0 0.4470 0.7410]); hold on;
h(3)=plot(noise_array,Paer_lcadc,'Color',[0.4660 0.6740 0.1880]); hold on;
h(4)=plot(noise_array,Ptot_lcadc,'r'); hold on;
h(5)=plot(noise_array,Pafe_sar_tot,'--','Color',[0.9290 0.6940 0.1250]); hold on;
h(6)=plot(noise_array,Psar_adc,'--','Color',[0 0.4470 0.7410]); hold on;
h(7)=plot(noise_array,Pframes_io,'--','Color',[0.4660 0.6740 0.1880]); hold on;
h(8)=plot(noise_array,Pframes,'r--'); hold on;
set(gca,'YScale','log'); set(gca,'XScale','log');
xlabel('AFE Output noise RMS')
ylabel('Power consumption (W)')
title(['Frame (' , num2str(N) , 'b SAR) vs Spike Readout (' , num2str(N) , 'b LCADC) - Power Consumption vs Noise - ' , num2str(mr_cnt) , ' sensors'])
lgd = legend(h,['P_{AFE}'],['P_{LCADC}'],['P_{AER IO}'],['P_{spike readout (TOTAL)}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO}'],['P_{frame readout (TOTAL)}'])
lgd.FontSize = 11; lgd.Location = 'northeast';
grid on;


micasplot


%% bar plot
%P_v2i + Picomp_stat + Pcomp_dyn + Pdig + Pbias + Pave_recfilt;
%Pspike_lcadc_tot = Picomp_stat_lcadc + Pcomp_dyn_lcadc + Pdac_lcadc + Pdig_lcadc + Pbias_lcadc;
%Pafe_sar_tot,Psar_adc,Pframes_io,Pframes
%[Pafe_lcadc_tot, Picomp_stat_lcadc,Pcomp_dyn_lcadc,Pdac_lcadc,Pdig_lcadc, Pbias_lcadc, Paer_lcadc,Ptot_lcadc,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes
%Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes

%bar = [ Pafe_tot(1) P_v2i(1)+Picomp_stat(1)+Pcomp_dyn(1)+Pave_recfilt(1) Pdig(1) Pbias(1)+Paer(1); 0 Pafe_lcadc_tot(1) Picomp_stat_lcadc(1)+Pcomp_dyn_lcadc(1) Pdac_lcadc(1) Pdig_lcadc(1) Pbias_lcadc(1)+Paer_lcadc(1); 0 Pafe_sar_tot(1) ]
figure
x=[1 2 3 4 5 6];
barz = [Pafe_tot(1) Pspike_tot(1) Paer(1); Pafe_lcadc_tot(1) Pspike_lcadc_tot(1) Paer_lcadc(1); Pafe_sar_tot(1) Psar_adc(1) Pframes_io(1); Pafe_tot(end) Pspike_tot(end) Paer(end); Pafe_lcadc_tot(end) Pspike_lcadc_tot(end) Paer_lcadc(end); Pafe_sar_tot(end) Psar_adc(end) Pframes_io(end)];
%arch = ['Spike-based readout: Neuromorphic LCS'; 'Spike-based readout: LCS'; 'Frame-based readout']

bar(x, barz, 'stacked')
set(gca,'XTickLabel',{'6b Spike Neur. (V_{RMS}=100uV)'; '6b Spike (V_{RMS}=100uV)'; '6b Frame (V_{RMS}=100uV)'; '6b Spike: Neur. (V_{RMS}=10mV)'; '6b Spike (V_{RMS}=10mV)'; '6b Frame (V_{RMS}=10mV)'})
set(gca,'YScale','log');
legend('AFE','Converter', 'I/O')
xlabel('AFE Output noise RMS (V)')
ylabel('System Power consumption (W)')
ylabel('System Power consumption (W)')

%100uV rms
stackData(1,1,:) = [Pafe_tot(1) Pspike_tot(1) Paer(1)];
stackData(1,2,:) = [Pafe_lcadc_tot(1) Pspike_lcadc_tot(1) Paer_lcadc(1)];
stackData(1,3,:) = [Pafe_sar_tot(1) Psar_adc(1) Pframes_io(1)];

stackData(2,1,:) = [Pafe_tot(end/2) Pspike_tot(end/2) Paer(end/2)];
stackData(2,2,:) = [Pafe_lcadc_tot(end/2) Pspike_lcadc_tot(end/2) Paer_lcadc(end/2)];
stackData(2,3,:) = [Pafe_sar_tot(end/2) Psar_adc(end/2) Pframes_io(end/2)];

%10mV rms
stackData(3,1,:) = [Pafe_tot(end) Pspike_tot(end) Paer(end)];
stackData(3,2,:) = [Pafe_lcadc_tot(end) Pspike_lcadc_tot(end) Paer_lcadc(end)];
stackData(3,3,:) = [Pafe_sar_tot(end) Psar_adc(end) Pframes_io(end)];

groupLabels = {'V_{RMS}=100uV','V_{RMS}=1mV','V_{RMS}=10mV',}
grp = plotBarStackGroups(stackData, groupLabels)
set(gca,'YScale','log');

%colors = jet(size(grp,2)); %or define your own color order; 1 for each m segments
colors = [0 0.4470 0.7410; 0.8500 0.3250 0.0980; 0.9290 0.6940 0.1250]
colors = repelem(colors,size(grp,1),1); 
colors = mat2cell(colors,ones(size(colors,1),1),3);
set(grp,{'FaceColor'},colors)

labeltop=['Spike: N-LCS', 'Spike: LCS' 'Frame', 'Spike: N-LCS', 'Spike: LCS', 'Frame', 'Spike: N-LCS' ,'Spike: LCS','Frame'];
text(1:3*3,1*ones(1,9),labeltop,'vert','bottom','horiz','center'); 
box off

xlabel('AFE Output noise RMS (V)')
ylabel('System Power consumption (W)')
lgd = legend('AFE','Converter', 'I/O')


micasplot
set(findall(gcf,'-property','FontSize'),'FontSize',20)
lgd.FontSize = 25;

%% Find crossover point where Power (spike neuron) > Power (frame)
% 1uV to 10mV rms
i=1; % N counter 
crossover_pt = [];
noise_array_fine = logspace(-6,3,100)
N_array = [1:10];
tau_array = [2000e-3 200e-3 20e-3];
for N = N_array
    j=1; % tau counter
    for tau= tau_array
        N_arr = N*ones(1,size(noise_array_fine,2));
        tau_arr = tau*ones(1,size(noise_array_fine,2));
        [Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2(N_arr,N_arr,tau_arr,maxSR,inputBW,spikerate_fit(tau_arr,N_arr,N_arr),mr_cnt,noise_array_fine);
        Pspike_tot = P_v2i + Picomp_stat + Pcomp_dyn + Pave_recfilt + Pdig + Pbias;
        diff = abs(Ptot-Pframes);
        crossover_noise = noise_array_fine(find(diff==min(diff)))
        if crossover_noise == max(noise_array_fine)   % no crossover
            crossover_pt(i,j) = 0;            
        else
            crossover_pt(i,j) = noise_array_fine(find(diff==min(diff)))
        end
        j=j+1
    end
    i=i+1
end    

%% Find crossover point where Power (spike LCADC) > Power (frame)
% 1uV to 10mV rms
i=1; % N counter 
crossover_pt_lcadc = [];
%noise_array_fine = logspace(-6,-2,100)
%N_array = [1:10];
for N = N_array
    N_arr = N*ones(1,size(noise_array_fine,2));
    [Pafe_lcadc_tot, Picomp_stat_lcadc,Pcomp_dyn_lcadc,Pdac_lcadc,Pdig_lcadc, Pbias_lcadc, Paer_lcadc,Ptot_lcadc,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = lcadc_pow2(N_arr,maxSR,inputBW,spikerate_fit_lcadc(N_arr),mr_cnt,noise_array_fine);
    Pspike_lcadc_tot = Picomp_stat_lcadc + Pcomp_dyn_lcadc + Pdac_lcadc + Pdig_lcadc + Pbias_lcadc;
    diff = abs(Ptot_lcadc-Pframes);
    crossover_noise = noise_array_fine(find(diff==min(diff)))
    if crossover_noise == max(noise_array_fine)   % no crossover
        crossover_pt_lcadc(i) = 0;            
    else
        crossover_pt_lcadc(i) = noise_array_fine(find(diff==min(diff)))
    end
    i=i+1
end 


figure
h(1)=plot(N_array,crossover_pt(N_array,1),'-+','Color',[0.9290 0.6940 0.1250]); hold on;
h(2)=plot(N_array,crossover_pt(N_array,2),'-^','Color',[0 0.4470 0.7410]); hold on;
h(3)=plot(N_array,crossover_pt(N_array,3),'-x','Color',[0.4660 0.6740 0.1880]); hold on;
h(4)=plot(N_array,crossover_pt_lcadc(N_array),'-o','Color',[0.4940 0.1840 0.5560]); hold on;
set(gca,'YScale','log'); 
xlabel('Bit resolution')
%ylabel('Minimum AFE output noise RMS @ crossover point')
ylabel('AFE Output Noise RMS (V)')
%title(['Frame vs Spikes Readout'])
title(['Minimum AFE Output Noise where Power_{spikes} < Power_{frames}'])
lgd = legend(h,['N-LCS tau=2000ms'],['N-LCS tau=200ms'],['N-LCS tau=20ms'],['LCS'])
lgd.Location = 'northwest';
grid on;

micasplot
h(1).MarkerSize = 18;
h(2).MarkerSize = 18;
h(3).MarkerSize = 18;
h(4).MarkerSize = 18;

h(1).LineWidth = 10;
h(2).LineWidth = 7;
set(findall(gcf,'-property','FontSize'),'FontSize',20)
lgd.FontSize = 25;


function sr = spikerate_fit(tau,Nx,Nth)
    sr = (200e-3./tau).*(2.^(Nth-4))*3009.60416666667; %Population spike rate, fit from tau=200ms Nth=4
end

function sr = spikerate_fit_lcadc(Nth)
    sr = (2.^(Nth-2)).*2429; %Population spike rate, fit from Nth=4
end