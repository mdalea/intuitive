
%%===== PLOT SNN========
figure
hold on;

%--- Ts plot ----
tmaxms_arr = 1e3*[100e-3 200e-3 300e-3 400e-3]; %s

%VMODE
h(1) = errorbar(tmaxms_arr, results_max_vmode_N3b_hsize_234_tmaxms_arr, [std(results_max_vmode_N3b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N3b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

%h(2) = errorbar(tmaxms_arr, results_max_vmode_N4b_hsize_234_tmaxms_arr, [std(results_max_vmode_N4b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N4b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

%h(3) = errorbar(tmaxms_arr, results_max_vmode_N5b_hsize_234_tmaxms_arr, [std(results_max_vmode_N5b_hsize_234_tmaxms(1,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(2,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(3,:)) std(results_max_vmode_N5b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

%VMODE (larger hidden layer)
%h(4) = errorbar(tmaxms_arr, results_max_vmode_N3b_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(5) = errorbar(tmaxms_arr, results_max_vmode_N4b_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(6) = errorbar(tmaxms_arr, results_max_vmode_N5b_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%VMODE (OFF discarded)
h(7) = errorbar(tmaxms_arr, results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(8) = errorbar(tmaxms_arr, results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(9) = errorbar(tmaxms_arr, results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%VMODE (OFF merged as ON)
h(10) = errorbar(tmaxms_arr, results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(11) = errorbar(tmaxms_arr, results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(12) = errorbar(tmaxms_arr, results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr, [std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_max_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%IMODE
h(13) = errorbar(tmaxms_arr, results_max_imode_vil_0p875_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p875_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p875_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

h(14) = errorbar(tmaxms_arr, results_max_imode_vil_0p9_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p9_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p9_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

h(15) = errorbar(tmaxms_arr, results_max_imode_vil_0p925_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p925_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p925_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%IMODE (FAST)

%h(16) = errorbar(tmaxms_arr, results_max_imode_vil_0p875_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(17) = errorbar(tmaxms_arr, results_max_imode_vil_0p9_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

%h(18) = errorbar(tmaxms_arr, results_max_imode_vil_0p925_fast_hsize_242_tmaxms_arr, [std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) std(results_max_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 



%set(gca,'XScale','log');
xlabel('Time window (ms)')
ylabel('Classification Accuracy (6 k-folds)')

%lgd = legend(h,['N=3b (hidden layer=234'],['N=4b (hidden layer=234'],['N=5b (hidden layer=234'],['N=3b (hidden layer=242'],['N=4b (hidden layer=242'],['N=5b (hidden layer=242'],['N=3b (OFF discarded; hidden layer=242'], ['N=4b (OFF discarded; hidden layer=242'],['N=5b (OFF discarded; hidden layer=242'],['N=3b (OFF merged; hidden layer=242'],['N=4b (OFF merged; hidden layer=242'],['N=5b (OFF merged; hidden layer=242'],['vil=0.875V (hidden layer=242'],['vil=0.9V (hidden layer=242'],['vil=0.925V (hidden layer=242'],['vil=0.875V FAST (hidden layer=242'],['vil=0.9V FAST (hidden layer=242'],['vil=0.925V FAST (hidden layer=242'])
%lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242', 'N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.875V FAST (hidden layer=242','vil=0.9V FAST (hidden layer=242','vil=0.925V FAST (hidden layer=242')
lgd = legend('N=3b (hidden layer=234','N=3b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242')

lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%h(1:end).MarkerSize = 8;

%h(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

%set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['-tmaxms_sweep-snn','.fig']); saveas(gcf,['tmaxms_sweep-snn','.png']);

hold off;
%% === PLOT SVM results ====
figure
hold on;
p(1) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(2) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(3) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_hsize_234_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_hsize_234_tmaxms(4,:))],'->','LineWidth',3); 

p(4) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(5) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(6) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(7) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(8) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(9) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_OFFdcard_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(10) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N3b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(11) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N4b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(12) = errorbar(tmaxms_arr, results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms_arr, [std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_vmode_N5b_OFFmerg_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(13) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p875_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(14) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p9_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(15) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p925_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(16) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p875_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(17) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p9_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 

p(18) = errorbar(tmaxms_arr, results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms_arr, [std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(1,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(2,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(3,:)) std(results_linear_maxfold_imode_vil_0p925_fast_hsize_242_tmaxms(4,:))],'->','LineWidth',3); 


%set(gca,'XScale','log');
xlabel('Time window (ms)')
ylabel('Classification Accuracy (6 k-folds)')

%lgd = legend(h,['N=3b (hidden layer=234'],['N=4b (hidden layer=234'],['N=5b (hidden layer=234'],['N=3b (hidden layer=242'],['N=4b (hidden layer=242'],['N=5b (hidden layer=242'],['N=3b (OFF discarded; hidden layer=242'], ['N=4b (OFF discarded; hidden layer=242'],['N=5b (OFF discarded; hidden layer=242'],['N=3b (OFF merged; hidden layer=242'],['N=4b (OFF merged; hidden layer=242'],['N=5b (OFF merged; hidden layer=242'],['vil=0.875V (hidden layer=242'],['vil=0.9V (hidden layer=242'],['vil=0.925V (hidden layer=242'],['vil=0.875V FAST (hidden layer=242'],['vil=0.9V FAST (hidden layer=242'],['vil=0.925V FAST (hidden layer=242'])
lgd = legend('N=3b (hidden layer=234','N=4b (hidden layer=234','N=5b (hidden layer=234','N=3b (hidden layer=242','N=4b (hidden layer=242','N=5b (hidden layer=242','N=3b (OFF discarded; hidden layer=242', 'N=4b (OFF discarded; hidden layer=242','N=5b (OFF discarded; hidden layer=242','N=3b (OFF merged; hidden layer=242','N=4b (OFF merged; hidden layer=242','N=5b (OFF merged; hidden layer=242','vil=0.875V (hidden layer=242','vil=0.9V (hidden layer=242','vil=0.925V (hidden layer=242','vil=0.875V FAST (hidden layer=242','vil=0.9V FAST (hidden layer=242','vil=0.925V FAST (hidden layer=242')
lgd.Location = 'Best';
%xlim([0.5*tmaxms_arr(1) 2*tmaxms_arr(5)])
grid on
micasplot; set(findall(gcf,'-property','FontSize'),'FontSize',12)
%p(1:end).MarkerSize = 8;

%p(1:end).LineWidth = 3;

set(findall(gcf,'-property','FontSize'),'FontSize',12)
lgd.FontSize = 12; 

%set(gcf, 'Position', [100, 100, 800, 400]); saveas(gcf,['-tmaxms_sweep-svm','.fig']); saveas(gcf,['tmaxms_sweep-svm','.png']);
