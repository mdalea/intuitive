close all
clearvars

%% bit resolution sweep
% compare SAR vs spike-based

% relaxed noise requirements
noise = 100e-6;
Nth_array = [1 2 3 4 5 6 7 8 9 10];
k=size(Nth_array,2)
maxSR=200;  
mr_cnt=64
inputBW=1e3;
Nth=[Nth_array Nth_array Nth_array Nth_array Nth_array Nth_array];
Nx_array=[1*ones(1,size(Nth_array,2)) 4*ones(1,size(Nth_array,2)) 1*ones(1,size(Nth_array,2)) 4*ones(1,size(Nth_array,2)) 1*ones(1,size(Nth_array,2)) 4*ones(1,size(Nth_array,2))];
tau_array = [2000e-3*ones(1,size(Nth_array,2)) 2000e-3*ones(1,size(Nth_array,2)) 200e-3*ones(1,size(Nth_array,2)) 200e-3*ones(1,size(Nth_array,2)) 20e-3*ones(1,size(Nth_array,2)) 20e-3*ones(1,size(Nth_array,2))]
noise_array = noise*ones(1,size(Nx_array,2))
[Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2(Nx_array,Nth,tau_array,maxSR,inputBW,spikerate_fit(tau_array,Nx_array,Nth),mr_cnt,[noise_array])
Pspike_tot = P_v2i + Picomp_stat + Pcomp_dyn + Pave_recfilt + Pdig + Pbias;

j=0;
% tau=2s, Nx=1 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=1, tau=2s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

j=j+1;
% tau=2s, Nx=4 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=4, tau=2s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

j=j+1;
% tau=0.2s, Nx=1 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=1, tau=0.2s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

j=j+1;
% tau=0.2s, Nx=4 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=4, tau=0.2s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

j=j+1;
% tau=0.02s, Nx=1 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=1, tau=0.02s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

j=j+1;
% tau=0.2s, Nx=4 (SUMMARY)
figure
h(1)=plot(Nth_array,Pafe_tot(k*j+1:k*j+k)); hold on;
h(2)=plot(Nth_array,Pspike_tot(k*j+1:k*j+k)); hold on;
h(3)=plot(Nth_array,Paer(k*j+1:k*j+k)); hold on;
h(4)=plot(Nth_array,Ptot(k*j+1:k*j+k)); hold on;
h(5)=plot(Nth_array,Pafe_sar_tot(k*j+1:k*j+k),'--'); hold on;
h(6)=plot(Nth_array,Psar_adc(k*j+1:k*j+k),'--'); hold on;
h(7)=plot(Nth_array,Pframes_io(k*j+1:k*j+k),'--'); hold on;
h(8)=plot(Nth_array,Pframes(k*j+1:k*j+k),'--'); hold on;
set(gca,'YScale','log')
xlabel('Bit resolution')
ylabel('Power consumption (W)')
title(['Frame vs Spike Readout Power vs Bit resolution - Nx=4, tau=0.02s, ',num2str(noise),' Vrms'])
lgd = legend(h,['P_{AFE}'],['P_{spike total}'],['P_{AER IO}'],['P_{total}'],['P_{AFE SAR}'],['P_{SAR}'],['P_{frames IO power}'],['P_{frames total}'])
lgd.FontSize = 9; lgd.Location = 'northeast';
grid on;

function sr = spikerate_fit(tau,Nx,Nth)
    sr = (Nx./1).*(2000e-3./tau).*(Nth./4)*55.4058; %Population spike rate, fit from tau=2000ms, Nx=1, Nth=4
end