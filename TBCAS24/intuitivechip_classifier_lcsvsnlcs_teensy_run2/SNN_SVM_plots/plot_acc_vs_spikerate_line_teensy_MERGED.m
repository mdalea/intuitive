close all

%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
h=[];

SeaGreen=[0.18, 0.55, 0.34];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_tmaxms(end) spike_rate_vmode_N3b_180mvpp_tmaxms(end) spike_rate_vmode_N4b_180mvpp_tmaxms(end) spike_rate_vmode_N5b_180mvpp_tmaxms(end)], [mean(max_vmode_N2b_180mvpp_hsize_234_tmaxms(end,:)) mean(max_vmode_N3b_180mvpp_hsize_234_tmaxms(end,:)) mean(max_vmode_N4b_180mvpp_hsize_234_tmaxms(end,:)) mean(max_vmode_N5b_180mvpp_hsize_234_tmaxms(end,:))],[std(max_vmode_N2b_180mvpp_hsize_234_tmaxms(end,:))  std(max_vmode_N3b_180mvpp_hsize_234_tmaxms(end,:)) std(max_vmode_N4b_180mvpp_hsize_234_tmaxms(end,:)) std(max_vmode_N5b_180mvpp_hsize_234_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_tmaxms(end) spike_rate_vmode_N3b_180mvpp_tmaxms(end) spike_rate_vmode_N4b_180mvpp_tmaxms(end) spike_rate_vmode_N5b_180mvpp_tmaxms(end)], [mean(max_vmode_N2b_180mvpp_hsize_242_tmaxms(end,:))  mean(max_vmode_N3b_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N4b_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N5b_180mvpp_hsize_242_tmaxms(end,:))],[std(max_vmode_N2b_180mvpp_hsize_242_tmaxms(end,:))  std(max_vmode_N3b_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N4b_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N5b_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color',SeaGreen,'LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N3b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_180mvpp_tmaxms(end)], [mean(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))  mean(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))],[std(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))  std(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFmerg_180mvpp_tmaxms(end)  spike_rate_vmode_N3b_OFFmerg_180mvpp_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_180mvpp_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_180mvpp_tmaxms(end)], [mean(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))  mean(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) mean(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))],[std(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))  std(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) std(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_tmaxms(end) spike_rate_imode_vil_0p85_180mvpp_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_tmaxms(end) spike_rate_imode_vil_1_180mvpp_tmaxms(end)  spike_rate_imode_vil_1p1_180mvpp_tmaxms(end)], [ mean(max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(end,:)) mean(max_imode_vil_1_180mvpp_hsize_242_tmaxms(end,:)) mean(max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(end,:))],[ std(max_imode_vil_0p8_180mvpp_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p85_180mvpp_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p9_180mvpp_hsize_242_tmaxms(end,:)) std(max_imode_vil_1_180mvpp_hsize_242_tmaxms(end,:))  std(max_imode_vil_1p1_180mvpp_hsize_242_tmaxms(end,:)) ],'-o','Color','r','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p9_180mvpp_ilsb5_tmaxms(end) spike_rate_imode_vil_1_180mvpp_ilsb5_tmaxms(end)], [mean(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) mean(max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(end,:))],[std(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) std(max_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) ],'-o','Color','y','LineWidth',3);

% 
% h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p7_tmaxms(end) spike_rate_imode_vil_0p775_tmaxms(end) spike_rate_imode_vil_0p9_tmaxms(end)], [ mean(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p7_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p775_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p9_hsize_242_tmaxms(end,:))],[ std(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p775_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p9_hsize_242_tmaxms(end,:))],'-o','Color','r','LineWidth',3);


%h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end)], [mean(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:))],[std(max_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(max_imode_vil_0p8_hsize_242_tmaxms(end,:))],'-o','Color','y','LineWidth',3);


set(gca,'XScale','log')
%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS LSB=600nA (hidden layer=242)','N-LCS LSB=10nA (hidden layer=242)')
lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 8;  

hold off;

%%===== PLOT SVM========
figure
hold on;

