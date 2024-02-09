close all

%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
h=[];

%VMODE
% take only last tmaxms (400ms)
h(end+1)=scatter(spike_rate_vmode_N3b_tmaxms(end), results_max_vmode_N3b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N4b_tmaxms(end), results_max_vmode_N4b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N5b_tmaxms(end), results_max_vmode_N5b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N3b_tmaxms(end), results_max_vmode_N3b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N4b_tmaxms(end), results_max_vmode_N4b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N5b_tmaxms(end), results_max_vmode_N5b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N3b_OFFdcard_tmaxms(end), results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N4b_OFFdcard_tmaxms(end), results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N5b_OFFdcard_tmaxms(end), results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N3b_OFFmerg_tmaxms(end), results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_vmode_N4b_OFFmerg_tmaxms(end), results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_vmode_N5b_OFFmerg_tmaxms(end), results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_imode_vil_0p7_tmaxms(end), results_max_imode_vil_0p7_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p8_tmaxms(end), results_max_imode_vil_0p8_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p875_tmaxms(end), results_max_imode_vil_0p875_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p9_tmaxms(end), results_max_imode_vil_0p9_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '.', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p925_tmaxms(end), results_max_imode_vil_0p925_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'x', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end), results_max_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y');

h(end+1)=scatter(spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end), results_max_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y');



lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242','N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.7V (hidden layer=242','vil=0.8V (hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.7V N=5b (hidden layer=242','vil=0.8V N=5b (hidden layer=242')
lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
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

%VMODE
% take only last tmaxms (400ms)
h(end+1)=scatter(spike_rate_vmode_N3b_tmaxms(end), results_linear_maxfold_vmode_N3b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N4b_tmaxms(end), results_linear_maxfold_vmode_N4b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N5b_tmaxms(end), results_linear_maxfold_vmode_N5b_hsize_234_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');

h(end+1)=scatter(spike_rate_vmode_N3b_tmaxms(end), results_linear_maxfold_vmode_N3b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N4b_tmaxms(end), results_linear_maxfold_vmode_N4b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N5b_tmaxms(end), results_linear_maxfold_vmode_N5b_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g');

h(end+1)=scatter(spike_rate_vmode_N3b_OFFdcard_tmaxms(end), results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N4b_OFFdcard_tmaxms(end), results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N5b_OFFdcard_tmaxms(end), results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'cyan', 'MarkerEdgeColor', 'cyan');

h(end+1)=scatter(spike_rate_vmode_N3b_OFFmerg_tmaxms(end), results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_vmode_N4b_OFFmerg_tmaxms(end), results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_vmode_N5b_OFFmerg_tmaxms(end), results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'magenta', 'MarkerEdgeColor', 'magenta');

h(end+1)=scatter(spike_rate_imode_vil_0p7_tmaxms(end), results_linear_maxfold_imode_vil_0p7_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p8_tmaxms(end), results_linear_maxfold_imode_vil_0p8_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p875_tmaxms(end), results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '*', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p9_tmaxms(end), results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '.', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p925_tmaxms(end), results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'x', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');

h(end+1)=scatter(spike_rate_imode_vil_0p7_ith_9p375n_ispike_100n_tmaxms(end), results_linear_maxfold_imode_vil_0p7_ith_9p375n_ispike_100n_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', 'o', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y');

h(end+1)=scatter(spike_rate_imode_vil_0p8_ith_9p375n_ispike_100n_tmaxms(end), results_linear_maxfold_imode_vil_0p8_ith_9p375n_ispike_100n_hsize_242_tmaxms_arr(end), 100, 'filled', 'Marker', '+', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y');

lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242','N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.7V (hidden layer=242','vil=0.8V (hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.7V N=5b (hidden layer=242','vil=0.8V N=5b (hidden layer=242')

lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 8;  