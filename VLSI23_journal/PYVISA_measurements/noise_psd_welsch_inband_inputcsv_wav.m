%% READS CSV FILE (PSD) AND PERFORM MATLAB PWELCH AND SHOWS IN-BAND NOISE

% Configure measurement parameters
samplingRate = 500e3; % Sampling rate (5 MHz in this example)
windowTime = 2;
windowSize = samplingRate * windowTime;
overlap = windowSize / 2;

% Save waveform to CSV file
csvFileName ='output\ID_sample_I2_covered_for_paper_itail_1nA_noisepsd__wav_vout_fin_1000000.0_vpp_0.1_vofs_-0.165-0.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform = csvread(csvFileName);

csvFileName_sim ='sim_csv\noisepsd_sim_itail_1nA.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform_sim = csvread(csvFileName_sim,1,0);

% Calculate and plot the power ((Vpk^2/2) -> if with input
%[psdEstimate, freq] = pwelch(waveform, windowSize, overlap, windowSize, samplingRate, 'power', 'onesided');
% Calculate and plot the power spectral density (PSD) ((V^2/Hz)
[psdEstimate, freq] = pwelch(waveform(:,2), windowSize, overlap, windowSize, samplingRate, 'psd', 'onesided'); % psd not power matches better with sim

% Find indices corresponding to the frequency range of interest
flo = 1; % Specify the lower frequency of the bandwidth (in Hz)
fhi = 10e3%10e3; % Specify the higher frequency of the bandwidth (in Hz)
idxRange = find(freq >= flo & freq <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand = sum(psdEstimate(idxRange));

% Calculate the RMS voltage based on the power
voltageScaling = 1; % Replace with the appropriate scaling factor for your waveform
rmsVoltage = sqrt(powerInBand) * voltageScaling;
%--
psdEstimate_sim = waveform_sim(:,2);
idxRange_sim = find(waveform_sim(:,1) >= flo & waveform_sim(:,1) <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand_sim = sum(waveform_sim(idxRange_sim,2));

% Calculate the RMS voltage based on the power
rmsVoltage_sim = sqrt(powerInBand_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage) ' Vrms']);
% Display the integrated noise in RMS voltage
disp(['(SIM) Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage_sim) ' Vrms']);

% Plot the power spectral density
figure;
loglog(freq, psdEstimate); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),waveform_sim(:,2),'-')
%title(['Power Spectral Density (V)']);
xlabel('Frequency (Hz)');
ylabel('PSD (V^2/Hz)');
ylim([1e-2*min(psdEstimate) 1e2*max(psdEstimate)])
legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = min(psdEstimate);
text(x_pos, y_pos, sprintf('v_{noise RMS} (BW: %d Hz to %d Hz) = %.6f V', flo, fhi, rmsVoltage), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
hold off;

% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'.fig'])
saveas(gcf,[csvFileName,'.png'])
%% Plot PSD as charge
Cf=33e-15;
Av=140;
Csensor=172e-15;
chg_tf=(Csensor + Av*Cf)/Av; % input-referred voltage then referred as charge

psdEstimate_chg = psdEstimate*chg_tf^2; 
psdEstimate_chg_itail_1nA = psdEstimate_chg; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg = sum(psdEstimate_chg(idxRange));

% Calculate the RMS voltage based on the power
rmsCharge = sqrt(powerInBand_chg);
%---
psdEstimate_chg_sim = psdEstimate_sim*chg_tf^2; 
psdEstimate_chg_sim_itail_1nA = psdEstimate_chg_sim; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg_sim = sum(psdEstimate_chg_sim(idxRange_sim));

% Calculate the RMS voltage based on the power
rmsCharge_sim = sqrt(powerInBand_chg_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge) ' Crms']);
disp(['(SIM) Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge_sim) ' Crms']);

figure;
loglog(freq, psdEstimate_chg); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),psdEstimate_chg_sim,'-')
%title(['Power Spectral Density (C)']);
xlabel('Frequency (Hz)');
ylabel('Charge PSD (Coulomb^2/Hz)');

legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = 100*min(psdEstimate_chg);
text(x_pos, y_pos, sprintf('Q_{noise RMS} (BW: %d Hz to %d Hz) = %.6f fC_{RMS}', flo, fhi, rmsCharge*1e15), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'-charge.fig'])
saveas(gcf,[csvFileName,'-charge.png'])
hold off;
%% ------------------------ ITAIL=10nA
% Save waveform to CSV file
csvFileName ='output\ID_sample_I2_covered_for_paper_itail_10nA_noisepsd__wav_vout_fin_1000000.0_vpp_0.1_vofs_-0.165-0.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform = csvread(csvFileName);

