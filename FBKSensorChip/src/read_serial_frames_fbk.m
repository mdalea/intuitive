%% Read sequential ADC output codes and assemble as a frame of sensor array output
%% For the FBK PVDF sensor test chip
%% Author: Mark Daniel Alea - mark.alea@kuleuven.be
%% Last updated: 14/07/2023

serialportlist("available")
arduinoObj = []; % clear in case of failed previous connection
%arduinoObj = serialport("COM13",9600)
arduinoObj = serialport("COM5",2000000)
%arduinoObj = serialport("COM5",9600)

configureTerminator(arduinoObj,"CR/LF");
flush(arduinoObj);

f0 = fopen('frames_complete.txt','w+');
fprintf(f0,'%i','0');
fclose(f0);

max_frames=10;
% map sequence of values from Arduino into 2D frame reflecting sensor array
% X -> columns; Y -> rows

addressMapX_TOP = [2 3 4 5 5 6 6 7 7 8 8 9 9 10 10]; 
addressMapY_TOP = [2 3 4 5 6 5 6 6 5 5 6 6 5 5  6];  

addressMapX_RIGHT = flip([11 11 12 12 13 14 15 16 16 16 16 16 16 16 16]);
addressMapY_RIGHT = flip([6  5  6  5  4  3  2  1  2  3  4  5  6  7  8]);

addressMapX_RIGHTL = flip([16 16 16 16 17 15 14 13 12 12]);  % 12,17 is for calibration (right)
addressMapY_RIGHTL = flip([9  10 11 12 12 11 10 9  8  7]);  

addressMapX_BOT = flip([11 11 10 10 9 9 8 8 7 7 6 6 5 5 4]); 
addressMapY_BOT = flip([8  7  7  8  8 7 7 8 8 7 7 8 7 8 9]);

addressMapX_LEFT = flip([3  2  4 1  1  1  1 1 1 1 1 1 1 1 1]);  % 13,4 is for calibration (bottom)
addressMapY_LEFT = flip([10 11 13 12 11 10 9 8 7 6 5 4 3 2 1]);

% 70 codes in one frame
addressMapX = [addressMapX_TOP addressMapX_RIGHT addressMapX_RIGHTL addressMapX_BOT addressMapX_LEFT];
addressMapY = [addressMapY_TOP addressMapY_RIGHT addressMapY_RIGHTL addressMapY_BOT addressMapY_LEFT];

fig=figure
%hold all;
h = axes(fig,'visible','off');

% frame_data = zeros(12+1,16+1);
frame_data = zeros(13,17); %-1; % initiate values to -1, 13x17 to include calib taxels
arduinoObj.UserData = struct("h",h,"Data",[],"Count",0,"Frame_Count",0,"max_frames",max_frames,"frame_data",frame_data,"all_frames",[],"addressMapX",addressMapX,"addressMapY",addressMapY)

configureCallback(arduinoObj,"terminator",@readSineWaveData);



pause(500);

frames_complete = fileread('frames_complete.txt');
while(frames_complete=='0')
    frames_complete = fileread('frames_complete.txt'); 
    %spks_complete
    pause(1)
end





function readSineWaveData(src, ~)

% Read the ASCII data from the serialport object.
global frames_complete
data = readline(src)

token_data = split(data,",");

if token_data(1) == 'F'

    adc_v = 2.5*str2num(token_data(2))/1024;

    % Update the Count value of the serialport object.
    src.UserData.Count = src.UserData.Count + 1

    %src.UserData.addressMapX(src.UserData.Count)
    %src.UserData.addressMapY(src.UserData.Count)

    % notice the switch between x and y
    src.UserData.frame_data(src.UserData.addressMapY(src.UserData.Count),src.UserData.addressMapX(src.UserData.Count)) = adc_v;

    % If 1001 data points have been collected from the Arduino, switch off the
    % callbacks and plot the data.
    if src.UserData.Count == 70
        src.UserData.Count = 0;
        src.UserData.Frame_Count = src.UserData.Frame_Count + 1;
 
        subplot(5,2,src.UserData.Frame_Count);
%         imagesc(src.UserData.frame_data);
%         colorbar;      
        heatmap(src.UserData.frame_data);
        colormap(jet(512))
        ylabel(['frame ',num2str(src.UserData.Frame_Count)]);        
        
        src.UserData.all_frames = [src.UserData.all_frames src.UserData.frame_data];
        %writematrix(src.UserData.frame_data,[datestr(now),'-',num2str(src.UserData.Frame_Count),'.txt']);
        
        if src.UserData.Frame_Count == src.UserData.max_frames
            f0 = fopen('frames_complete.txt','w+');
            fprintf(f0,'%i','1');
            fclose(f0);

            configureCallback(src, "off");        
            
            %writematrix(src.UserData.all_frames,[erase(char(datetime),' '),'.txt']);
            writematrix(src.UserData.all_frames,[date,'.txt']);
        else                
            src.UserData.frame_data = zeros(13,17); %-1;
        end
    end
    arduinoObj=[];
end    
end
