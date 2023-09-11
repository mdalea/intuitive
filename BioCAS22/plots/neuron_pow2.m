
function [Pafe_tot, P_v2i, Picomp_stat,Pcomp_dyn,Pave_recfilt,Pdig, Pbias, Paer,Ptot,Pafe_sar_tot,Psar_adc,Pframes_io,Pframes] = neuron_pow2(Nx,Nth,tau,maxSR,inputBW,fsr,mr_cnt,Vnoise_rms)
% input: 
%Nx : delta-Ix = fs_ratio/(Req*2^Nx); 
%  ->     fs_ratio = actual usable swing / 1V swing in MATLAB
%Nth:  Ith = fs_ratio/(Req*2^Nth)
%tau: refractory filter time constant
%maxSR: max slew rate of input voltage signal (post-gain & pre-V2I)
%inputBW: signal input bandwidth
%fsr: population spike rate
%Vnoise_rms: noise_rms with respect to a 1 unit fullswing in MATLAB
%    Inoise_rms = Vnoise_rms*fs_ratio/Req -> larger Inoise_rms for smaller
%    Req but larger Ifs = 1V*fs_ratio/Req as well so MATLAB model is OK
fs_ratio=0.6;  % ratio of actual fullscale range of the signal (post-gain), compared to 1 V swing
tpw_spike_actual = 355e-9; % actual value used

%% MATLAB fullscale signal is 1V (after an AFE gain of 5). Fullscale current signal is 1V*fs_ratio/Req. Normalize everything by fs_ratio/Req

