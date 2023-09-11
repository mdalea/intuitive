% dataset recording workflow

%% IMPORTANT:  make sure to delete ino_files/',vdac_cfg,' or csv contents before running
clearvars

vdac_cfg = '12x16_180mvpp_250mvofs_onedac';  % set VDAC input pk2pk and offset; use just one DAC (8 channels)
Nres=4; % specify resolution of LCS channels

load_dataset_arduino_12x16_onedac

read_serial_spikes_dataset_12x16_onedac
check_missing_recordings_onedac
read_serial_spikes_dataset_12x16_missing_onedac
check_missing_recordings_onedac % do it twice to make sure 
read_serial_spikes_dataset_12x16_missing_onedac
check_missing_recordings_onedac  % do it thrice to make sure
read_serial_spikes_dataset_12x16_missing_onedac
check_missing_recordings_onedac  % one more, I promise...
read_serial_spikes_dataset_12x16_missing_onedac
 
auto_spikepreprocess_onedac  