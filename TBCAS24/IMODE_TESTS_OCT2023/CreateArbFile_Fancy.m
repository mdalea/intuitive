% "Fancy" waveform example file for the Rigol DG1022 function generator.
% Saves an .rdf file that can be loaded into the Rigol DG1022
%
% Rev. 12/5/2015

clear all

% Create a "fancy" function for the arbitrary waveform generator
s_max = 2^14 - 1;   % Max level of 14-bit DAC is 16,383
s_zero = 2^14 / 2;  % "Zero" of waveform is 8,192

% Create first half of waveform (samples 1 to 2048):  a sin function
n = 0 : 2047;       % Sample index for sin function
w = pi / 2048;      % Normalized frequency (rad/samp)

s = ceil( s_max / 2 * sin( w * n ) + s_max / 2 );   % Sin function

% Create third quarter of waveform (samples 2049 to 3072):  "zero"
s( 2049 : 3072 ) = s_zero;

% Create seventh eigth of waveform (samples 3073 to 3584):  negative full scale
s( 3073 : 3584 ) = 0;

% Create eight eigth of waveform (samples 3585 to 4096):  positive half scale
s( 3585 : 4096 ) = 3 / 4 * s_max;

%% Plot the function 
plot( s );                          % Plot the function
title( 'Waveform for Rigol DG1022 Function Generator Test' )
xlabel( 'Sample Number' )
ylabel( 'Quantization Level' )
grid on

%% Save the samples to disk
s_fp = uint16( s );                        % Create a 16-bit integer, but let's be specific.
Filename = 'FancyFunction.rdf';            % Store in this file
fid = fopen( Filename, 'w' );              % Open the file for writing    
fwrite( fid, s_fp, 'uint16', 'ieee-le' );  % Write as 16-bit values, little endian
fclose( fid );                             % Close file

