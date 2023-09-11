format long
%close all

folderPath = pwd;
name = 'isi_10hz_100mvpp_itail_1nA_squarewave_00_sorted';
name = 'isi_100hz_25mvpp_itail_1nA';
name = 'isi_1khHz_50mVpp_sanalast2';
name = 'N_4b_allchannels_cl1_auto_nospkfilter_12x16_180mvpp_250mvofs';
trial=1;
chunks=1;  % 0 if dataset without the -x
% name = 'latiti_6b'
% name = 'N_3b_allchannels_cl1_auto_nospkfilter_12x16_vibration';
% % name = 'latiti_isi_1khz_25mvpp_sorted'
% name = 'isi_10hz_100mvpp_itail_5nA_squarewave_00'

if chunks==0
    append = '';
else
    append = ['-',num2str(chunks)];
end

filename = [folderPath,'/out/',name,'/',num2str(trial),append,'.bs2']
%TD = Read_Ndataset(filename);
TD = Read_Ndataset_longTs(filename);

starttime_isi = 110000; %2 s
TD.x = TD.x(TD.ts>starttime_isi);
TD.y = TD.y(TD.ts>starttime_isi);
TD.p = TD.p(TD.ts>starttime_isi);
TD.ts = TD.ts(TD.ts>starttime_isi);

endtime_isi = 400000; %2 s
TD.x = TD.x(TD.ts<endtime_isi);
TD.y = TD.y(TD.ts<endtime_isi);
TD.p = TD.p(TD.ts<endtime_isi);
TD.ts = TD.ts(TD.ts<endtime_isi);



figure
hold all;
for spikeCount = 1:length(TD.ts)
    if TD.p(spikeCount)==1  % ON spike
        plot([TD.ts(spikeCount)/1e6 TD.ts(spikeCount)/1e6], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k');
    else   % OFF spike
       plot([TD.ts(spikeCount)/1e6 TD.ts(spikeCount)/1e6], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k','Color','red');
    end 
end

grid on
xlabel('Time (s)');
ylabel('Taxel Number');
title([folderPath,'/out/',name,'/',num2str(trial),append,'.bs2']);

TD.ts = TD.ts./1e3

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

ISI_on = diff(TD_on.ts)
ISI_off = diff(TD_off.ts)

figure
hold on
h(1)= histogram(ISI_on,'BinWidth',5/1e3)
% histogram(ISI_on)

grid on
xlabel('ISI for ON/OFF spikes (ms)');

% t=text(99.89,80,'tt')
% t.FontSize=24

micasplot_large

%figure
h(2) = histogram(ISI_off,'BinWidth',5/1e3)
% histogram(ISI_off)

mu=mean(ISI_on)
sigma=std(ISI_on)
sigmaovermu = 100*sigma/mu 

mean(ISI_off)
std(ISI_off)

lgd=legend(h,{['ON - Mean:',num2str(mean(ISI_on)),' ms',newline,'SD:',num2str(std(ISI_on)),' ms'],['OFF - Mean:',num2str(mean(ISI_off)),' ms',newline,'SD:',num2str(std(ISI_off)),' ms']})

% grid on
% xlabel('ISI off spikes (ms)');
% size(TD.ts)

micasplot_large
lgd.FontSize = 34;
