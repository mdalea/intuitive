%% PLOT LCS COMPARATOR THRESHOLD MISMATCH
% load MC data from simulation
baseName = 'lc_spkon_mismatch_4b_itail_1nA'
hist_ON = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

baseName = 'lc_spkoff_mismatch_4b_itail_1nA'
hist_OFF = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0)

% Preprocess the data to create vectors of individual data points.
expanded_data1 = repelem(hist_ON(:, 1), hist_ON(:, 2));
expanded_data2 = repelem(hist_OFF(:, 1), hist_OFF(:, 2));

% Calculate mean and standard deviation of the expanded data.
mean_expanded1 = mean(expanded_data1);
std_expanded1 = std(expanded_data1);
mean_expanded2 = mean(expanded_data2);
std_expanded2 = std(expanded_data2);

figure;
% Create histograms using the expanded data.
edges = linspace(min([expanded_data1; expanded_data2]), max([expanded_data1; expanded_data2]), num_bins); % Define your own number of bins.
h1 = histogram(expanded_data1, edges, 'FaceAlpha', 0.5);
hold on;
h2 = histogram(expanded_data2, edges, 'FaceAlpha', 0.5);

% Estimate the kernel density using ksdensity with a smaller bandwidth.
bandwidth = 0.002; % Adjust this parameter for smoother or sharper curve.
density1 = ksdensity(expanded_data1, edges, 'Bandwidth', bandwidth);
density2 = ksdensity(expanded_data2, edges, 'Bandwidth', bandwidth);

% Create envelope curves using the density estimates.
plot(edges, density1, 'b', 'LineWidth', 2); % You can choose your own color and line style.
plot(edges, density2, 'r', 'LineWidth', 2); % You can choose your own color and line style.

hold off;

% Customize the plot as needed.
xlabel('Offset (V)');
%ylabel('Number of Occurrences');
%title('Histograms with Envelope Curves');
grid on;

% Add a legend to distinguish between histogram and envelope curves.
lgd=legend([h1, h2], {['ON threshold - ',newline,'Mean:',num2str(round(1e3*mean_expanded1, 2)),'mV SD:',num2str(round(1e3*std_expanded1,2)),'mV'], ['OFF threshold -',newline, 'Mean:',num2str(round(1e3*mean_expanded2,2)),'mV SD:',num2str(round(1e3*std_expanded2,2)),'mV']},'Location','northwest','Interpreter','tex');

% Display mean and standard deviation as text annotations.
%annotation('textbox', [0.15, 0.8, 0.2, 0.1], 'String', ['Mean 1: ', num2str(mean_expanded1), 'Std Dev 1: ', num2str(std_expanded1)], 'BackgroundColor', 'white');
%annotation('textbox', [0.15, 0.6, 0.2, 0.1], 'String', ['Mean 2: ', num2str(mean_expanded2),'Std Dev 2: ', num2str(std_expanded2)], 'BackgroundColor', 'white');

micasplot
% set(findall(gcf,'-property','FontSize'),'FontSize',12)
% h(1).MarkerSize = 12;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

set(gcf, 'Position', [100, 100, 400, 400]); saveas(gcf,[baseName,'.fig']); saveas(gcf,[baseName,'.png']);