%--- Ts plot ----
h=[];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_tmaxms(end) spike_rate_vmode_N3b_180mvpp_tmaxms(end) spike_rate_vmode_N4b_180mvpp_tmaxms(end) spike_rate_vmode_N5b_180mvpp_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_180mvpp_hsize_234_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_234_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_234_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_234_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_tmaxms(end) spike_rate_vmode_N3b_180mvpp_tmaxms(end) spike_rate_vmode_N4b_180mvpp_tmaxms(end) spike_rate_vmode_N5b_180mvpp_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_180mvpp_hsize_242_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color',SeaGreen,'LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N3b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_180mvpp_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_180mvpp_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFmerg_180mvpp_tmaxms(end)  spike_rate_vmode_N3b_OFFmerg_180mvpp_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_180mvpp_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_180mvpp_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_tmaxms(end) spike_rate_imode_vil_0p85_180mvpp_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_tmaxms(end) spike_rate_imode_vil_1_180mvpp_tmaxms(end) spike_rate_imode_vil_1p1_180mvpp_tmaxms(end)], [ mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_tmaxms(end,:))],[ std(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_hsize_242_tmaxms(end,:))  std(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_tmaxms(end,:)) ],'-o','Color','r','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p9_180mvpp_ilsb5_tmaxms(end) spike_rate_imode_vil_1_180mvpp_ilsb5_tmaxms(end)], [mean(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(end,:))],[std(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_tmaxms(end,:)) ],'-o','Color','y','LineWidth',3);


% h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p7_tmaxms(end) spike_rate_imode_vil_0p775_tmaxms(end) spike_rate_imode_vil_0p9_tmaxms(end)], [ mean(svm_maxfold_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p7_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p775_hsize_242_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_hsize_242_tmaxms(end,:))],[ std(svm_maxfold_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p775_hsize_242_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p9_hsize_242_tmaxms(end,:))],'-o','Color','r','LineWidth',3);


set(gca,'XScale','log')
%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS LSB=600nA (hidden layer=242)','N-LCS LSB=10nA (hidden layer=242)')
lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 8;  


%=== CORR ===

%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
h=[];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)], [mean(max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  mean(max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))],[std(max_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  std(max_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(max_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(max_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)], [mean(max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(max_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  std(max_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color',SeaGreen,'LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(end)], [mean(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(max_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  std(max_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(end)], [mean(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(max_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  std(max_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end)  spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1p1_180mvpp_corr_tmaxms(end)], [ mean(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(end,:))],[ std(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))  std(max_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(end,:)) ],'-o','Color','r','LineWidth',3);

%1p1 too much spikes -> discarded!
h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end)  spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end)], [ mean(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))],[ std(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','r','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p9_180mvpp_ilsb5_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_ilsb5_corr_tmaxms(end)], [mean(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:))],[std(max_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) ],'-o','Color','y','LineWidth',3);

% 
% h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_corr_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_corr_tmaxms(end) spike_rate_imode_vil_0p7_corr_tmaxms(end) spike_rate_imode_vil_0p775_corr_tmaxms(end) spike_rate_imode_vil_0p9_corr_tmaxms(end)], [ mean(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p7_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p775_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p9_hsize_242_corr_tmaxms(end,:))],[ std(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p7_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p775_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p9_hsize_242_corr_tmaxms(end,:))],'-o','Color','r','LineWidth',3);


%h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_corr_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_corr_tmaxms(end)], [mean(max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:)) mean(max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_corr_tmaxms(end,:))],[std(max_imode_vil_0p7_hsize_242_corr_tmaxms(end,:)) std(max_imode_vil_0p8_hsize_242_corr_tmaxms(end,:))],'-o','Color','y','LineWidth',3);


set(gca,'XScale','log')
%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS LSB=600nA (hidden layer=242)','N-LCS LSB=10nA (hidden layer=242)')
lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 8;  

hold off;

% Assuming the red line data is stored in h(5) as mentioned previously in the code snippet
redLineXValues = [spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end), spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end)];
redLineYValues = [mean(max_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)), mean(max_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))];