csvFileName_sim ='sim_csv\noisepsd_sim_itail_10nA.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform_sim = csvread(csvFileName_sim,1,0);

% Calculate and plot the power ((Vpk^2/2) -> if with input
%[psdEstimate, freq] = pwelch(waveform, windowSize, overlap, windowSize, samplingRate, 'power', 'onesided');
% Calculate and plot the power spectral density (PSD) ((V^2/Hz)
[psdEstimate, freq] = pwelch(waveform(:,2), windowSize, overlap, windowSize, samplingRate, 'psd', 'onesided'); % psd not power matches better with sim

% Find indices corresponding to the frequency range of interest
flo = 1; % Specify the lower frequency of the bandwidth (in Hz)
fhi = 10e3%10e3; % Specify the higher frequency of the bandwidth (in Hz)
idxRange = find(freq >= flo & freq <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand = sum(psdEstimate(idxRange));

% Calculate the RMS voltage based on the power
voltageScaling = 1; % Replace with the appropriate scaling factor for your waveform
rmsVoltage = sqrt(powerInBand) * voltageScaling;
%--
psdEstimate_sim = waveform_sim(:,2);
idxRange_sim = find(waveform_sim(:,1) >= flo & waveform_sim(:,1) <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand_sim = sum(waveform_sim(idxRange_sim,2));

% Calculate the RMS voltage based on the power
rmsVoltage_sim = sqrt(powerInBand_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage) ' Vrms']);
% Display the integrated noise in RMS voltage
disp(['(SIM) Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage_sim) ' Vrms']);

% Plot the power spectral density
figure;
loglog(freq, psdEstimate); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),waveform_sim(:,2),'-')
%title(['Power Spectral Density (V)']);
xlabel('Frequency (Hz)');
ylabel('PSD (V^2/Hz)');
ylim([1e-2*min(psdEstimate) 1e2*max(psdEstimate)])
legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = min(psdEstimate);
text(x_pos, y_pos, sprintf('v_{noise RMS} (BW: %d Hz to %d Hz) = %.6f V', flo, fhi, rmsVoltage), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
hold off;

% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'.fig'])
saveas(gcf,[csvFileName,'.png'])
%% Plot PSD as charge
Cf=33e-15;
Av=140;
Csensor=172e-15;
chg_tf=(Csensor + Av*Cf)/Av; % input-referred voltage then referred as charge

psdEstimate_chg = psdEstimate*chg_tf^2; 
psdEstimate_chg_itail_10nA = psdEstimate_chg; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg = sum(psdEstimate_chg(idxRange));

% Calculate the RMS voltage based on the power
rmsCharge = sqrt(powerInBand_chg);
%---
psdEstimate_chg_sim = psdEstimate_sim*chg_tf^2; 
psdEstimate_chg_sim_itail_10nA = psdEstimate_chg_sim; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg_sim = sum(psdEstimate_chg_sim(idxRange_sim));

% Calculate the RMS voltage based on the power
rmsCharge_sim = sqrt(powerInBand_chg_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge) ' Crms']);
disp(['(SIM) Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge_sim) ' Crms']);

figure;
loglog(freq, psdEstimate_chg); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),psdEstimate_chg_sim,'-')
%title(['Power Spectral Density (C)']);
xlabel('Frequency (Hz)');
ylabel('Charge PSD (Coulomb^2/Hz)');

legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = 100*min(psdEstimate_chg);
text(x_pos, y_pos, sprintf('Q_{noise RMS} (BW: %d Hz to %d Hz) = %.6f fC_{RMS}', flo, fhi, rmsCharge*1e15), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'-charge.fig'])
saveas(gcf,[csvFileName,'-charge.png'])
hold off;

%% ------------------------ ITAIL=100nA
% Save waveform to CSV file
csvFileName ='output\ID_sample_I2_covered_for_paper_itail_100nA_noisepsd__wav_vout_fin_1000000.0_vpp_0.1_vofs_-0.165-0.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform = csvread(csvFileName);

csvFileName_sim ='sim_csv\noisepsd_sim_itail_100nA.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform_sim = csvread(csvFileName_sim,1,0);

