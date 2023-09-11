fileloc = pwd

% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_1nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_1nA.csv'], opts);

%bodeplot_afe_itail_100nA = csvread([fileloc,'bodeplot_afe_itail_100nA.csv'])
figure
plot(data.x_vpos_gain_ninvX,  abs(data.x_vpos_gain_ninvYRe))

ax = gca;
ax.YScale = 'log';
ax.XScale = 'log';

hold on;


% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_10nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_10nA.csv'], opts);

plot(data.x_vpos_gain_ninvX,  abs(data.x_vpos_gain_ninvYRe))


% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_100nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_100nA.csv'], opts);

plot(data.x_vpos_gain_ninvX,  abs(data.x_vpos_gain_ninvYRe))


freqs_of_interest=logspace(-4,4,40) % 10^-4 to 10^4 Hz (5 samples per decade)

micasplot
%%

% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_1nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_1nA.csv'], opts);

%bodeplot_afe_itail_100nA = csvread([fileloc,'bodeplot_afe_itail_100nA.csv'])
figure
plot(data.x_vpos_gain_ninv_cmX,  abs(data.x_vpos_gain_ninv_cmYRe))

ax = gca;
ax.YScale = 'log';
ax.XScale = 'log';

hold on;


% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_10nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_10nA.csv'], opts);

plot(data.x_vpos_gain_ninv_cmX,  abs(data.x_vpos_gain_ninv_cmYRe))


% Read the CSV file
opts = detectImportOptions([fileloc,'/bodeplot_afe_itail_100nA.csv']);
opts.VariableNamesLine = 1; % Specify the line number where variable names are located
data = readtable([fileloc,'/bodeplot_afe_itail_100nA.csv'], opts);

plot(data.x_vpos_gain_ninv_cmX,  abs(data.x_vpos_gain_ninv_cmYRe))


freqs_of_interest=logspace(-4,4,40) % 10^-4 to 10^4 Hz (5 samples per decade)

micasplot
