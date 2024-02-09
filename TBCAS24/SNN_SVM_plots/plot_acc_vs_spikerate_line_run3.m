close all

%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
h=[];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N3b_tmaxms(end) spike_rate_vmode_N4b_tmaxms(end) spike_rate_vmode_N5b_tmaxms(end)], [mean(results_max_vmode_N3b_hsize_234_tmaxms(end,:)) mean(results_max_vmode_N4b_hsize_234_tmaxms(end,:)) mean(results_max_vmode_N5b_hsize_234_tmaxms(end,:))],[std(results_max_vmode_N3b_hsize_234_tmaxms(end,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(end,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

% h(end+1)=errorbar([spike_rate_vmode_N3b_tmaxms(end) spike_rate_vmode_N4b_tmaxms(end) spike_rate_vmode_N5b_tmaxms(end)], [mean(results_max_vmode_N3b_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N4b_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N5b_hsize_242_tmaxms(end,:))],[std(results_max_vmode_N3b_hsize_242_tmaxms(end,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(end,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(end,:))],'-o','Color','g','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N3b_OFFdcard_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_tmaxms(end)], [mean(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(end,:))],[std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(end,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(end,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N3b_OFFmerg_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_tmaxms(end)], [mean(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(end,:)) mean(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(end,:))],[std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(end,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(end,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

% h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p7_tmaxms(end) spike_rate_imode_vil_0p8_tmaxms(end) spike_rate_imode_vil_0p875_tmaxms(end) spike_rate_imode_vil_0p9_tmaxms(end) spike_rate_imode_vil_0p925_tmaxms(end)], [ mean(results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p7_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p8_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p875_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p9_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p925_hsize_242_tmaxms(end,:))],[ std(results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p8_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(end,:))],'-o','Color','r','LineWidth',3);

h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p7_tmaxms(end) spike_rate_imode_vil_0p875_tmaxms(end) spike_rate_imode_vil_0p9_tmaxms(end)], [ mean(results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p7_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p875_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p9_hsize_242_tmaxms(end,:))],[ std(results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(end,:))],'-o','Color','r','LineWidth',3);


%h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end)], [mean(results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:))],[std(results_max_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(results_max_imode_vil_0p8_hsize_242_tmaxms(end,:))],'-o','Color','y','LineWidth',3);



%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)')

lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
xlabel('Spike Rate (Hz)')
ylabel('SNN classification accuracy')

grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12;  

hold off;

%%===== PLOT SVM========
figure
hold on;

%--- Ts plot ----
h=[];


% take only last tmaxms (400ms)
h(end+1)=errorbar([spike_rate_vmode_N3b_tmaxms(end) spike_rate_vmode_N4b_tmaxms(end) spike_rate_vmode_N5b_tmaxms(end)], [mean(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(end,:))],[std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(end,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(end,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(end,:))],'-o','Color','b','LineWidth',3);

% h(end+1)=errorbar([spike_rate_vmode_N3b_tmaxms(end) spike_rate_vmode_N4b_tmaxms(end) spike_rate_vmode_N5b_tmaxms(end)], [mean(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(end,:))],[std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(end,:))],'-o','Color','g','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N3b_OFFdcard_tmaxms(end) spike_rate_vmode_N4b_OFFdcard_tmaxms(end) spike_rate_vmode_N5b_OFFdcard_tmaxms(end)], [mean(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(end,:))],[std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(end,:))],'-o','Color','cyan','LineWidth',3);

h(end+1)=errorbar([spike_rate_vmode_N3b_OFFmerg_tmaxms(end) spike_rate_vmode_N4b_OFFmerg_tmaxms(end) spike_rate_vmode_N5b_OFFmerg_tmaxms(end)], [mean(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(end,:))],[std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(end,:))],'-o','Color','magenta','LineWidth',3);

h(end+1)=errorbar([spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end) spike_rate_imode_vil_0p7_tmaxms(end) spike_rate_imode_vil_0p875_tmaxms(end) spike_rate_imode_vil_0p9_tmaxms(end)], [ mean(results_linear_maxfold_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_imode_vil_0p7_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(end,:)) mean(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(end,:))],[ std(results_linear_maxfold_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_imode_vil_0p7_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(end,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(end,:))],'-o','Color','r','LineWidth',3);



%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)','N-LCS N=5b equivalent (hidden layer=242)')
%lgd = legend('LCS (hidden layer=234)','LCS (hidden layer=242)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)')
lgd = legend('LCS (hidden layer=234)','LCS discarded OFF spikes (hidden layer=242)','LCS merged OFF spikes (hidden layer=242)','N-LCS (hidden layer=242)')

lgd.Location = 'Best';
%xlim([0.5*tmaxms(1) 2*tmaxms(5)])
xlabel('Spike Rate (Hz)')
ylabel('SVM classification accuracy')

grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12;  