wav = xlsread('poling_8inch_noCMP.xlsx')

figure
t = [0:1:6000-1]


% subplot(3,1,1)
% plot(t,wav(:,1))
% grid on;
% xlabel('Time (s)')
% ylabel('(V)')
% xlim([0 300])
% title('Poling Voltage Waveform (One Period - 0.05Hz)')

subplot(2,1,1)
plot(t,wav(:,1))
grid on;
xlabel('Time (s)')
ylabel('(V)')
xlim([0 1200])
%title('Poling Voltage Waveform (0.05Hz, +/-25V)')
title('Poling Voltage')

subplot(2,1,2)
plot(t,wav(:,2),'Color', [0.6350 0.0780 0.1840])

xlabel('Time (s)')
ylabel('(A)')
title('Sensor Current')
xlim([0 1200])
ylim([-10e-9 10e-9])
%set(gca,'YScale','log');

micasplot
set(findall(gcf,'-property','LineWidth'),'LineWidth',2)
set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Poling-wav-noCMP.fig']); saveas(gcf,['Poling-wav-noCMP.png']);

%% CMP
wav_cmp = load('poling_8inch_CMP.txt')
figure
t = [0:1:6000-1]
% subplot(3,1,1)
% plot(t,wav(:,1))
% grid on;
% xlabel('Time (s)')
% ylabel('(V)')
% xlim([0 300])
% title('Poling Voltage Waveform (One Period - 0.05Hz)')

subplot(2,1,1)
plot(t,wav_cmp(:,1))
grid on;
xlabel('Time (s)')
ylabel('(V)')
xlim([0 1200])
title('Poling Voltage Waveform (0.05Hz, +/-25V)')

subplot(2,1,2)
plot(t,wav_cmp(:,2),'Color', [0.6350 0.0780 0.1840])

xlabel('Time (s)')
ylabel('(A)')
title('Sensor Current')
xlim([0 1200])
ylim([-10e-9 10e-9])
%set(gca,'YScale','log');

micasplot
set(findall(gcf,'-property','LineWidth'),'LineWidth',2)
set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['Poling-wav-CMP.fig']); saveas(gcf,['Poling-wav-CMP.png']);