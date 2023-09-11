%% READ output of keysight_rigol_gain_freqsweep.py over N iterations for averaging
run_iter = 3;
run_id = 'sample_I2_redo_Cf_330pF_itail_1nA'
baseName = ['output\ID_', run_id, '_bodeplot__gain_vs_fin_sweep-']

%used in TSENSE
fin_arr = logspace(0,5,26); % 5 points/dec over 5 decade
vamp=0.05;
vofs=0.08;

freq=[]; vout_pp=[]; vin_pp=[]; gain=[]; gain_db=[];
for i = 1:run_iter
    csvFileName = [baseName,num2str(i-1),'.csv' ];
    csv_val = csvread(csvFileName,1,0); % skip first line of names
    
    freq(i,:) = csv_val(:,1);
    vout_pp(i,:) = csv_val(:,2);
    vin_pp(i,:) = csv_val(:,3);
    gain(i,:) = csv_val(:,4);
    gain_db(i,:) = csv_val(:,5);
    
end    

freq=freq';
vout_pp=vout_pp';
vin_pp=vin_pp';
gain=gain';
gain_db=gain_db';

figure
loglog(freq,gain)
ylim([0.5*min(min(gain)),1.5*max(max(gain))])

% Set labels and title
xlabel('Frequency (Hz)');
ylabel('Gain (V/V)');
title(['Gain Across ',num2str(run_iter),' Iterations']);

% Add legend
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'location', 'southwest');
micasplot

saveas(gcf,[baseName,'multitrials','.fig'])

%-----
figure
mean_freq = mean(freq,2);  % get mean across dim=2 just to have it 1 column; 
mean_gain = mean(gain,2); % get average across iterations 2nd dim
std_gain = std(gain,0,2); % get sigma

% get an estimate of the passband gain
gain_max = max(mean_gain);

% Plot the means as a solid line
loglog(mean_freq, mean_gain, 'b', 'LineWidth', 2);
ylim([0.5*min(mean_gain),1.5*max(mean_gain)])

hold on;

% Plot the sigmas as error bars (standard deviation)
errorbar(mean_freq, mean_gain, std_gain, 'r', 'LineStyle', 'none', 'LineWidth', 1.5);

% Set labels and title
xlabel('Frequency (Hz)');
ylabel('Gain (V/V)');
title(['Mean and Standard Deviation Across ',num2str(run_iter),' Iterations']);

% Add legend
legend('Mean', 'Standard Deviation','location','southwest');

