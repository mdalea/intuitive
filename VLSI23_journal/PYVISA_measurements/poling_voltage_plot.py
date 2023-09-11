import numpy as np
import matplotlib.pyplot as plt

# Parameters
fs = 1000       # Sampling frequency in Hz
duration = 300  # Duration in seconds
cycles = 15     # Number of cycles of the sinusoid
amplitude_max = 25  # Maximum amplitude in volts
pole_cycles = 10 # Number of poling cycles

# Time values
t = np.linspace(0, duration, int(fs * duration))
t_total = np.linspace(0, duration*2*pole_cycles, int(fs * duration*2*pole_cycles))

# Generate the sinusoidal waveform
sinusoid = []
for _ in range(pole_cycles):
    #for _ in range(cycles):
    amplitude = np.linspace(0, amplitude_max, len(t))
    waveform = amplitude * np.sin(2 * np.pi * 0.05 * t)
    sinusoid.extend(waveform)
    
    zero_period = np.zeros(int(fs * duration))
    sinusoid.extend(zero_period)
    
print(np.size(t))
print(np.size(sinusoid))
print(np.size(t_total))

print("start plotting")
# Plot the generated waveform
plt.figure(figsize=(10, 4))
plt.plot(t_total, sinusoid)
plt.xlabel('Time (s)')
plt.ylabel('Amplitude (V)')
plt.title('Generated Sinusoidal Waveform')
plt.grid(True)
plt.show()