VDD=1;
m=1.5; % subthreshold slope factor
k=1.38e-23;
T=300;
q=1.602e-19;
Vt=k*T/q;
Av_cl=5;  % closed-loop gain of AFE
maxSR_adj = fs_ratio*maxSR;
%tloop_tot = min[1/(fsr*mr_cnt) tau(1-(maxSR_adj*tpw_spike/(Req*delta_Ix))]
tloop_tot = 1./(fsr)  % 10% to comparator, 50% to rowcol lines, 40% to AER digital
%tpw_spike = 0.1.*tloop_tot   % we can relax spike pulse width for relaxed loop delay requirements
tpw_spike = 0.5.*tloop_tot

% Comparator block
tdelay_comp = tloop_tot.*0.1;   % allocate 10% of total loop delay (delay from taxel to AER and back) to the comparator delay
BW_comp = 2.3./(2.*pi.*tdelay_comp)  % 10 pct settling error tdelay = 2.3tau
Cl_comp=10e-15;  % input C of logic + Cds of comparator
Rout=1./(2.*pi.*BW_comp.*Cl_comp);


Vlsb=1./(2.^Nth)
Vlsb_adj = Vlsb.*fs_ratio;  % adjust LSB as ratio of the actual usable full-scale range
Vlsb_dist = Vlsb_adj./sqrt(12);   % actual Vlsb needed to reduce distortion

%% Compute Req required to achieve comparator resolution and BW
Req = (Vlsb_dist./VDD).*Rout   % Iactual = 1*Vfs/Req
% smaller sensor voltage resolution requires lower Req, which translates to
% larger average current post-V2I

% now that Req is computed, let's normalize our delta-Ix and Ith
delta_Ix = fs_ratio./(Req.*2.^Nx); 
Ith = fs_ratio./(Req.*2.^Nth);

Vsig_ave=0.5; % average sensor signal value (post-gain, pre-V2I)
P_v2i = VDD.*(Vsig_ave*(fs_ratio./Req)) .* mr_cnt;
Picomp_stat = VDD.*Ith .* mr_cnt;  % quiescent current due to Ith
Cl_comp_dyn = 100e-15;
Pcomp_dyn = (Cl_comp_dyn).*VDD.^2 .* fsr;

%% Refractory filter
Ileak=10e-15;   % check actual Ileak which is way smaller than this
Ctau = Ileak.*tau./26e-3  
%tpw_spike = 355e-9; % actual value used
delta_Ix_actual = 1e-9;
Ipulse_actual = 60e-6;
Io = delta_Ix_actual.*Ctau.*m.*Vt./(Ipulse_actual.*tpw_spike_actual); % fit actual Io from simulation results
Ipulse = delta_Ix.*Ctau.*m.*Vt./(Io.*tpw_spike);

% check if required tloop to avoid slope overload is more relaxed (higher)
% than the required to transmit spikes off-chip
if tau.*(1-(maxSR_adj.*tpw_spike./(Req.*delta_Ix))) > tloop_tot
    disp(["Slope overload avoided"])
else
    disp(["Slope overload"])
end

Iave_recfilt = 2.*(delta_Ix.*Ctau.*m.*Vt./Io) .* fsr % factor of 2 due to the mirror
Ix_ave = 1.*fs_ratio./Req .* mr_cnt % approximate Ix to be equal to the input
Pave_recfilt = VDD.*(Iave_recfilt+Ix_ave);

%% AFE
%inputBW = 100;  % input BW
fscan = 2.^Nth * pi * inputBW       % equivalent sampling period is now dependent on bit resolution
%tsettling = 0.1./inputBW;  % assumes settling within 10% of period
tsettling = 0.1./fscan;  % assumes settling within 10% of period
err_dyn = 0.5.*(Vlsb_adj./(1*fs_ratio)) % assign 50% of the total error to settling
%tausettling = tsettling/2.3; % 10% settling error 2.3tsettling per decade
tausettling = tsettling./(-1.*log(err_dyn))
F1 = 1/(Av_cl+1);
GBW1 = 1./(F1.*tausettling)
F2 = 1/(1+1); %unity gain 2nd stage
GBW2 = 1./(F2.*tausettling)

% output-referred noise Vnoise_rms
%noise_ratio_stage1 = 0.9;  % how much noise is allocated for first stage OTA
noise_ratio_stage1 = 0.5
%Cl_eff1 = k*T./(noise_ratio_stage1^2.*Vnoise_rms.^2*Av_cl^2); % required Cl_eff to meet kT/C
Cl_eff1 = k*T./(noise_ratio_stage1^2.*Vnoise_rms.^2); % required Cl_eff to meet kT/C
gm1 = GBW1*2*pi.*Cl_eff1;
Id1 = gm1.*k.*T./q; % weak inversion
Itail1 = 2.*Id1;

Cl_eff2 = k*T./((1-noise_ratio_stage1)^2*Vnoise_rms.^2); % required Cl_eff2 to meet kT/C. 
gm2 = GBW2*2*pi.*Cl_eff2;
Id2 = gm2.*k.*T./q; % weak inversion
Itail2 = 2.*Id2;

Pafe_tot = VDD.*(Itail1 + Itail2) .* mr_cnt;

%% Digital
Cpar = 500e-15;
trowcol_rise = 0.5.*tloop_tot;
Ibias = Cpar.*VDD./trowcol_rise;
Pbias = Ibias.*VDD .* 2.*sqrt(mr_cnt);

gamma = 1; % factor to estimate total pwoer of logic
Cpar_dig=100e-15;
Pdig = gamma.*Cpar_dig.*2.*sqrt(mr_cnt).*VDD^2 ./ (tloop_tot.*0.4); % digital per row and col

%% IO / AER
VDD_IO=5;
Cout = 5e-12;
addr_bits = 2.*ceil(log2(sqrt(mr_cnt)));
Paer = (addr_bits .* Cout .* VDD_IO^2 .* fsr)  + (2 .* Cout .* VDD_IO^2 .* fsr);  % addrbits + ACK + REQ

%% total power consumption
Ptot = Pafe_tot + P_v2i + Picomp_stat + Pcomp_dyn + Pave_recfilt + Pbias + Pdig + Paer;  % multiply by number of spiking units: taxels (MR-level), heminode-level, or node-level

%% FRAMES as baseline
% sar AFE
tsettling_sar= 0.1./(2*inputBW);  % assumes settling within 10% of period
err_dyn_sar = 0.5.*(Vlsb_adj./(1*fs_ratio)) % assign 50% of the total error to settling
%tausettling = tsettling/2.3; % 10% settling error 2.3tsettling per decade
tausettling_sar = tsettling_sar./(-1.*log(err_dyn_sar))
%F1 = 1/(Av_cl+1);
GBW1_sar = 1./(F1.*tausettling_sar)
GBW2_sar = 1./(F2.*tausettling_sar)

%noise_ratio_stage1 = 0.9;  % how much noise is allocated for first stage OTA
%Cl_eff1 = k*T./(noise_ratio_stage1^2.*Vnoise_rms.^2*Av_cl^2); % required Cl_eff to meet kT/C
gm1_sar= GBW1_sar.*2.*pi.*Cl_eff1;
Id1_sar = gm1_sar.*k.*T./q; % weak inversion
Itail1_sar = 2.*Id1_sar;

%Cl_eff2 = k*T./((1-noise_ratio_stage1)^2*Vnoise_rms.^2); % required Cl_eff2 to meet kT/C. 
gm2_sar = GBW2_sar.*2.*pi.*Cl_eff2;
Id2_sar = gm2_sar.*k.*T./q; % weak inversion
Itail2_sar = 2.*Id2_sar;

Pafe_sar_tot = VDD.*(Itail1_sar + Itail2_sar);


SAR_FOM = 10e-15; %J/conv-step
fsample=2*inputBW*mr_cnt
Psar_adc = SAR_FOM.*fsample.*2.^Nth
frame_dr = Nth.*fsample % frame datarate
Pframes_io =  Cout .* VDD_IO^2 .* frame_dr
Pframes = Pafe_sar_tot + Psar_adc + Pframes_io 

end