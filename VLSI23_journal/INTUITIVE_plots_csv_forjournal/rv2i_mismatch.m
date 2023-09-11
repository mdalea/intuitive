%% PLOT R_V2I mismatch and linearity
% load MC data from simulation
baseName = 'rv2i_250mV_vresgate_avdd_0'
hist_avdd = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

baseName = 'rv2i_250mV_vresgate_avdd_1_vrefl_250mV'
hist_vrefl_250m = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

baseName = 'rv2i_250mV_vresgate_avdd_1_vrefl_1000mV'
hist_vrefl_500m = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

% Preprocess the data to create vectors of individual data points.
expanded_data1 = repelem(hist_avdd(:, 1), hist_avdd(:, 2));
expanded_data2 = repelem(hist_vrefl_250m(:, 1), hist_vrefl_250m(:, 2));
expanded_data3 = repelem(hist_vrefl_500m(:, 1), hist_vrefl_500m(:, 2));

% Calculate mean and standard deviation of the expanded data.
mean_expanded1 = mean(expanded_data1);
std_expanded1 = std(expanded_data1);
mean_expanded2 = mean(expanded_data2);
std_expanded2 = std(expanded_data2);
mean_expanded3 = mean(expanded_data3);
std_expanded3 = std(expanded_data3);

num_bins=20;

figure;
subplot(1,3,1)
hold on;
% Create histograms using the expanded data.
edges1 = linspace(min(expanded_data1), max(expanded_data1), num_bins); % Define your own number of bins.
h1 = histogram(expanded_data1, edges1, 'FaceAlpha', 0.5);
% Estimate the kernel density using ksdensity with a smaller bandwidth.
bandwidth =1e-5; % Adjust this parameter for smoother or sharper curve.
density1 = ksdensity(expanded_data1, edges1, 'Bandwidth', bandwidth);
% Create envelope curves using the density estimates.
%plot(edges1, density1, 'b', 'LineWidth', 2); % You can choose your own color and line style.
xlabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=1.8V']);
%lgd1=legend(['Mean:',newline,num2str(round(mean_expanded1/1e6,2)),'M\Omega',newline,'SD:',newline,num2str(round(std_expanded1/1e6,2)),'M\Omega'],'Location','south','Interpreter','tex');
text(9.85e5,1000,['Mean:',newline,num2str(round(mean_expanded1/1e6,2)),'M\Omega',newline,'SD:',newline,num2str(round(std_expanded1/1e6,2)),'M\Omega'], 'Color', [0.6350 0.0780 0.1840]);
grid on;

subplot(1,3,2)
% Create histograms using the expanded data.
edges3 = linspace(min(expanded_data3), max(expanded_data3)*1.02, num_bins); % Define your own number of bins.
h3 = histogram(expanded_data3, edges3, 'FaceAlpha', 0.5);
bandwidth = 1e-6; % Adjust this parameter for smoother or sharper curve.
density3 = ksdensity(expanded_data3, edges3, 'Bandwidth', bandwidth);
% Create envelope curves using the density estimates.
%plot(edges3, density3, 'b', 'LineWidth', 2); % You can choose your own color and line style.
xlabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=1V']);
%lgd3=legend(['Mean:',newline,num2str(round(mean_expanded3/1e6,2)),'M\Omega',newline,'SD:',newline,num2str(round(std_expanded3/1e6,2)),'M\Omega'],'Location','south','Interpreter','tex');
text(2.135e6,600,['Mean:',newline,num2str(round(mean_expanded3/1e6,2)),'M\Omega',newline,'SD:',newline,num2str(round(std_expanded3/1e6,2)),'M\Omega'], 'Color', [0.6350 0.0780 0.1840]);
grid on;

