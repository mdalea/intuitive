close all
clear all
% tb_dpi_filt_mult (20sec sim) 
% ...tau.csv   ISLEW=100pA ISPK=10uA ISPKFAST=10uA 
% ...tau_2.csv ISLEW=100nA ISPK=100uA ISPKFAST=100uA -> tpw=3us target_time = 10;
% ...tau_3.csv ISLEW=500nA ISPK=500uA ISPKFAST=500uA -> tpw=643ns target_time = 30;
% ...tau_4.csv ISLEW=500nA ISPK=500uA ISPKFAST=500uA -> tpw=643ns
% target_time = 30 (50s sim time)
% ...tau_5.csv ISLEW=100nA ISPK=100uA ISPKFAST=100uA -> tpw=3us target_time
% = 30s (simtime=50s)


% minimum tau that can be measured limited by smallest tpw (largest ISLEW)
% but this also limits
%% PLOT COLORMAP OF delta_Ix vs I_spk and I_slew
vil_arr = logspace(log10(0.4), log10(1.2), 10);

baseName = 'Ix_tau'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data); % preserve precision

% Extract the time and ix columns
time_columns = 1:2:size(data, 2);
ix_columns = 2:2:size(data, 2);

time_values = data(:, time_columns);
ix_values = data(:, ix_columns);

baseName = 'cix_pulse_tau'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data);

% Extract the time and ix columns
cix_pulse_columns = 2:2:size(data, 2);
cix_pulse_values = data(:, cix_pulse_columns);

%-----
target_time = 10;
target_cix_pulse = 0.1%0.1;

for j=1:size(time_values,2)
    % Find the index where time_values is closest to the target time
    [~, init_time_index(j)] = min(abs(time_values(:,j) - target_time));
    
    % Get initial ix value
    ix_init(j) = ix_values(init_time_index(j), j);

    % Find ix value after step
    decreasing_indices = find(diff(cix_pulse_values(:,j)) < 0);  
    decreasing_indices = decreasing_indices(decreasing_indices > init_time_index(j));% start search from before step (discard previous falling edges)  

    % Initialize variables to store the minimum difference and index
    min_difference = inf;
    closest_index(j) = 0;
    
    % Iterate through decreasing indices and find the closest index
    for ii = 1:length(decreasing_indices)
        index = decreasing_indices(ii);
        difference = abs(cix_pulse_values(index,j) - target_cix_pulse);
        
        % Update minimum difference and closest index if needed
        if difference < min_difference
            min_difference = difference;
            closest_index(j) = index;
        end
    end

    if j>8
        t_factor=1.05
    else
        t_factor=1;
    end

    ix_step(j) = ix_values(round(closest_index(j)*t_factor),j) % skip samples with spiky delta-Ix
    delta_ix(j) = ix_step(j)-ix_init(j)


    final_time(j) = time_values(closest_index(j),j)

    tpw(j) = final_time(j)-target_time

    % find tau
    threshold(j) = (1 - exp(-1)) * delta_ix(j); % get tau threshold
    %[~,index_tau(j)] = min(abs(ix_values(:,j)-ix_init(j)-threshold(j)))
    [~,index_tau(j)] = min(abs(ix_values(round(closest_index(j)*t_factor):end,j)-ix_init(j)-threshold(j)))
    index_tau(j) = index_tau(j) + closest_index(j) - 1;
   
    tau_time(j) = time_values(index_tau(j),j)
    tau(j) = tau_time(j) - time_values(init_time_index(j), j)

end
%%
baseName = 'Ix_fast_tau_2'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data); % preserve precision

% Extract the time and ix columns
ix_fast_columns = 2:2:size(data, 2);
ix_fast_values = data(:, ix_fast_columns);

time_values = data(:, time_columns);
ix_values = data(:, ix_columns);

baseName = 'cix_pulse_tau_2'
data = csvread(['../PYVISA_measurements/sim_csv/',baseName,'.csv'],1,0);
%data = vpa(data);

