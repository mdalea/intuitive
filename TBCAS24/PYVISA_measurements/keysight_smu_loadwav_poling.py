#!python3
# *********************************************************
# This program illustrates a few commonly-used programming
# features of your Keysight Infiniium Series oscilloscope.
# *********************************************************
# Import modules.
# ---------------------------------------------------------
import pyvisa
import string
import struct
import sys, getopt
import scipy
import csv
import numpy as np
import math
import time
from datetime import datetime
import matplotlib.pyplot as plt

# Global variables (booleans: 0 = False, 1 = True).
# ---------------------------------------------------------
debug = 1
# =========================================================
# Initialize:
# =========================================================
def initialize():
    # Clear status.
    do_command("*CLS")  
    print("CLS\n")
    # Get and display the device's *IDN? string.
    idn_string = do_query_string("*IDN?")
    print("Identification string: '%s'" % idn_string)
    
    # Load the default setup.
    #do_command("*RST")

# =========================================================
# Setup SMU:
# =========================================================    
def set_smu(instr,volt,ilimit):
    do_command_other(instr,":SOUR:FUNC:MODE VOLT")
    do_command_other(instr,f":SOUR:VOLT {volt}")
    do_command_other(instr,":SENS:VOLT:PROT 1.8") # 500 uA ilimit    
    
    do_command_other(instr,":SENS:FUNC ""CURR""")    
    do_command_other(instr,":SENS:CURR:RANG:AUTO ON")
    do_command_other(instr,":SENS:CURR:APER 2") # 2 seconds averaging
    do_command_other(instr,f":SENS:CURR:PROT {ilimit}") # 500 uA ilimit
    do_command_other(instr,":OUTP ON")    

# =========================================================
# Setup SMU:
# =========================================================    
def set_smu_wav(instr,ilimit,wav,fs):
    do_command_other(instr,":SOUR:FUNC:MODE VOLT")
    do_command_other(instr,f":SOUR:VOLT 0")
    
    do_command_other(instr,":SENS:FUNC ""CURR""")    
    do_command_other(instr,":SENS:CURR:RANG:AUTO ON")
    do_command_other(instr,":SENS:CURR:APER 0.1") # 2 seconds averaging
    do_command_other(instr,f":SENS:CURR:PROT {ilimit}") # 500 uA ilimit     

    do_command_other(instr,":OUTP ON")    
    
    iout_wav = []
    for sample in wav:
        prev_time=time.time()
        do_command_other(instr,f":SOUR:VOLT {sample}")
        do_command_other(instr, ":MEAS:CURR?")
        iout = instr.read()
        iout_wav.append(iout)
        
        time.sleep(1/fs);
        
        print("elapsed time: ",time.time() - prev_time, " s")

    do_command_other(instr,":OUTP OFF")    
    
    return iout_wav
    
# =========================================================
# Measure Iq
# =========================================================    
def meas_smu(instr):   
    #do_command_other(instr,":MEAS:CURR? (@1)") 
    do_command_other(instr, ":MEAS:CURR?")
    iq = instr.read()
    
    return iq
    
# =========================================================
# Send a command and check for errors:
# =========================================================
def do_command(command, hide_params=False):
    if hide_params:
        (header, data) = command.split(" ", 1)
        if debug:
            print("\nCmd = '%s'" % header)
    else:
        if debug:
            print("\nCmd = '%s'" % command)
            
    Infiniium.write("%s" % command)
    
    if hide_params:
        check_instrument_errors(header)
    else:
        check_instrument_errors(command)
# =========================================================
# Send a command and binary values and check for errors:
# =========================================================
def do_command_ieee_block(command, values):
    if debug:
        print("Cmb = '%s'" % command)
    Infiniium.write_binary_values("%s " % command, values, datatype='B')
    check_instrument_errors(command)
# =========================================================
# Send a query, check for errors, return string:
# =========================================================
def do_query_string(query):
    if debug:
        print("Qys = '%s'" % query)
    result = Infiniium.query("%s" % query)
    check_instrument_errors(query)
    return result
# =========================================================
# Send a query, check for errors, return floating-point value:
# =========================================================
def do_query_number(query):
    if debug:
        print("Qyn = '%s'" % query)
    results = Infiniium.query("%s" % query)
    check_instrument_errors(query)
    return float(results)
    
# =========================================================
# Send a query, check for errors, return floating-point value:
# =========================================================
def do_query_number_other(instr,query):
    if debug:
        print("Qyn = '%s'" % query)
    results = instr.query("%s" % query)
    #check_instrument_errors_other(instr,query)
    return float(results)    
# =========================================================
# Send a query, check for errors, return binary values:
# =========================================================
def do_query_ieee_block(query):
    if debug:
        print("Qyb = '%s'" % query)
    result = Infiniium.query_binary_values("%s" % query, datatype='s', container=bytes)
    check_instrument_errors(query, exit_on_error=False)
    return result

# =========================================================
# Check for instrument errors:
# =========================================================
def check_instrument_errors_other(instr, command, exit_on_error=True):
    while True:
        error_string = instr.query(":SYSTem:ERRor? STRing")
        if error_string: # If there is an error string value.
            if error_string.find("0,", 0, 2) == -1: # Not "No error".
                print("ERROR: %s, command: '%s'" % (error_string, command))
                if exit_on_error:
                    print("Exited because of error.")
                    sys.exit(1)
            else: # "No error"
                break
        else: # :SYSTem:ERRor? STRing should always return string.
            print("ERROR: :SYSTem:ERRor? STRing returned nothing, command: '%s'"% command)
            print("Exited because of error.")
            sys.exit(1)
    
        
    
