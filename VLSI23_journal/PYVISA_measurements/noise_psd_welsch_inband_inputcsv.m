%% READS CSV FILE (PSD) FROM PYVISA-BASED MEASUREMENTS (PYTHON SCIPY.SIGNAL.WELCH) AND SHOWS IN-BAND NOISE


% Save waveform to CSV file
csvFileName ='output\ID_sample_I2_itail_1nA_covered_noisepsd__psd_vout_fin_1_vpp_0.1_vofs_-0.06-0.csv' %'10hz-2mvppin-amp.csv'; %'noisepsd.csv';'10hz-2mvppin-amp-2.csv'; 
waveform = csvread(csvFileName);

psdEstimate = waveform(:,2)';
freq = waveform(:,1)';

%% Find indices corresponding to the frequency range of interest
flo = 1; % Specify the lower frequency of the bandwidth (in Hz)
fhi = 10e3; % Specify the higher frequency of the bandwidth (in Hz)
idxRange = find(freq >= flo & freq <= fhi);

% Integrate the PSD over the specified frequency range
powerInBand = sum(psdEstimate(idxRange));

% Calculate the RMS voltage based on the power
voltageScaling = 1; % Replace with the appropriate scaling factor for your waveform
rmsVoltage = sqrt(powerInBand) * voltageScaling;

%% Plot the power spectral density
figure;
loglog(freq, psdEstimate);
title('Power Spectral Density (Single-Sided, Logarithmic Scale)');
xlabel('Frequency (Hz)');
ylabel('PSD (V^2/Hz)');
grid on;

% Display the integrated noise in RMS voltage
disp(['Integrated Noise in the frequency range ' num2str(flo) ' Hz to ' num2str(fhi) ' Hz: ' num2str(rmsVoltage) ' Vrms']);
