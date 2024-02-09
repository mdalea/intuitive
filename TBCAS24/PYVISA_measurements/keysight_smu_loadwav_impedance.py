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
import ctypes

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
    
# Function to sleep in microseconds
def usleep(microseconds):
    start_time = ctypes.c_int64()
    end_time = ctypes.c_int64()

    QueryPerformanceCounter(ctypes.byref(start_time))
    
    while True:
        QueryPerformanceCounter(ctypes.byref(end_time))
        elapsed_microseconds = (end_time.value - start_time.value) * 1000000 // frequency

        if elapsed_microseconds >= microseconds:
            break
    

# =========================================================
# Setup SMU:
# =========================================================    
def set_smu(instr,volt,ilimit):
    do_command_other(instr,":SOUR:FUNC:MODE VOLT")
    do_command_other(instr,f":SOUR:VOLT {volt}")
    do_command_other(instr,":SENS:VOLT:PROT 1.8") # 500 uA ilimit    
    
    do_command_other(instr,":SENS:FUNC ""CURR""")    
    do_command_other(instr,":SENS:CURR:RANG:AUTO ON")
    do_command_other(instr,":SENS:CURR:APER 4") # 4 seconds averaging
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
    do_command_other(instr,f":SENS:CURR:APER {1/fs}") # 2 seconds averaging
    do_command_other(instr,f":SENS:CURR:PROT {ilimit}") # 500 uA ilimit     

    do_command_other(instr,":OUTP ON")    
    
    iout_wav = np.array([])
    
    prev_time=time.time()
    for sample in wav:
        #prev_time=time.time()
        #do_command_other(instr,f":SOUR:VOLT {sample}")
        #do_command_other(instr, ":MEAS:CURR?")
        instr.write(f":SOUR:VOLT {sample}")
        instr.write(":MEAS:CURR?")
        
        #iout = instr.read()
        iout_wav=np.append(iout_wav,float(instr.read()))
        
        #time.sleep(1/fs);
        #Sleep(int(1e3/fs)) # milliseconds
        usleep(int(1e6/fs))
        
        #print("elapsed time: ",time.time() - prev_time, " s")

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
# Perform PSD using welch
# =========================================================  
def extract_power(voltage_arr,fin,fsample,f_lo):
        
    windowTime = 1/f_lo    
    windowSize = fsample * windowTime
    overlap = windowSize / 2

    print(voltage_arr[:10])
    [freq, Pxx] = scipy.signal.welch(x=voltage_arr, fs=fsample,nperseg=windowSize, return_onesided=True,scaling='spectrum');    
    print(freq[:10])
    idx = find_indices(freq,fin,0.5) # look for +/- 50% of fin and find max peak
    print(idx)
    Pxx_peak = max(Pxx[idx])
    Pxx_fin = 2*math.sqrt(2*Pxx_peak)
    print(f"Iout pk2pk {Pxx_fin}")        
    
    return Pxx_fin
    
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
# Define QueryPerformanceCounter function from Windows API
kernel32 = ctypes.WinDLL('kernel32', use_last_error=True)
QueryPerformanceCounter = kernel32.QueryPerformanceCounter
QueryPerformanceFrequency = kernel32.QueryPerformanceFrequency

# Get frequency of the performance counter
frequency = ctypes.c_int64()
QueryPerformanceFrequency(ctypes.byref(frequency))
frequency = frequency.value


# Wait for user input before continuing
#input("This will apply HV poling to VTOP. Check first and press Enter to continue...")


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
fs = 20 #50e3  #2500       # Sampling frequency in Hz -> max=0.02PLC = 2.5kHz?
fsine_min=0.01
#fsine = 1   # poling frequency
#duration = 10*1.5/(0.1*fsine_min) # Duration in seconds - 10 periods (w/overlaps) 
amplitude = 0.25  # Maximum amplitude in volts


startfreq = fsine_min
stopfreq = 20 #10e3
num_points_per_decade = 5

# Calculate the number of decades
num_decades = np.log10(stopfreq/startfreq)

# Calculate the number of points
num_points = int(num_decades * num_points_per_decade) + 1

# Generate the log-spaced points
log_spaced_points = np.logspace(np.log10(startfreq), np.log10(stopfreq), num_points)
freq_arr=[]
zsensor_arr=[]
iout_pp_arr=[]
for fsine in log_spaced_points:
    print("---------------------")
    print(fsine)
    
    if fsine < 1:
        duration = 10*1.5/(fsine_min) # Duration in seconds - 10 periods (w/overlaps) 
        #duration = 100e-6
    else:
        duration = 10*1.5/(1) # Duration in seconds - 10 periods (w/overlaps) 
        
    # Time values
    t = np.linspace(0, duration, int(fs * duration))        
        
    sinusoid = amplitude * np.sin(2 * np.pi * fsine * t)
    isensor=set_smu_wav(KeysightB2061A,1e-3,sinusoid,fs)
    iout_pp = extract_power(isensor,fsine,fs,fsine_min)
    zsensor = amplitude*2 / iout_pp
    
    freq_arr.append(fsine)
    iout_pp_arr.append(iout_pp)
    zsensor_arr.append(zsensor)

print(freq_arr)
print(iout_pp_arr)
print(zsensor_arr)

# Zip the arrays to align them row-wise
rows = zip(freq_arr, iout_pp_arr, zsensor_arr)

# Specify the CSV file path
csv_file_path = 'output\ID_' + inst_id + '_zsensor_vs_fin_sweep' + '-' + str(run_id) + '.csv'

# Write the data to the CSV file
with open(csv_file_path, 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow(['freq', 'iout_pp' , 'zsensor'])  # Write the header row
    csv_writer.writerows(rows)

print(f"The data has been written to '{csv_file_path}'.")

KeysightB2061A.close()



print("End of program.")
sys.exit()
#'USB0::0x1AB1::0x0588::DG3G114600735::INSTR'    