# =========================================================
# Check for instrument errors:
# =========================================================
def check_instrument_errors(command, exit_on_error=True):
    while True:
        error_string = Infiniium.query(":SYSTem:ERRor? STRing")
        if error_string: # If there is an error string value.
            if error_string.find("0,", 0, 2) == -1: # Not "No error".
                print("ERROR: %s, command: '%s'" % (error_string, command))
                if exit_on_error:
                    print("Exited because of error.")
                    sys.exit(1)
            else: # "No error"
                break
        else: # :SYSTem:ERRor? STRing should always return string.
            print("ERROR: :SYSTem:ERRor? STRing returned nothing, command: '%s'"% command)
            print("Exited because of error.")
            sys.exit(1)
    
# =========================================================
# Send a command and check for errors: (FOR OTHER INSTRUMENTS)
# =========================================================
def do_command_other(instr, command, hide_params=False):
    if hide_params:
        (header, data) = command.split(" ", 1)
        if debug:
            print("\nCmd = '%s'" % header)
    else:
        if debug:
            print("\nCmd = '%s'" % command)
            
    instr.write("%s" % command)
    
    #if hide_params:
    #    check_instrument_errors_other(instr,header)
    #else:
    #    check_instrument_errors_other(instr,command)
# =========================================================
# Send a command and binary values and check for errors:
# =========================================================

    
# =========================================================
# Main program:
# =========================================================

# Wait for user input before continuing
input("This will apply HV poling to VTOP. Check first and press Enter to continue...")


#rm = pyvisa.ResourceManager("C:\\Windows\\System32\\visa64.dll")
#Infiniium = rm.open_resource("TCPIP0::141.121.231.13::hislip0::INSTR")
rm = pyvisa.ResourceManager();
KeysightB2061A = rm.open_resource("USB0::0x0957::0xCD18::MY51143471::INSTR")
KeysightB2061A.timeout = 200000
KeysightB2061A.clear()

vdc=0.25
print(f"Applying DC voltage at vsensor={vdc} V. Measuring sensor leakage...")
set_smu(KeysightB2061A,vdc,500e-6)
iq=meas_smu(KeysightB2061A)

print(iq)
print(f"Sensor leakage: {iq} A")
print(f"Sensor resistance: {vdc/float(iq)} ohm")

vdc=1
print(f"Applying DC voltage at vsensor={vdc} V. Measuring sensor leakage...")
set_smu(KeysightB2061A,vdc,500e-6)
iq=meas_smu(KeysightB2061A)

print(iq)
print(f"Sensor leakage: {iq} A")
print(f"Sensor resistance: {vdc/float(iq)} ohm")
    

# Parameters
fs = 4 #1       # Sampling frequency in Hz
fpole = 0.5 #0.05   # poling frequency
cycles = 15     # Number of cycles of the sinusoid
duration = cycles/fpole  # Duration in seconds
amplitude_max = 25  # Maximum amplitude in volts
pole_cycles = 1 #10

# Time values
t = np.linspace(0, duration, int(fs * duration))
t_total = np.linspace(0, duration*2*pole_cycles, int(fs * duration*2*pole_cycles))

# Generate the sinusoidal waveform
sinusoid = []
for _ in range(pole_cycles):
    #for _ in range(cycles):
    amplitude = np.linspace(0, amplitude_max, len(t))
    waveform = amplitude * np.sin(2 * np.pi * fpole * t)
    sinusoid.extend(waveform)
    
    zero_period = np.zeros(int(fs * duration))
    sinusoid.extend(zero_period)


ipole_wav=set_smu_wav(KeysightB2061A,100e-3,sinusoid,fs)

print(np.size(t))
print(np.size(sinusoid))
print(np.size(t_total))
print(np.size(ipole_wav))

combined_data=np.column_stack((t_total,sinusoid,ipole_wav))
combined_data = combined_data.astype(np.float64)

timestamp=datetime.now().strftime("%Y-%m-%d_%H-%M-%S")  
# Now, you can save the data to a CSV file with the desired format
np.savetxt(f"output\ipole_{timestamp}.csv", combined_data, delimiter=",", header="Time,Vpole,Isensor", fmt="%.18e,%.18e,%.18e") 
#np.savetxt(f"ipole.csv",combined_data,delimiter=",",header="Time,Isensor")  

print("start plotting")
# Plot the generated waveforms
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 6))

ax1.plot(t_total, sinusoid)
ax1.set_xlabel('Time (s)')
ax1.set_ylabel('Amplitude (V)')
ax1.set_title('Poling Sinusoidal Waveform')
ax1.grid(True)

ax2.plot(t_total, ipole_wav)
ax2.set_xlabel('Time (s)')
ax2.set_ylabel('(A)')
ax2.set_title('Sensor current')
ax2.grid(True)

plt.tight_layout()
plt.show()

KeysightB2061A.close()
print("End of program.")
sys.exit()
#'USB0::0x1AB1::0x0588::DG3G114600735::INSTR'    