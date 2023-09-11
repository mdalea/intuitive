close all

%folderPath = '/users/micas/malea/Documents/ArduinoRead'
folderPath = pwd


figure

% generate random spikes
TD.x = []; TD.y = []; TD.p = []; TD.ts = [];
for i=1:1000
    TD.x = [TD.x; randi([1 12])];
    TD.y = [TD.y; randi([1 16])];
    TD.p = [TD.p; randi([1 2])];
    TD.ts = [TD.ts; randi([0 10e6])];
end
% function readSpikesSerial(src, ~)
% 
% TD.x = []; TD.y = []; TD.p = []; TD.ts = [];
% tend = 10; %seconds
% tVec = 0:1:10*10e6-1; % convert to us resolution
% 
% % Read the ASCII data from the serialport object.
% data = readline(src);
% 
% % Convert the string data to numeric type and save it in the UserData
% % property of the serialport object.
% src.UserData.Data(end+1) = data; %str2double(data);
% spk_data = split(data,",");
% 
% TD.x(end+1) = str2num(spk_data(1));
% TD.y(end+1) = str2num(spk_data(2));
% TD.p(end+1) = str2num(spk_data(3));
% TD.ts(end+1) = str2num(spk_data(4));

% Update the Count value of the serialport object.
%src.UserData.Count = src.UserData.Count + 1;

% If 1001 data points have been collected from the Arduino, switch off the
% callbacks and plot the data.
% if src.UserData.Count > 1000
    %configureCallback(src, "off");
    %plot(src.UserData.Data(2:end));
    %imagesc(frame_data);
    Encode_Ndataset([folderPath,'/',num2str(1)],TD); 
    %Encode_Ndataset([folderPath,'/',num2str(60001)],TD); % for testdata, for just for datasort_timestep to work
    TD=dataset_sort_timestep_arduino(folderPath,1);
    hold all;
    for spikeCount = 1:length(TD.ts)
        if TD.p(spikeCount)==1
            plot([TD.ts(spikeCount) TD.ts(spikeCount)], ...
                [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k');
        else
           plot([TD.ts(spikeCount) TD.ts(spikeCount)], ...
                [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k','Color','red');
        end   
    end
    ylim([0 191]);
    xlabel('Time (us)');
    ylabel('Taxel Number');
    xytolin_customxy(TD.x,TD.y,16)
% end
% end