% Add text annotation for vofs_opt at the bottom center
x_pos = mean_freq(round(length(mean_freq) / 2));
y_pos = 1.25*max(mean_gain);
text(x_pos, y_pos, sprintf('Passband Gain = %.2f V/V', gain_max), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

micasplot
hold off;
saveas(gcf,[baseName,'multitrials-boxplot','.fig'])
%------ plot without error bars (for paper)
figure
loglog(mean_freq, mean_gain, 'b', 'LineWidth', 2);
hold on;
% Add square data points using the scatter function
scatter(mean_freq, mean_gain, 100, 's', 'filled', 'MarkerFaceColor', 'b'); % 's' specifies square markers, 'filled' fills the squares, 'r' is the marker face color (red)

ylim([0.5*min(mean_gain),1.5*max(mean_gain)])


% Set labels and title
xlabel('Frequency (Hz)');
ylabel('Gain (V/V)');
title(['Gain Plot']);


% Add text annotation for vofs_opt at the bottom center
x_pos = mean_freq(round(length(mean_freq) / 2));
y_pos = 1.25*max(mean_gain);
text(x_pos, y_pos, sprintf('Passband Gain = %.2f V/V', gain_max), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
hold off;
micasplot
%% plot vout and vin -> try and see if vin is bandlimited by eval-ADA4098
figure
loglog(freq,vout_pp)
hold on;
loglog(freq,vin_pp)
ylim([0.5*min(min(vin_pp)),1.5*max(max(vout_pp))])

% Set labels and title
xlabel('Frequency (Hz)');
ylabel('Vpp (V)');
title(['Output p-p Across ',num2str(run_iter),' Iterations']);

% Add legend
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'location', 'southwest');
micasplot

saveas(gcf,[baseName,'multitrials-vout-vin','.fig'])
hold off;
%-----
figure
mean_freq = mean(freq,2);  % get mean across dim=2 just to have it 1 column; 
mean_vout_pp = mean(vout_pp,2); % get average across iterations 2nd dim
std_vout_pp = std(vout_pp,0,2); % get sigma
mean_vin_pp = mean(vin_pp,2); % get average across iterations 2nd dim
std_vin_pp = std(vin_pp,0,2); % get sigma

% Plot the means as a solid line
loglog(mean_freq, mean_vout_pp, 'b', 'LineWidth', 2);
hold on;
loglog(mean_freq, mean_vin_pp, 'b', 'LineWidth', 2);
ylim([0.5*min(mean_vin_pp),1.5*max(mean_vout_pp)])



% Plot the sigmas as error bars (standard deviation)
errorbar(mean_freq, mean_vout_pp, std_vout_pp, 'r', 'LineStyle', 'none', 'LineWidth', 1.5);
errorbar(mean_freq, mean_vin_pp, std_vin_pp, 'r', 'LineStyle', 'none', 'LineWidth', 1.5);

% Set labels and title
xlabel('Frequency (Hz)');
ylabel('Vpp (V)');
title(['Mean and Standard Deviation Across ',num2str(run_iter),' Iterations']);

% Add legend
legend('Mean (Vout,pp)','Mean (Vin,pp)', 'Standard Deviation (Vout,pp)', 'Standard Deviation (Vin,pp)','location','southwest');

micasplot
hold off;
saveas(gcf,[baseName,'multitrials-vout-vin-boxplot','.fig'])

%% Plot temperature over iterations and sweep values
baseName_1 = ['output\ID_', run_id, '_bodeplot__tsense_ave_fin_']
baseName_2 = ['_vpp_',num2str(vamp),'_vofs_', num2str(vofs)]


tsense_arr=[]; tsense_std_arr=[];
for i = 1:run_iter
    for j=1:numel(fin_arr)
        if (mod(fin_arr(j),1) == 0) % integer
            csvFileName = [baseName_1,num2str(fin_arr(j),'%.1f'),baseName_2,'-',num2str(i-1),'.csv'] % that pesky case of num2str conversion in python
        else
            csvFileName = [baseName_1,num2str(fin_arr(j),'%.6f'),baseName_2,'-',num2str(i-1),'.csv']            
        end
        csv_val = csvread(csvFileName); % skip first line of names

        tsense_arr(i,j) = csv_val(1); % get mean
        tsense_std_arr(i,j) = csv_val(2); % get std

    end
end    

tsense_arr=tsense_arr';
tsense_std_arr=tsense_std_arr';
fin_arr=fin_arr'; 
figure
hold on;
plot(fin_arr,tsense_arr)
set(gca,'Xscale','log') % yeah, that is indeed easy!
% Plot the sigmas as error bars (standard deviation)
%errorbar([vofs_arr vofs_arr vofs_arr vofs_arr vofs_arr], tsense_arr, tsense_std_arr, 'r', 'LineStyle', 'none', 'LineWidth', 1.5);

% Set labels and title
xlabel('Frequency (Hz)');
ylabel('TSENSE output (V)');
title(['TSENSE across ',num2str(run_iter),' Iterations']);

% Add legend
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5');

hold off;
micasplot
saveas(gcf,[baseName,'multitrials-tsense','.fig'])
%% See general trend of TSENSE

% Calculate the mean and standard deviation along dimension 2 (columns) of tsense_arr
means = mean(tsense_arr, 1);
sigmas = std(tsense_arr, 0, 1);

% Create the figure
figure;

% Plot the means as a solid line against dimension 2
plot(1:size(tsense_arr, 2), means, 'b', 'LineWidth', 2);
hold on;

% Plot the sigmas as error bars (standard deviation) against dimension 2
errorbar(1:size(tsense_arr, 2), means, sigmas, 'r', 'LineStyle', 'none', 'LineWidth', 1.5);

% Set labels and title
xlabel('Iterations');
ylabel('TSENSE (V)');
title('Mean and Standard Deviation of TSENSE across run iterations');

% Add legend
legend('Mean', 'Standard Deviation');

% Limit the X-axis ticks to show only the values of dimension 2
xticks(1:size(tsense_arr, 2));

micasplot
hold off;
saveas(gcf,[baseName,'multitrials-tsense-trend','.fig'])