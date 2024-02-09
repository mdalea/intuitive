
close all
clear all

serialportlist("available")
arduinoObj = []; % clear in case of failed previous connection

%arduinoObj = serialport("/dev/cu.usbmodem11101",2000000);
arduinoObj = serialport("COM3",2000000);
%arduinoObj = serialport("COM5",2000000); %COM5 for Teensy

configureTerminator(arduinoObj,"CR/LF");
flush(arduinoObj);

f0 = fopen('frames_shape_complete.txt','w+');
fprintf(f0,'%i','0');
fclose(f0);

fig1=figure
%hold all;
h1 = axes(fig1,'visible','off');

 %fig2=figure
% %hold all;
 %h2 = axes(fig2,'visible','off');

 % get current datetime as unique identifiers for output spikes
currentDatetime = datetime('now','Format','yyyyMMdd_HHmmss')
datestr_name = datestr(currentDatetime,'yyyy-mm-dd_HH-MM-SS')
name = ['sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod_1000ms','-',datestr_name]
%name = ['sensor_1b_imode_itail_50nA_ramp_0p1Hz_500mVpp_ith_10n_ispk_100u_ispkfast_100u_islew_0_vil_0p8_vgate_0_fasttau_capatt_11','-',datestr_name]
%name = 'test'
%name = ['sensor_test_1a_pdms_N5b_itail_50nA_square_indentpulses','-',datestr_name]
%name = ['allspikes_test','-',datestr_name]
%name = ['sensor_1b_pdms_N5b_itail_50nA_squ_indentpulses_10us','-',datestr_name]

%name = ['mismatch_N5b_itail_50nA_islew_1u_ramp_0p1Hz_1000mVpp_MAXSPIKES_800','-',datestr_name]
%name = ['test_rw_N3b_itail_0','-',datestr_name]
%name = ['test_rw_N4b_itail_50nA_islew_1u_ramp_0p1Hz_200mVpp','-',datestr_name]
name = ['sensor_test_rw_nopdms_N4b_itail_50nA_square_indentpulses','-',datestr_name]

frame_data_on=zeros(12,16); frame_data_off=zeros(12,16);
%frame_data_on=zeros(16,16); frame_data_off=zeros(16,16);
arduinoObj.UserData = struct("h1",h1,"Count",1, "TD_x",[],"TD_y",[],"TD_p",[],"TD_ts",[],"frame_data_on",frame_data_on,"frame_data_off",frame_data_off,"name",name);

configureCallback(arduinoObj,"terminator",@readSpikesSerial);

% WAIT how many seconds until all spikes are in (set by limit below)
pause(5000)

frames_shape_complete = fileread('frames_shape_complete.txt');
while(frames_shape_complete=='0')
    frames_shape_complete = fileread('frames_shape_complete.txt'); 
    pause(1)
end

%------

    

    
%-------

function readSpikesSerial(src, ~)

folderPath = pwd;


trial=1;

%tend = 10; %seconds
%tVec = 0:1:tend*10e6-1; % convert to us resolution

% Read the ASCII data from the serialport object.
data = readline(src)


% Convert the string data to numeric type and save it in the UserData
% property of the serialport object.

spk_data = split(data,",");

if spk_data(1) == 'S'

    %src.UserData.Data(end+1) = data; %str2double(data);

    src.UserData.TD_x(end+1) = str2num(spk_data(2));
    src.UserData.TD_y(end+1) = str2num(spk_data(3));
    src.UserData.TD_p(end+1) = str2num(spk_data(4));
    src.UserData.TD_ts(end+1) = str2num(spk_data(5));
    
    % Update the Count value of the serialport object.
    src.UserData.Count = src.UserData.Count + 1
    
    % If 1001 data points have been collected from the Arduino, switch off the
    % callbacks and plot the data.
    if src.UserData.Count > 800*6 -1    %499
    %if src.NumBytesAvailable == 0   % just wait for pause
        configureCallback(src, "off");        
        %plot(src.UserData.Data(2:end));
        %imagesc(frame_data);
        TD.x = src.UserData.TD_x;
        TD.y = src.UserData.TD_y;
        TD.p = src.UserData.TD_p;
        TD.ts = src.UserData.TD_ts;
