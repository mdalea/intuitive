# IMPORTANT: REQUIRES 100x attenuators on input -> could damage chip!
# Get noise PSD at different ITAIL
# TIP: cover chip/disconnect SMU/TSENSE disconnected/ osc fs = 500ksps
# Automatically program Arduino 
#
# USAGE: python.exe keysight_rigol_ofs_weep.py <identifier of this test> <# of runs for averaging> <min. offset value x 100> <max. offset value x 100> <offset value stepsize x 100>
# USAGE: python.exe keysight_rigol_gain_freqsweep.py <identifier of this test> <# of runs for averaging> <# of previous offset sweep runs> <startfreq> <stopfreq> <# of pts per decade>
#
# Mark Alea mark.alea@kuleuven.be ESAT-MICAS, KU Leuven
# 26/07/2023

import os

'''
os.system("python.exe keysight_rigol_ofs_sweep.py sample_I2_itail_100nA_2 5 -200e-3 200e-3 5e-3")
os.system("python.exe keysight_rigol_gain_freqsweep.py sample_I2_itail_100nA_2 5 5 1 100e3 5")
'''
inst_id = 'sample_I2_covered_for_paper'

# to be more accurate with output noise, add a VOFS SWEEP here
#

#---- ITAIL=1nA -------
cmd1=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe board list' # no "" on arduino-cli path for some reason (diff. in MATLAB)
print(cmd1)
os.system(cmd1)
cmd2=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe compile --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_1nA\fastAER_itail_1nA.ino'
print(cmd2)
os.system(cmd2)
cmd3=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe upload  -p COM3  --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_1nA\fastAER_itail_1nA.ino'
print(cmd3)
os.system(cmd3)

os.system(f"python.exe keysight_rigol_noise_psd.py {inst_id}_itail_1nA 1 -")

#---- ITAIL=10nA -------
cmd1=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe board list' # no "" on arduino-cli path for some reason (diff. in MATLAB)
print(cmd1)
os.system(cmd1)
cmd2=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe compile --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_10nA\fastAER_itail_10nA.ino'
print(cmd2)
os.system(cmd2)
cmd3=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe upload  -p COM3  --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_10nA\fastAER_itail_10nA.ino'
print(cmd3)
os.system(cmd3)

os.system(f"python.exe keysight_rigol_noise_psd.py {inst_id}_itail_10nA 1 -")

#---- ITAIL=100nA -------
cmd1=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe board list' # no "" on arduino-cli path for some reason (diff. in MATLAB)
print(cmd1)
os.system(cmd1)
cmd2=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe compile --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_100nA\fastAER_itail_100nA.ino'
print(cmd2)
os.system(cmd2)
cmd3=r'arduino-cli_0.29.0_Windows_64bit\arduino-cli.exe upload  -p COM3  --fqbn arduino:avr:mega arduino_ino_files\fastAER_itail_100nA\fastAER_itail_100nA.ino'
print(cmd3)
os.system(cmd3)

os.system(f"python.exe keysight_rigol_noise_psd.py {inst_id}_itail_100nA 1 -")