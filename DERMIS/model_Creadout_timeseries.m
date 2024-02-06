clear all
close all

%% ==== NO NORMAL FORCE =====
N = 5;
fin = 10; % Define the frequency of the sinusoid (1/fin)
deltaX_max = 50e-6;
deltaX_res = deltaX_max / (2^N);

% Create a sinusoidal waveform for deltaX
t = linspace(0, 1, 2^N + 1); % Time vector for one period
deltaX = deltaX_max * sin(2 * pi * fin * t); % Sinusoidal waveform

% Repeat the waveform to cover the range from -deltaX_max to deltaX_max
deltaX = interp1(linspace(0, 1, length(deltaX)), deltaX, linspace(0, 1, 2^N + 1));
deltaX = repmat(deltaX, 1, floor((2 * deltaX_max / fin)));

x0 = 50e-6;
z0 = 125e-6;
y0 = 125e-6;
deltaZ = 0;

eps = 8.85e-12;
eps_pdms = 2.77;

% Calculation for Cs1 and Cs2 using deltaX as a sinusoidal waveform
Cs1a = (eps_pdms * eps * (x0 - deltaX) * y0) / (z0 - deltaZ);
Cs1b = (eps_pdms * eps * (x0 - deltaX) * y0) / (z0 - deltaZ);
Cs1 = (Cs1a .* Cs1b) ./ (Cs1a + Cs1b);
Cs1(isnan(Cs1)) = 0;

Cs2a = (eps_pdms * eps * (x0 + deltaX) * y0) / (z0 - deltaZ);
Cs2b = (eps_pdms * eps * (x0 + deltaX) * y0) / (z0 - deltaZ);
Cs2 = (Cs2a .* Cs2b) ./ (Cs2a + Cs2b);
Cs2(isnan(Cs2)) = 0;

figure
plot(t,Cs1a)
