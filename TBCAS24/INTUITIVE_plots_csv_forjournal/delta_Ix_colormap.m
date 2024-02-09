close all
clear all
% tb_dpi_filt_mult (10s sim)
% VL=1.2V
%% PLOT COLORMAP OF delta_Ix vs I_spk and I_slew
islew_arr= 1e9*[100e-12 1e-9 10e-9 100e-9 500e-9]; %normalized to 1nA
ispk_arr=1e6*[1e-6 3.25e-6 5.5e-6 7.75e-6 10e-6]; %normalized to 1uA

baseName = 'Ix'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data); % preserve precision

% Extract the time and ix columns
time_columns = 1:2:size(data, 2);
ix_columns = 2:2:size(data, 2);

time_values = data(:, time_columns);
ix_values = data(:, ix_columns);

baseName = 'cix_pulse'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data);

% Extract the time and ix columns
cix_pulse_columns = 2:2:size(data, 2);
cix_pulse_values = data(:, cix_pulse_columns);

%-----
target_time = 9.9999e-3;
target_cix_pulse = 0.1%0.1;

for j=1:size(time_values,2)
    % Find the index where time_values is closest to the target time
    [~, init_time_index(j)] = min(abs(time_values(:,j) - target_time));
    
    % Get initial ix value
    ix_init(j) = ix_values(init_time_index(j), j);

    decreasing_indices = find(diff(cix_pulse_values(:,j)) < 0);
    
    % Initialize variables to store the minimum difference and index
    min_difference = inf;
    closest_index(j) = 0;
    
    % Iterate through decreasing indices and find the closest index
    for ii = 1:length(decreasing_indices)
        index = decreasing_indices(ii);
        difference = abs(cix_pulse_values(index,j) - target_cix_pulse);
        
        % Update minimum difference and closest index if needed
        if difference < min_difference
            min_difference = difference;
            closest_index(j) = index;
        end
    end
    ix_step(j) = ix_values(closest_index(j),j)
    delta_ix(j) = ix_step(j)-ix_init(j)
    final_time(j) = time_values(closest_index(j),j)

    tpw(j) = final_time(j)-target_time

end
%%
baseName = 'Ix_fast'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data); % preserve precision

% Extract the time and ix columns
ix_fast_columns = 2:2:size(data, 2);
ix_fast_values = data(:, ix_fast_columns);


for j=1:size(time_values,2)
    % Find the index where time_values is closest to the target time
    [~, init_time_index(j)] = min(abs(time_values(:,j) - target_time));
    
    % Get initial ix value
    ix_fast_init(j) = ix_fast_values(init_time_index(j), j);

    decreasing_indices = find(diff(cix_pulse_values(:,j)) < 0);
    
    % Initialize variables to store the minimum difference and index
    min_difference = inf;
    closest_index(j) = 0;
    
    % Iterate through decreasing indices and find the closest index
    for ii = 1:length(decreasing_indices)
        index = decreasing_indices(ii);
        difference = abs(cix_pulse_values(index,j) - target_cix_pulse);
        
        % Update minimum difference and closest index if needed
        if difference < min_difference
            min_difference = difference;
            closest_index(j) = index;
        end
    end
    ix_fast_step(j) = ix_fast_values(round(closest_index(j)),j)
    delta_ix_fast(j) = ix_fast_step(j)-ix_fast_init(j)


end
%%
delta_ix_rs = 1e9*reshape(delta_ix,5,5); %normalize and reshape
delta_ix_fast_rs = 1e9*reshape(delta_ix_fast,5,5);


% Create a plot
figure;
% heatmap(delta_Ix_slow)
% colormap(jet(512))
ax1=subplot(2,1,1)
imagesc(islew_arr,ispk_arr,delta_ix_rs);
colormap(parula); % Change to any preferred colormap
x1=xlabel('I_{SLEW} (nA)')
y1=ylabel('I_{SPIKE} (\muA)')
% Set original x and y-axis tick values
set(ax1, 'XTick', islew_arr, 'YTick', ispk_arr);
set(gca,'XScale','log');
set(gca, 'FontSize', 10); % Adjust the font size as needed

% Position of the colorbars
cb_position = [0.92, 0.6, 0.02, 0.25];
h_cb1=colorbar('Location','eastoutside')
ylabel(h_cb1, ['\Delta I_{X,slow}(nA)'],'FontWeight','bold','FontSize',12); % Set the label for the colorbar

% Create a plot
ax2=subplot(2,1,2)
% heatmap(delta_Ix_slow)
% colormap(jet(512))
i1=imagesc(islew_arr,ispk_arr, delta_ix_fast_rs);
colormap(parula); % Change to any preferred colormap
x2=xlabel('I_{SLEW} (nA)')
y2=ylabel('I_{SPIKE} (\muA)')
% Set original x and y-axis tick values
set(ax2, 'XTick', islew_arr, 'YTick', ispk_arr);
set(gca,'XScale','log');


h_cb2=colorbar('Location','eastoutside')
ylabel(h_cb2, ['\Delta I_{X,fast}(nA)'],'FontWeight','bold','FontSize',12); % Set the label for the colorbar

micasplot

grid off
% Set font size of the colorbar
set(h_cb1, 'FontSize', 10); % Adjust the font size as needed
set(h_cb2, 'FontSize', 10); % Adjust the font size as needed
set(y1, 'FontSize', 14)
set(y2, 'FontSize', 14)

set(x1, 'FontSize', 14)
set(x2, 'FontSize', 14)

set(gcf, 'Position', [100, 100, 300, 500]); saveas(gcf,[baseName,'.fig']); saveas(gcf,[baseName,'.png']);

%% PLOT tpw vs ISLEW
figure
islew_arr = islew_arr; 
tpw_sameislew = [tpw(1) tpw(6) tpw(11) tpw(16) tpw(21)]
ax3=plot(islew_arr,tpw_sameislew,'-s')
set(gca,'XScale','log');
set(gca,'YScale','log');
x1=xlabel('I_{SLEW} (nA)')
y1=ylabel(['t_{pw} (s)'])
xlim([islew_arr(1) islew_arr(5)])
% Set xtick values and labels
set(gca, 'XTick', islew_arr);

micasplot
grid off
set(y1, 'FontSize', 12)
set(x1, 'FontSize', 12)
% Set font size of x-axis tick labels
set(gca, 'FontSize', 10); % Adjust the font size as needed
set(gcf, 'Position', [100, 100, 200, 250]); saveas(gcf,[baseName,'-tpw','.fig']); saveas(gcf,[baseName,'-tpw','.png']);