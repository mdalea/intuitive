%% Author: Mark Daniel Alea
% mark.alea@kuleuven.be
% 04/02/2023
% reads .bs2 files and display as spatiotemporal spikes


folderPath = pwd; % replace with path to dataset
name = 'N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs';
name = 'N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs_onedac';
sample=1;  % choose which sample to plot

filename = [folderPath,'/out/',name,'/',num2str(sample),append,'.bs2']

TD = Read_Ndataset(filename);

figure
hold all;
for spikeCount = 1:length(TD.ts)
    if TD.p(spikeCount)==1  % ON spike
        plot([TD.ts(spikeCount)/1e3 TD.ts(spikeCount)/1e3], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k');
    else   % OFF spike
       plot([TD.ts(spikeCount)/1e3 TD.ts(spikeCount)/1e3], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k','Color','red');
    end 
end

grid on
xlabel('Time (ms)');
ylabel('Taxel Number');
ylim([0 191])
title('INTUITIVE spike output')

micasplot_large