subplot(1,3,3)
% Create histograms using the expanded data.
edges2= linspace(min(expanded_data2), max(expanded_data2)*1.025, num_bins); % Define your own number of bins.
h2 = histogram(expanded_data2, edges2, 'FaceAlpha', 0.5);
bandwidth = 1e5; % Adjust this parameter for smoother or sharper curve.
density2 = ksdensity(expanded_data2, edges2, 'Bandwidth', bandwidth);
% Create envelope curves using the density estimates.
%plot(edges2, density2, 'b', 'LineWidth', 2); % You can choose your own color and line style.
xlabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=0.25V']);
%lgd2=legend(['Mean:',newline,num2str(round(mean_expanded2/1e9,2)),'G\Omega',newline,'SD:',newline,num2str(round(std_expanded2/1e9,2)),'G\Omega'],'Location','south','Interpreter','tex');
text(1.65e9,400,['Mean:',newline,num2str(round(mean_expanded2/1e9,2)),'G\Omega',newline,'SD:',newline,num2str(round(std_expanded2/1e9,2)),'G\Omega'], 'Color', [0.6350 0.0780 0.1840]);

grid on;

hold off;

micasplot
% set(findall(gcf,'-property','FontSize'),'FontSize',12)
% h(1).MarkerSize = 12;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd1.FontSize = 10; 
lgd2.FontSize = 10; 
lgd3.FontSize = 10; 

set(gcf, 'Position', [100, 100, 800, 300]); saveas(gcf,[baseName,'.fig']); saveas(gcf,[baseName,'.png']);

%%
%Plot linearity and THD
baseName = 'rv2i_linearity_vresgate_avdd_0'
rv2i_avdd = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

baseName = 'rv2i_linearity_vresgate_avdd_1_vrefl_250mV'
rv2i_vrefl_250m = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

baseName = 'rv2i_linearity_vresgate_avdd_1_vrefl_1000mV'
rv2i_vrefl_500m = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

figure
subplot(1,3,1)
plot(rv2i_avdd(:,1),rv2i_avdd(:,2))
xlim([0.1 0.5])
x1=xlabel('V_{OUT2} (V)')
y1=ylabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=1.8V']);
label_str = ['THD=',newline,'1.625%']; % from cadence sim (10Hz, 140mVpp, 1 second)
%text(0.32, 0.9e6, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 6); % Adjust font size if needed
text(0.25, 1e6, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', [0.6350 0.0780 0.1840], 'FontSize', 6); % Adjust font size if needed

grid on;

subplot(1,3,2)
plot(rv2i_vrefl_500m(:,1),rv2i_vrefl_500m(:,2))
xlim([0.1 0.5])
x2=xlabel('V_{OUT2} (V)')
y2=ylabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=1V']);
grid on;
label_str = ['THD=',newline,'6.516%'];
%text(0.32, 1.75e6, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 6); % Adjust font size if needed
text(0.25, 2.4e6, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', [0.6350 0.0780 0.1840], 'FontSize', 6); % Adjust font size if needed

subplot(1,3,3)
plot(rv2i_vrefl_250m(:,1),rv2i_vrefl_250m(:,2))
xlim([0.1 0.5])
x3=xlabel('V_{OUT2} (V)')
y3=ylabel(['R_{V2I} (\Omega)',newline,'V_{GATE}=0.25V']);
label_str = ['THD=',newline,'3.8%'];
%text(0.3, 0.1*max(rv2i_vrefl_250m(:,2)), label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 6); % Adjust font size if needed
text(0.25, 2e9, label_str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', [0.6350 0.0780 0.1840], 'FontSize', 6); % Adjust font size if needed

grid on;

micasplot

% Change the font size of the added text
text_handle = findobj(gcf, 'Type', 'Text');   % Find the text object
set(text_handle, 'FontSize', 12);             % Change font size to 10
set(y1, 'FontSize', 12)
set(y2, 'FontSize', 12)
set(y3, 'FontSize', 12)

set(x1, 'FontSize', 12)
set(x2, 'FontSize', 12)
set(x3, 'FontSize', 12)
set(gcf, 'Position', [100, 100, 800, 200]); saveas(gcf,[baseName,'.fig']); saveas(gcf,[baseName,'.png']);