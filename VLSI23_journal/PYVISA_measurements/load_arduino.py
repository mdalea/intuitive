import os




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