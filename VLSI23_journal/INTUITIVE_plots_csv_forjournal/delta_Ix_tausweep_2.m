close all

% Load CSV file
baseName = 'tt'
data = readmatrix(['../PYVISA_measurements/sim_csv/',baseName,'.csv']);

% The provided string
%dataString = 'time (s),Idpi.M7:3 vgsp_il 0  (A),time (s),Idpi.M7:3 vgsp_il 0.06315789  (A),time (s),Idpi.M7:3 vgsp_il 0.1263158  (A),time (s),Idpi.M7:3 vgsp_il 0.1894737  (A),time (s),Idpi.M7:3 vgsp_il 0.2526316  (A),time (s),Idpi.M7:3 vgsp_il 0.3157895  (A),time (s),Idpi.M7:3 vgsp_il 0.3789474  (A),time (s),Idpi.M7:3 vgsp_il 0.4421053  (A),time (s),Idpi.M7:3 vgsp_il 0.5052632  (A),time (s),Idpi.M7:3 vgsp_il 0.5684211  (A),time (s),Idpi.M7:3 vgsp_il 0.6315789  (A),time (s),Idpi.M7:3 vgsp_il 0.6947368  (A),time (s),Idpi.M7:3 vgsp_il 0.7578947  (A),time (s),Idpi.M7:3 vgsp_il 0.8210526  (A),time (s),Idpi.M7:3 vgsp_il 0.8842105  (A),time (s),Idpi.M7:3 vgsp_il 0.9473684  (A),time (s),Idpi.M7:3 vgsp_il 1.010526  (A),time (s),Idpi.M7:3 vgsp_il 1.073684  (A),time (s),Idpi.M7:3 vgsp_il 1.136842  (A),time (s),Idpi.M7:3 vgsp_il 1.2  (A)';
% Open the CSV file for reading
fileID = fopen(['../PYVISA_measurements/sim_csv/',baseName,'.csv'], 'r');

% Read the first line of the file
firstLine = fgetl(fileID);

% Close the file
fclose(fileID);

% Display or use the first line
disp(firstLine);

% Regular expression pattern to match vgsp_il values
pattern = 'vgsp_il (\d+\.\d+|\d+)';

% Use regular expression to extract vgsp_il values
matches = regexp(firstLine, pattern, 'tokens');

% Extracted vgsp_il values
vgsp_il_values = cellfun(@(x) str2double(x{1}), matches);

% Load the CSV file (skip the first line)
data = readmatrix(['../PYVISA_measurements/sim_csv/',baseName,'.csv'], 'NumHeaderLines', 1);

% Extract the time and delta_ix columns
time_columns = 1:2:size(data, 2);
delta_ix_columns = 2:2:size(data, 2);

time_values = data(:, time_columns);
delta_ix_values = data(:, delta_ix_columns);

% Plot delta_ix over time
figure;
plot(time_values, delta_ix_values);
xlabel('Time');
ylabel('\Delta i_x');
title('Plot of \Delta i_x over Time');
%legend('Column 1', 'Column 2', 'Column 3', ...); % Add appropriate legends

tau = []; init_value = []; threshold = [];
%target_time = 0.01;
% Define the time range
start_time = 0.01;
end_time = 0.15;

for j=1:size(delta_ix_values,2)
    %[~, index] = min(abs(time_values(:,j) - target_time))
    % Find indices within the specified time range
    indices_in_range = find(time_values(:,j) >= start_time & time_values(:,j) <= end_time);
    
    % Find the indices of peaks within the specified range
    peaks_indices_in_range = findpeaks(delta_ix_values(indices_in_range,j));
    
    % Sort the peak values in descending order to get the second highest peak
    sorted_peaks = sort(peaks_indices_in_range, 'descend');
    
    % Find the index of the second peak value within the subset
    second_peak_index_local = sorted_peaks(8);
    
    % Adjust the index to the index within the full time_values array
    %second_peak_index_global = indices_in_range(second_peak_index_local);
    second_peak_index_global = find(delta_ix_values(:,j)==second_peak_index_local)
    if numel(second_peak_index_global) > 1
        second_peak_index_global_ = second_peak_index_global(1);
    else
        second_peak_index_global_ = second_peak_index_global;
    end    

    init_value(j) = delta_ix_values(second_peak_index_global_,j)
    
    threshold(j) = (1 - exp(-1)) * init_value(j);
    
%     for i = 1:size(delta_ix_values,1)
%         if delta_ix_values(i,j) <= threshold(j)
%             tau(j) = time_values(i,j);
%             break;
%         end
%     end
    
    [~,index] = min(abs(delta_ix_values(:,j)-threshold(j)))
    tau(j) = time_values(index,j)
end

figure;
plot(vgsp_il_values, tau, '-o');  % '-o' adds markers at data points
xlabel('vgsp_{il}');
ylabel('Time (\tau)');
title('Time (\tau) vs. vgsp_{il}');