% Text annotations for left-most and right-most points of the red line
text(redLineXValues(1), redLineYValues(1), '\tau = 13ms', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');
text(redLineXValues(2), redLineYValues(2), '\tau = 646ms', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');

%%===== PLOT SVM========
figure
hold on;

%--- Ts plot ----
h=[];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color',SeaGreen,'LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(end)], [mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))],[std(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end)  spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1p1_180mvpp_corr_tmaxms(end)], [ mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(end,:))],[ std(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_imode_vil_1p1_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','r','LineWidth',3);

%1p1 too much spikes -> discarded!
h(end+1)=errorbar([spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end)  spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end)], [ mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))],[ std(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))],'-o','Color','r','LineWidth',3);

%h(end+1)=errorbar([spike_rate_imode_vil_0p9_180mvpp_ilsb5_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_ilsb5_corr_tmaxms(end)], [mean(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:))],[std(svm_maxfold_imode_vil_0p9_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_ilsb5_hsize_242_corr_tmaxms(end,:)) ],'-o','Color','y','LineWidth',3);


% Text annotations for left-most and right-most points of the red line
text(spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end), mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)), '\tau = 13ms', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left','Color','r');
text(spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end), mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)), '\tau = 49ms', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center','Color','r');
text(spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end), mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)), '\tau = 203ms', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center','Color','r');
text(spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end),  mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:)), '\tau = 646ms', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left','Color','r');

xlabel('Spike Rate over 0.4ms period (Hz)')
ylabel('Classification Accuracy')
ylim([0.4 1])
set(gca,'XScale','log')
%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS LSB=600nA (hidden layer=242)','N-LCS LSB=10nA (hidden layer=242)')
lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12;  

set(gcf, 'Position', [100, 100, 800, 600]); saveas(gcf,['acc_vs_spikerate_180mvpp_corr.fig']); saveas(gcf,['acc_vs_spikerate_180mvpp_corr.png']);

%%
[~,i]=max([mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))])
mean_234=[mean(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))];
mean_234(i)
std_234=[std(svm_maxfold_vmode_N2b_180mvpp_hsize_234_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_234_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_234_corr_tmaxms(end,:))];
std_234(i)
sr_234=[spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)];
sr_234(i)

%%
[~,i]=max([mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))])
mean_242=[mean(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))];
mean_242(i)
std_242=[std(svm_maxfold_vmode_N2b_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_180mvpp_hsize_242_corr_tmaxms(end,:))];
std_242(i)
sr_242=[spike_rate_vmode_N2b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_180mvpp_corr_tmaxms(end)];
sr_242(i)

%%
[~,i]=max([mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))])
mean_OFFdcard=[mean(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))];
mean_OFFdcard(i)
std_OFFdcard=[std(svm_maxfold_vmode_N2b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFdcard_180mvpp_hsize_242_corr_tmaxms(end,:))];
std_OFFdcard(i)
sr_OFFdcard=[spike_rate_vmode_N2b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_180mvpp_corr_tmaxms(end)];
sr_OFFdcard(i)


%%

[~,i]=max([mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))])
mean_OFFmerg=[mean(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  mean(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))];
mean_OFFmerg(i)
std_OFFmerg=[std(svm_maxfold_vmode_N2b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))  std(svm_maxfold_vmode_N3b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N4b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_vmode_N5b_OFFmerg_180mvpp_hsize_242_corr_tmaxms(end,:))];
std_OFFmerg(i)
sr_OFFmerg=[spike_rate_vmode_N2b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N3b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_180mvpp_corr_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_180mvpp_corr_tmaxms(end)];
sr_OFFmerg(i)

%%
[~,i]=max([ mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))])
mean_imode=[ mean(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) mean(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))];
mean_imode(i)
std_imode=[std(svm_maxfold_imode_vil_0p8_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p85_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_0p9_180mvpp_hsize_242_corr_tmaxms(end,:)) std(svm_maxfold_imode_vil_1_180mvpp_hsize_242_corr_tmaxms(end,:))];
std_imode(i)
sr_imode=[spike_rate_imode_vil_0p8_180mvpp_corr_tmaxms(end)  spike_rate_imode_vil_0p85_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_0p9_180mvpp_corr_tmaxms(end) spike_rate_imode_vil_1_180mvpp_corr_tmaxms(end)];
sr_imode(i)