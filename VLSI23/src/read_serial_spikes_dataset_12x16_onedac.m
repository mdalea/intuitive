%% RUNS ON WINDOWS -> arduino-cli
% COM3 for main interface code
% COM4 for VDAC interface

%close all

serialportlist("available")
arduinoObj = []; % clear in case of failed previous connection




%arduinoObj = serialport("/dev/cu.usbmodem11101",2000000);
arduinoObj = serialport("COM3",2000000);

configureTerminator(arduinoObj,"CR/LF");
flush(arduinoObj);

%system('"C:\Users\iclab\Documents\ArduinoRead_2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" board list')
system(['"',pwd,'\arduino-cli_0.29.0_Windows_64bit\arduino-cli" board list'])
%vdac_cfg = '12x16_180mvpp_250mvofs_onedac';
verbose=0
 
mr_cnt=12*16;
ch_cnt=8; % 8 of 16 VDAC channels
tex_cnt=6
trialcnt=40 
taxelbatchcnt=floor(mr_cnt/ch_cnt); % 8 active taxels only; limited by VDAC

 
% tex_array = [1 1 2 3 3 3 4 4 5 5 6 6 6];
% trial_array = [13 15 36 2 22 38 37 40 8 38 17 18 32];
% tex_array = [1 1 1 2 3 3 3 4 4 4 4 5 5 5 6 6 6 6 6];
% trial_array = [10 19 20 11 10 29 38 7 8 16 28 11 30 39 3 5 8 14 26];

%global spks_complete
for k=1:tex_cnt
    for trial=1:trialcnt
        for tbch=1:taxelbatchcnt
% for i=1:length(tex_array)
% 
%     k = tex_array(i)
%     trial = trial_array(i)
%     tbch = tbch_array(i)
        
            arduinoObj = []; % clear in case of failed previous connection
            %arduinoObj = serialport("/dev/cu.usbmodem11101",2000000);
            arduinoObj = serialport("COM3",2000000);

            configureTerminator(arduinoObj,"CR/LF");
            flush(arduinoObj);        

            %spks_complete=0;
            f0 = fopen('spks_complete.txt','w+');
            fprintf(f0,'%s','0');
            fclose(f0);

            if verbose==1
                figure
            end
            cmd1 = ['"',pwd,'\arduino-cli_0.29.0_Windows_64bit\arduino-cli" compile --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files/',vdac_cfg,'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino"']
            %cmd1 = ['"C:\Users\iclab\Documents\ArduinoRead_2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" compile --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files/',vdac_cfg,'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino"']
            %cmd1 = ['"C:\Users\iclab\Documents\ArduinoRead_2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" compile --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'.ino"']

            system(cmd1)
            cmd2 = ['"',pwd,'arduino-cli_0.29.0_Windows_64bit\arduino-cli" upload  -p COM4 --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files/',vdac_cfg,'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino"']            
            %cmd2 = ['"C:\Users\iclab\Documents\ArduinoRead_2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" upload  -p COM4 --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files/',vdac_cfg,'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino"']
            %cmd2 = ['"C:\Users\iclab\Documents\ArduinoRead_2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" upload  -p COM4 --fqbn arduino:avr:mega "C:\Users\iclab\Documents\ArduinoRead_2\ArduinoRead\matlab_code_to_generate_vdac_values\ino_files\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'\ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'.ino"']

            %system('"C:\Users\iclab\Documents\ArduinoRead 2\arduino-cli_0.29.0_Windows_64bit\arduino-cli" upload  -p COM4 --fqbn arduino:avr:mega "C:\Users\iclab\Documents\Arduino\LOCAL_multich_vdac\LOCAL_multich_vdac.ino"')
            system(cmd2)

            pause(15)

            name = ['N_',num2str(Nres),'b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
            %name = ['N_3b_allchannels_9mvpp_250mvofs_cl',num2str(k),'_auto'];
            arduinoObj.UserData = struct("Count",1, "TD_x",[],"TD_y",[],"TD_p",[],"TD_ts",[], "name", name, "trial", trial, "tbch", tbch,  "verbose", verbose);

            configureCallback(arduinoObj,"terminator",@readSpikesSerial);

            spks_complete = fileread('spks_complete.txt');
            while(spks_complete=='0')
                spks_complete = fileread('spks_complete.txt'); 
                %spks_complete
                pause(1)
            end

            % WAIT how many seconds until all spikes are in (set by limit below)
            %pause(50)
        end
    end
end


function readSpikesSerial(src, ~)

global spks_complete
folderPath = pwd;

name = src.UserData.name;
trial = src.UserData.trial;
verbose = src.UserData.verbose;
tbch = src.UserData.tbch;

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
    src.UserData.Count = src.UserData.Count + 1;
    
    % If 1001 data points have been collected from the Arduino, switch off the
    % callbacks and plot the data.
    if src.UserData.Count > 3000 %10000 %10000  %2000 %8000
        %spks_complete = 1; 
        f0 = fopen('spks_complete.txt','w+');
        fprintf(f0,'%i','1');
        fclose(f0);
        
    %if src.NumBytesAvailable == 0
        configureCallback(src, "off");        
        %plot(src.UserData.Data(2:end));
        %imagesc(frame_data);
        TD.x = src.UserData.TD_x;
        TD.y = src.UserData.TD_y;
        TD.p = src.UserData.TD_p;
        TD.ts = src.UserData.TD_ts;
%         %Encode_Ndataset([folderPath,'/',num2str(1)],TD);
          if not(isfolder([folderPath,'\out\',name]))
              mkdir([folderPath,'\out\',name])
          end
        Encode_Ndataset_longTs([folderPath,'\out\',name,'\',num2str(trial),'-',num2str(tbch)],TD);
        TD=dataset_sort_timestep_arduino_12x16(folderPath,['\out\',name,'\',num2str(trial),'-',num2str(tbch)]);    
        src.UserData.TD_x = TD.x;
        src.UserData.TD_y = TD.y;
        src.UserData.TD_p = TD.p;
        src.UserData.TD_ts = TD.ts;

        if verbose==1

            hold all;           
            for spikeCount = 1:length(src.UserData.TD_ts)
                if src.UserData.TD_p(spikeCount)==1  % ON spike
                    plot([src.UserData.TD_ts(spikeCount)/1e6 src.UserData.TD_ts(spikeCount)/1e6], ...
                        [xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)-0.4 xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)+0.4], 'k');
                else   % OFF spike
                   plot([src.UserData.TD_ts(spikeCount)/1e6 src.UserData.TD_ts(spikeCount)/1e6], ...
                        [xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)-0.4 xytolin_customxy(src.UserData.TD_x(spikeCount),src.UserData.TD_y(spikeCount),16)+0.4], 'k','Color','red');
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
            
        end
        arduinoObj = []; % close serial port so arduino can be programmed
    end
end



end