%         %Encode_Ndataset([folderPath,'/',num2str(1)],TD);
          if not(isfolder([folderPath,'\out\',src.UserData.name]))
              mkdir([folderPath,'\out\',src.UserData.name])
          end

        max(TD.x)
        max(TD.y)

        %% REMOVE JUNK SPIKES. HAPPENS WHEN SERIAL SIGNAL IS CORRUPTED
        TD.x = TD.x(TD.x <= 15)
        TD.y = TD.y(TD.x <= 15)
        TD.p = TD.p(TD.x <= 15)
        TD.ts = TD.ts(TD.x <= 15)

        TD.x = TD.x(TD.y <= 11)
        TD.y = TD.y(TD.y <= 11)
        TD.p = TD.p(TD.y <= 11)
        TD.ts = TD.ts(TD.y <= 11)
%         TD.x(TD.y > 11) = TD.x(TD.y > 11) -4
%         TD.y(TD.y > 11) = TD.y(TD.y > 11) -4
%         TD.p(TD.y > 11) = TD.p(TD.y > 11) -4
%         TD.ts(TD.y > 11) = TD.ts(TD.y > 11) -4

%         TD.x = TD.x(TD.ts > 10000)
%         TD.y = TD.y(TD.ts > 10000)
%         TD.p = TD.p(TD.ts > 10000)
%         TD.ts = TD.ts(TD.ts > 10000)

        Encode_Ndataset_longTs([folderPath,'\out\',src.UserData.name,'\',num2str(trial)],TD);
        %Encode_Ndataset([folderPath,'/',num2str(60001)],TD); % for testdata, for just for datasort_timestep to work
        TD=dataset_sort_timestep_arduino([folderPath,'\out\',src.UserData.name],trial);
        %TD=dataset_sort_timestep_arduino(folderPath,1);       
        src.UserData.TD_x = TD.x;
        src.UserData.TD_y = TD.y;
        src.UserData.TD_p = TD.p;
        src.UserData.TD_ts = TD.ts;
        subplot(3,1,1);
        hold all;
        
        length(src.UserData.TD_ts)
        for spikeCount = 1:length(src.UserData.TD_ts)
            %spikeCount
            %src.UserData.TD_x(spikeCount)
            %src.UserData.TD_y(spikeCount)
            if src.UserData.TD_p(spikeCount)==1  % ON spike
                plot([src.UserData.TD_ts(spikeCount)/1e6 src.UserData.TD_ts(spikeCount)/1e6], ...
                    [xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)-0.4 xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)+0.4], 'k');
                if src.UserData.TD_ts(spikeCount) > 0 %1000000 % 1 second; ignore initial spikes
                    src.UserData.frame_data_on(src.UserData.TD_y(spikeCount)+1,src.UserData.TD_x(spikeCount)+1) = src.UserData.frame_data_on(src.UserData.TD_y(spikeCount)+1,src.UserData.TD_x(spikeCount)+1) + 1 % accumulate spikes per address
                end
            else   % OFF spike
               plot([src.UserData.TD_ts(spikeCount)/1e6 src.UserData.TD_ts(spikeCount)/1e6], ...
                    [xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)-0.4 xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)+0.4], 'k','Color','red');
                if src.UserData.TD_ts(spikeCount) > 0 %1000000 % 1 second; ignore initial spikes
                    src.UserData.frame_data_off(src.UserData.TD_y(spikeCount)+1,src.UserData.TD_x(spikeCount)+1) = src.UserData.frame_data_off(src.UserData.TD_y(spikeCount)+1,src.UserData.TD_x(spikeCount)+1) + 1 % accumulate spikes per address          
                end
            end 
        end     
        instrreset
        %refreshdata
        %ylim([0 191]);
        %ylim([10 10]);
        grid on
        xlabel('Time (s)');
        ylabel('Taxel Number');
        %xytolin_customxy(src.UserData.TD_x,src.UserData.TD_y,12)
        
        hold off;
       
        subplot(3,1,2)
        heatmap(src.UserData.frame_data_on);
        colormap(jet(512))
        title('ON spike count')
        
        subplot(3,1,3)
        heatmap(src.UserData.frame_data_off);
        colormap(jet(512))   
        title('OFF spike count')


        % Set the width and height of the figure (in pixels)
        width = 1200;    % Specify your desired width here
        height = 600;   % Specify your desired height here
        set(gcf, 'Position', [100, 100, width, height]);
        saveas(gcf,['out\spike_frames_',src.UserData.name,'.fig'])
        saveas(gcf,['out\spike_frames_',src.UserData.name,'.png'])
               
        %show_spikes_long_isi
        arduinoObj = []; % close serial port so arduino can be programmed
        
        size(TD.ts)
    end
end



end
