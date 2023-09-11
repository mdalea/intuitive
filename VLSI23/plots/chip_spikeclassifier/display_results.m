%hidden_size_arr = [256, 512, 1024];
%Ts_arr = [1, 5, 10, 100, 400];


%% Effect of Ts
resultsPath = '/users/micas/malea/Documents/chip_spikeclassifier/TrainedALL_epochs-50-input_size-2-16-12-hidden_size-512-batch_size-32-lr-0.001-tmax_ms-400.0-Ts-1.0-kfolds-6/results_max.txt'

results_max = [];
fid = fopen(resultsPath);
tline = fgets(fid);
tline_tokens = split(tline,':')
results_max = [results_max; str2num(tline_tokens{2})];
%while ischar(tline)
for i=1:4
    disp(tline)
    tline = fgets(fid);
    tline_tokens = split(tline,':')
    results_max = [results_max; str2num(tline_tokens{2})];   
end
fclose(fid);