% Calculate and plot the power ((Vpk^2/2) -> if with input
%[psdEstimate, freq] = pwelch(waveform, windowSize, overlap, windowSize, samplingRate, 'power', 'onesided');
% Calculate and plot the power spectral density (PSD) ((V^2/Hz)
[psdEstimate, freq] = pwelch(waveform(:,2), windowSize, overlap, windowSize, samplingRate, 'psd', 'onesided'); % psd not power matches better with sim

% Find indices corresponding to the frequency range of interest
flo = 1; % Specify the lower frequency of the bandwidth (in Hz)
fhi = 10e3%10e3; % Specify the higher frequency of the bandwidth (in Hz)
idxRange = find(freq >= flo & freq <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand = sum(psdEstimate(idxRange));

% Calculate the RMS voltage based on the power
voltageScaling = 1; % Replace with the appropriate scaling factor for your waveform
rmsVoltage = sqrt(powerInBand) * voltageScaling;
%--
psdEstimate_sim = waveform_sim(:,2);
idxRange_sim = find(waveform_sim(:,1) >= flo & waveform_sim(:,1) <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand_sim = sum(waveform_sim(idxRange_sim,2));

% Calculate the RMS voltage based on the power
rmsVoltage_sim = sqrt(powerInBand_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage) ' Vrms']);
% Display the integrated noise in RMS voltage
disp(['(SIM) Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage_sim) ' Vrms']);

% Plot the power spectral density
figure;
loglog(freq, psdEstimate); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),waveform_sim(:,2),'-')
%title(['Power Spectral Density (V)']);
xlabel('Frequency (Hz)');
ylabel('PSD (V^2/Hz)');
ylim([1e-2*min(psdEstimate) 1e2*max(psdEstimate)])
legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = min(psdEstimate);
text(x_pos, y_pos, sprintf('v_{noise RMS} (BW: %d Hz to %d Hz) = %.6f V', flo, fhi, rmsVoltage), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
hold off;

% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'.fig'])
saveas(gcf,[csvFileName,'.png'])
%% Plot PSD as charge
Cf=33e-15;
Av=140;
Csensor=172e-15;
chg_tf=(Csensor + Av*Cf)/Av; % input-referred voltage then referred as charge

psdEstimate_chg = psdEstimate*chg_tf^2; 
psdEstimate_chg_itail_100nA = psdEstimate_chg; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg = sum(psdEstimate_chg(idxRange));

% Calculate the RMS voltage based on the power
rmsCharge = sqrt(powerInBand_chg);
%---
psdEstimate_chg_sim = psdEstimate_sim*chg_tf^2; 
psdEstimate_chg_sim_itail_100nA = psdEstimate_chg_sim; % store for later
% Integrate the PSD over the specified frequency range
powerInBand_chg_sim = sum(psdEstimate_chg_sim(idxRange_sim));

% Calculate the RMS voltage based on the power
rmsCharge_sim = sqrt(powerInBand_chg_sim);

% Display the integrated noise in RMS voltage
disp(['Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge) ' Crms']);
disp(['(SIM) Integrated Charge Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsCharge_sim) ' Crms']);

figure;
loglog(freq, psdEstimate_chg); xlim([1 30e3])
hold on;
loglog(waveform_sim(:,1),psdEstimate_chg_sim,'-')
%title(['Power Spectral Density (C)']);
xlabel('Frequency (Hz)');
ylabel('Charge PSD (Coulomb^2/Hz)');

legend('Measured','Simulated')

% Add text annotation for vofs_opt at the bottom center
x_pos = 0.001*freq(round(length(freq) / 2));
y_pos = 1000*min(psdEstimate_chg);
text(x_pos, y_pos, sprintf('Q_{noise RMS} (BW: %d Hz to %d Hz) = %.6f fC_{RMS}', flo, fhi, rmsCharge*1e15), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
grid on;
% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'-charge.fig'])
saveas(gcf,[csvFileName,'-charge.png'])
hold off;

%% COMBINED ACROSS ITAIL
figure;
loglog(freq, psdEstimate_chg_itail_1nA); xlim([1 30e3])
hold on;
loglog(freq, psdEstimate_chg_itail_10nA); 
loglog(freq, psdEstimate_chg_itail_100nA); 
%title(['Power Spectral Density (C)']);
xlabel('Frequency (Hz)');
ylabel('Charge PSD (Coulomb^2/Hz)');

% Add legend
legend('I_{TAIL}=1nA', 'I_{TAIL}=10nA', 'I_{TAIL}=100nA',  'location', 'southwest');

micasplot
grid on;
% Set the width and height of the figure (in pixels)
width = 800;    % Specify your desired width here
height = 600;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,[csvFileName,'-charge-combinedacrossitail.fig'])
saveas(gcf,[csvFileName,'-charge-combinedacrossitail.png'])
hold off;