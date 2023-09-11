% serialportlist("available")
% arduinoObj = serialport("COM13",9600)
% 
% configureTerminator(arduinoObj,"CR/LF");
% flush(arduinoObj);
% arduinoObj.UserData = struct("Data",[],"Count",1)
% 
% configureCallback(arduinoObj,"terminator",@readSineWaveData);

% map sequence of values from Arduino into 2D frame reflecting sensor array
addressMapX_TOP = [2 3 4 5 5 6 6 7 7 8 8 9 9 10 10]; 
addressMapY_TOP = [2 3 4 5 6 5 6 6 5 5 6 6 5 5  6];  

addressMapX_RIGHT = flip([11 11 12 12 13 14 15 16 16 16 16 16 16 16 16]);
addressMapY_RIGHT = flip([6  5  6  5  4  3  2  1  2  3  4  5  6  7  8]);

addressMapX_RIGHTL = flip([16 16 16 16 17 15 14 13 12 12]);  % 12,17 is for calibration (right)
addressMapY_RIGHTL = flip([9  10 11 12 12 11 10 9  8  7]);  

addressMapX_BOT = flip([11 11 10 10 9 9 8 8 7 7 6 6 5 5 4]); 
addressMapY_BOT = flip([8  7  7  8  8 7 7 8 8 7 7 8 7 8 9]);

addressMapX_LEFT = flip([3  2  16 1  1  1  1 1 1 1 1 1 1 1 1]);  % 13,16 is for calibration (bottom)
addressMapY_LEFT = flip([10 11 13 12 11 10 9 8 7 6 5 4 3 2 1]);

addressMapX = [addressMapX_TOP addressMapX_RIGHT addressMapX_RIGHTL addressMapX_BOT addressMapX_LEFT];
addressMapY = [addressMapY_TOP addressMapY_RIGHT addressMapY_RIGHTL addressMapY_BOT addressMapY_LEFT];

frame_data = zeros(12+1,16+1);
size(frame_data)
% function readSineWaveData(src, ~)

% Read the ASCII data from the serialport object.
% data = readline(src);

% Convert the string data to numeric type and save it in the UserData
% property of the serialport object.
% src.UserData.Data(end+1) = str2double(data);

% Update the Count value of the serialport object.
% src.UserData.Count = src.UserData.Count + 1;

data=[1:1:70];

for(i=1:length(data))
    % notice the switch between x and y
    frame_data(addressMapY(i),addressMapX(i)) = data(i);
end    

figure
imagesc(frame_data)
size(frame_data)
frame_data

% frame_data(addressMapX(src.UserData.Data),addressMapY(src.UserData.Data)) = str2double(data);

% If 1001 data points have been collected from the Arduino, switch off the
% callbacks and plot the data.
% if src.UserData.Count > 1001
%     configureCallback(src, "off");
%     plot(src.UserData.Data(2:end));
% end
% end