% Extract the time and ix columns
cix_pulse_columns = 2:2:size(data, 2);
cix_pulse_values = data(:, cix_pulse_columns);

%-----
target_time = 10;
target_cix_pulse = 0.1%0.1;

for j=1:size(time_values,2)
    % Find the index where time_values is closest to the target time
    [~, init_time_index(j)] = min(abs(time_values(:,j) - target_time));
    
    % Get initial ix value
    ix_fast_init(j) = ix_fast_values(init_time_index(j), j);

    decreasing_indices = find(diff(cix_pulse_values(:,j)) < 0);
    decreasing_indices = decreasing_indices(decreasing_indices > init_time_index(j));
    
    % Initialize variables to store the minimum difference and index
    min_difference = inf;
    closest_index(j) = 0;
    
    % Iterate through decreasing indices and find the closest index
    for ii = 1:length(decreasing_indices)
        index = decreasing_indices(ii);
        difference = abs(cix_pulse_values(index,j) - target_cix_pulse);
        
        % Update minimum difference and closest index if needed
        if difference < min_difference
            min_difference = difference;
            closest_index(j) = index;
        end
    end
    ix_fast_step(j) = ix_fast_values(round(closest_index(j)*1.005),j)
    delta_ix_fast(j) = ix_fast_step(j)-ix_fast_init(j)

    final_time_fast(j) = time_values(closest_index(j),j)

    tpw_fast(j) = final_time_fast(j)-target_time

    % find tau
    threshold_fast(j) = (1 - exp(-1)) * delta_ix_fast(j); % get tau threshold
    %[~,index_tau(j)] = min(abs(ix_values(:,j)-ix_init(j)-threshold(j)))
    [~,index_fast_tau(j)] = min(abs(ix_fast_values(closest_index(j):end,j)-ix_fast_init(j)-threshold_fast(j)))
    index_fast_tau(j) = index_fast_tau(j) + closest_index(j) - 1;
   
    tau_fast_time(j) = time_values(index_fast_tau(j),j)
    tau_fast(j) = tau_fast_time(j) - time_values(init_time_index(j), j)


end

%% PLOT TAU
figure
%subplot(2,1,1)
h1=plot(vil_arr(5:8),tau(5:8),'-s');
hold on;
%plot(vil_arr(5:8),tau(1)*ones(1,4),':','Color','k');
%set(gca,'XScale','log');
set(gca,'YScale','log');
%xlabel('V_{L} (V)');
ylabel('\Delta I_{X} \tau (s)')
xlim([vil_arr(5) vil_arr(8)])
%text(vil_arr(5), 0.1*tau(1), ['t_{pw}=',num2str(round(1e3*tau(1),2)),'ms'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 6); % Adjust font size if needed

%subplot(2,1,2)
h2=plot(vil_arr(5:8),tau_fast(5:8),'-s','Color', [0.6350 0.0780 0.1840]);
hold on;
%plot(vil_arr(5:8),tau_fast(1)*ones(1,4),':','Color','k');
%set(gca,'XScale','log');
set(gca,'YScale','log');
xlabel('V_{L} (V)');
ylabel('\Delta I_{X} \tau (s)')
xlim([vil_arr(5) vil_arr(8)])
ylim([1e-6 40])
%text(vil_arr(4)*1.04, 3*tau_fast(1), ['t_{pw}=',num2str(round(1e6*tau_fast(1),2)),'\mus'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 6); % Adjust font size if needed

lgd=legend([h1 h2],'\tau_{slow}','\tau_{fast}','Location','best')

micasplot

% Change the font size of the added text
text_handle = findobj(gcf, 'Type', 'Text');   % Find the text object
set(text_handle, 'FontSize', 10);             % Change font size to 10
grid off
set(lgd,'FontSize',11)

% Set font size of x-axis tick labels
set(gca, 'FontSize', 10); % Adjust the font size as needed
set(gcf, 'Position', [100, 100, 200, 250]); saveas(gcf,[baseName,'-tau','.fig']); saveas(gcf,[baseName,'-tau','.png']);
