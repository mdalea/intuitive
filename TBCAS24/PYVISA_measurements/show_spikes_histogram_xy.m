%% Author: Mark Daniel Alea
% mark.alea@kuleuven.be
%
% reads .bs2 files and display histogram of the x,y spike addresses (long
% Ts format, typically direct recordings)


folderPath = pwd;
name = 'sensorized_test_1b_pdms_N4b_squaretip_indent_sorted_bk'
trial=1;
chunks=0;  % 0 if dataset without the -x
%name = 'latiti'
%name = 'N_3b_allchannels_1p80mvpp_250mvofs_cl1_tr1';

if chunks==0
    append = '';
else
    append = ['-',num2str(chunks)];
end

filename = [folderPath,'/out/',name,'/',num2str(trial),append,'.bs2']
%TD = Read_Ndataset(filename);
TD = Read_Ndataset_longTs(filename);

% figure
% hold all;
% for spikeCount = 1:length(TD.ts)
%     if TD.p(spikeCount)==1  % ON spike
%         plot([TD.ts(spikeCount)/1e6 TD.ts(spikeCount)/1e6], ...
%             [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k');
%     else   % OFF spike
%        plot([TD.ts(spikeCount)/1e6 TD.ts(spikeCount)/1e6], ...
%             [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k','Color','red');
%     end 
% end
% 
% grid on
% xlabel('Time (s)');
% ylabel('Taxel Number');
% title([folderPath,'/out/',name,'/',num2str(trial),append,'.bs2']);
% 
% TD_on = [];
% TD_off = [];
% 
% TD_on.x = TD.x(TD.p==1)
% TD_on.y = TD.y(TD.p==1)
% TD_on.p = TD.p(TD.p==1)
% TD_on.ts = TD.ts(TD.p==1)
% 
% TD_off.x = TD.x(TD.p==2)
% TD_off.y = TD.y(TD.p==2)
% TD_off.p = TD.p(TD.p==2)
% TD_off.ts = TD.ts(TD.p==2)
% 
% ISI_on = diff(TD_on.ts)
% ISI_off = diff(TD_off.ts)
% 
% figure
% histogram(ISI_on,'BinWidth',5)
% 
% grid on
% xlabel('ISI on spikes (ms)');
% 
% figure
% histogram(ISI_off,'BinWidth',5)
% 
% grid on
% xlabel('ISI off spikes (ms)');
% micasplot


figure

starttime_isi = 0; %40 s
TD.x = TD.x(TD.ts>starttime_isi);
TD.y = TD.y(TD.ts>starttime_isi);
TD.p = TD.p(TD.ts>starttime_isi);
TD.ts = TD.ts(TD.ts>starttime_isi);

% endtime_isi = 80000000; %2 s
% TD.x = TD.x(TD.ts<endtime_isi);
% TD.y = TD.y(TD.ts<endtime_isi);
% TD.p = TD.p(TD.ts<endtime_isi);
% TD.ts = TD.ts(TD.ts<endtime_isi);

TD_on = [];
TD_off = [];

TD_on.x = TD.x(TD.p==1)
TD_on.y = TD.y(TD.p==1)
TD_on.p = TD.p(TD.p==1)
TD_on.ts = TD.ts(TD.p==1)

TD_off.x = TD.x(TD.p==2)
TD_off.y = TD.y(TD.p==2)
TD_off.p = TD.p(TD.p==2)
TD_off.ts = TD.ts(TD.p==2)

subplot(1,2,1)
histogram(TD_on.x)
title('X addresses')
micasplot
subplot(1,2,2)
histogram(TD_on.y)
title('Y addresses')
micasplot
