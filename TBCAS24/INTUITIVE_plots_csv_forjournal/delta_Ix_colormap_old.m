close all
% tb_dpi_filt
%% PLOT COLORMAP OF delta_Ix vs I_spk and I_slew
baseName = 'delta_Ix_slow_islew_ispk'
delta_Ix_slow = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)
ispk_arr =  1e6*delta_Ix_slow(:,1) %normalize to uA
delta_Ix_slow_new(:,1:size(delta_Ix_slow,2)-1) = delta_Ix_slow(:,2:size(delta_Ix_slow,2)) 
delta_Ix_slow_new = 1e9*delta_Ix_slow_new; %normalize to nA

islew_arr = 1e6*[50e-9 150e-9 250e-9 350e-9 450e-9]; 

baseName = 'delta_Ix_fast_islew_ispk'
delta_Ix_fast = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)
delta_Ix_fast_new(:,1:size(delta_Ix_fast,2)-1) = delta_Ix_fast(:,2:size(delta_Ix_fast,2)) 
delta_Ix_fast_new = 1e9*delta_Ix_fast_new;

% Create a plot
figure;
% heatmap(delta_Ix_slow)
% colormap(jet(512))
ax1=subplot(2,1,1)
imagesc(islew_arr,ispk_arr, delta_Ix_slow_new);
colormap(parula); % Change to any preferred colormap
x1=xlabel('I_{SLEW} (\muA)')
y1=ylabel('I_{SPIKE} (\muA)')
% Set original x and y-axis tick values
set(ax1, 'XTick', islew_arr, 'YTick', ispk_arr);

% Position of the colorbars
cb_position = [0.92, 0.6, 0.02, 0.25];
h_cb1=colorbar('Location','eastoutside')
ylabel(h_cb1, ['\Delta I_{X,slow}(nA)'],'FontWeight','bold','FontSize',12); % Set the label for the colorbar


% Create a plot
ax2=subplot(2,1,2)
% heatmap(delta_Ix_slow)
% colormap(jet(512))
imagesc(islew_arr,ispk_arr, delta_Ix_fast_new);
colormap(parula); % Change to any preferred colormap
x2=xlabel('I_{SLEW} (\muA)')
y2=ylabel('I_{SPIKE} (\muA)')
% Set original x and y-axis tick values
set(ax2, 'XTick', islew_arr, 'YTick', ispk_arr);

h_cb2=colorbar('Location','eastoutside')
ylabel(h_cb2, ['\Delta I_{X,fast}(nA)'],'FontWeight','bold','FontSize',12); % Set the label for the colorbar

micasplot

grid off

set(y1, 'FontSize', 14)
set(y2, 'FontSize', 14)

set(x1, 'FontSize', 14)
set(x2, 'FontSize', 14)
set(gcf, 'Position', [100, 100, 300, 500]); saveas(gcf,[baseName,'.fig']); saveas(gcf,[baseName,'.png']);
