csvFileName = 'ipole_2023-09-05_13-38-48.csv';
csvFileName = 'ipole_2023-09-05_17-48-47-sample_1b.csv';
csv_val = csvread(csvFileName,1,0); % skip first line of names

time=csv_val(:,1);
vpole=csv_val(:,2)
isensor=csv_val(:,3);

figure
subplot(2,1,1)
plot(time,vpole); 
subplot(2,1,2)
plot(time,isensor)

figure
plot(time,vpole./isensor)