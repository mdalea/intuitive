%% Author: Mark Daniel Alea
% mark.alea@kuleuven.be
% 04/02/2023
% reads .bs2 files and reconstruct original signal
clear all

folderPath = pwd; % replace with path to dataset
runID = 'intuitivechip_classifier_lcsvsnlcs_teensy_run2'
ibias_set='ispk_50u_islew_1n'
vil_set='0p8'
vpp_set='180mvpp'
%name = 'IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_18mvpp_250mvofs_onedac_itail_50nA_ith_10n_ispk_50u_islew_1n_vil_0p8';
name = ['IMODE_allchannels_ALLCLASS_auto_nospkfilter_cleaned_1x8_',vpp_set,'_250mvofs_onedac_itail_50nA_ith_10n_',ibias_set,'_vil_',vil_set];
DEBUG=1;

k=1; % texture count
trial=1; % trial count
sample = trial+(k-1)*40; % choose which sample to plot
chunks=0;  % 0 if dataset without the -x
mr_cnt=8;
tduration=0.4 %0.4; % 0.4s for texture; 2s for vibration
period = 1.956000/2; % actual signal period is twice as long (including zero pads)

if ibias_set == "ispk_50u_islew_1n"
    delta_ix_step=634.65e-9; %simulated with ispk=50uA, islew=1nA
elseif ibias_set == "ispk_1p4u_islew_1n"
    delta_ix_step=9.28e-9; %simulated with ispk=1.4uA, islew=1nA
elseif ibias_set ==  "ispk_100n_islew_1n"
    delta_ix_step=340.17e-12; %simulated with ispk=100n, islew=1nA
elseif ibias_set ==  "ispk_5u_islew_0"
    delta_ix_step=1.426e-6; %simulated with ispk=5uA, islew=0
end    

if vil_set == "0p6"
    tau=245.5e-6; % for vil=0.6V
elseif vil_set == "0p7" 
    tau=2.89e-3; % for vil=0.7V
elseif vil_set == "0p8"  
    tau=32.875e-3; %simulated with vil=0.8V 
elseif vil_set == "0p85"
    tau=120.62e-3;
elseif vil_set == "0p875"
    tau=231.34e-3;
elseif vil_set == "0p9" 
    tau=496e-3; % for vil=0.9
elseif vil_set == "1"  
    tau=1.58; % for vil=1
elseif vil_set == "1p1"
    tau=1.638;
end    


tau = tau * (tduration/period); %-> scaled to reflect scaling of signal to tduration
Rv2i=0.96e6; % simulated with Vres=1.8V

if chunks==0
    append = '';
else
    append = ['-',num2str(chunks)];
end

filename = [folderPath,'/SENSOR_DATASETS/PROCESSED_SPIKES/',name,'/',num2str(sample),append,'.bs2']

TD = Read_Ndataset(filename);


% PLOT 1 sample out of the entire dataset (for debug)
figure
hold all;
for spikeCount = 1:length(TD.ts)
    if TD.p(spikeCount)==1  % ON spike
        %xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)
        %sig(xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+1,TD.ts) = sig(xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+1,TD.ts) + delta;
        plot([TD.ts(spikeCount)/1e3 TD.ts(spikeCount)/1e3], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k');
    else   % OFF spike
       %sig(xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+1,TD.ts) = sig(xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+1,TD.ts) - delta;       
       plot([TD.ts(spikeCount)/1e3 TD.ts(spikeCount)/1e3], ...
            [xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)-0.4 xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)+0.4], 'k','Color','red');
    end 
end

grid on
xlabel('Time (ms)');
ylabel('Taxel Number');
ylim([0 mr_cnt-1])
title('INTUITIVE spike output')

micasplot

  

%% retrieve original texture signals
% use as default
fs_stim = 200; % original signal frequency
tdelay = 100e-9; % intended loop delay (how often crossing can be detected)
stim_os = cast(1/(tdelay*fs_stim),'double');
stim_os = 6000;

mr_cnt=8 %12*16;
ch_cnt=8; % 8 of 16 VDAC channels
tex_cnt_orig=6;
tex_cnt=6;  % if <108, choose only a subset of the dataset for easier classification
trialcnt=10;  % how many trials per class to use
randtex=0;  % if 1 - select random tex_cnt from total classes
tex_dataset = ['Kylberg_filt_6_scan_actualdimscale_chip_',vpp_set,'_clipped'] %'Kylberg_filt_6_scan_actualdimscale'
spatialres=0.2; % mm, spatial resolution of the sensors (needed by read_texture)

    scanv=20; scandir=0;
    randtex_indices = randperm(tex_cnt_orig,tex_cnt)   % choose a random subset  

    folderPath = pwd;
    [stim] = read_textures([pwd,'/../../tactile_dataset/Kylberg-6'],tex_dataset,tex_cnt,trialcnt,randtex,randtex_indices,fs_stim,stim_os,mr_cnt,scanv,scandir,0,spatialres);   




%% reconstruct signal from spikes


if mr_cnt==192
     x_cnt=16; y_cnt=12;
else
    x_cnt=8; y_cnt=1;
end  

t=[0:1:tduration*1e6]; % 400ms; 1us period spacing
DT=1; %us unit, needed for tau formation
%sig = 0.25 + zeros(tex_cnt,trialcnt,mr_cnt,length(t)); % 1us sampling period to reflect spiketime resolution
sig = cell(tex_cnt,trialcnt);

if DEBUG==1
    tex_cnt=6; trialcnt=10;
end

% create delta-iX step with exponential decay
TempT = zeros(1,length(t));
delta_ix = zeros(1,length(t));
TempT(1) = 0;
delta_ix(1) = delta_ix_step;

tau_us=tau*1e6; %DT is in us, normalize tau to us
for i=2:length(t)
    TempT(i) = TempT(i-1)+DT;
    delta_ix(i) = delta_ix(i-1) - DT/tau_us * delta_ix(i-1);
end    

figure
plot(t,delta_ix)

%ISI = cell(tex_cnt,trialcnt,mr_cnt);
for k=1:tex_cnt
    for trial=1:trialcnt

        filename = [folderPath,'/SENSOR_DATASETS/PROCESSED_SPIKES/',name,'/',num2str(trial+(k-1)*40),append,'.bs2']
        TD = Read_Ndataset(filename);

        %initialize reconstructed signal to vofs=0.25V
        sig{k,trial} = zeros(mr_cnt,length(t));      

        for x=1:x_cnt
            for y=1:y_cnt

                 TD_t = [];
        
                % reconstruct PER taxel         
                TD_t.x = TD.x(TD.x==x-1 & TD.y==y-1);
                TD_t.y = TD.y(TD.x==x-1 & TD.y==y-1);
                TD_t.p = TD.p(TD.x==x-1 & TD.y==y-1);
                TD_t.ts = TD.ts(TD.x==x-1 & TD.y==y-1);
        
                TD_t.ts = TD_t.ts+1; % index starts at 1

                
                
                for spikeCount = 1:length(TD_t.ts)
%                     length(TD_t.ts)
                    if TD_t.p(spikeCount)==1  % ON spike
                        %xytolin_customxy(TD.x(spikeCount),TD.y(spikeCount),16)
                        sig{k,trial}(xytolin_customxy(TD_t.x(spikeCount),TD_t.y(spikeCount),16)+1,TD_t.ts(spikeCount):length(t)) = sig{k,trial}(xytolin_customxy(TD_t.x(spikeCount),TD_t.y(spikeCount),16)+1,TD_t.ts(spikeCount):length(t)) + delta_ix(1:size(sig{k,trial}(xytolin_customxy(TD_t.x(spikeCount),TD_t.y(spikeCount),16)+1,TD_t.ts(spikeCount):length(t)),2));
                    end 
                end


            end
        end

        ISI{k,trial} = diff(TD.ts);
        ISI_on{k,trial} = diff(TD.ts(TD.p==1));
        ISI_off{k,trial} = diff(TD.ts(TD.p==2));
        spikeCount_on(k,trial) = length(TD.p(TD.p==1));
        spikeCount_off(k,trial) = length(TD.p(TD.p==2));

        if DEBUG==1
            % PLOT sig of LAST sample
            figure
            %hold on;
            for i=1:mr_cnt
                subplot(y_cnt,x_cnt,i)
                plot(t,sig{k,trial}(i,:))
                maxsig(i)=max(sig{k,trial}(i,:));
                minsig(i)=min(sig{k,trial}(i,:));
            end
            
                voutpp=maxsig-minsig;        max(voutpp)

        end


        % PLOT orig and reconstruction signals
        if DEBUG==1
            figure
            hold on;
        
             for i=1:mr_cnt
                % find a common time scale
                t_common = [0:1e-6:max(max(t)/1e6,max(stim.t))];
                %sig_orig = interp1(stim.t,ofs + Av*vpp*((stim.tex_rs{k,trial}(i,:)/Rv2i - 127) / 256),t_common);
                sig_orig = interp1(stim.t,stim.tex_rs{k,trial}(i,:)/Rv2i,t_common);
                sig_rec = interp1(t/1e6,sig{k,trial}(i,:),t_common);
            
                % replace NaN with zero
                sig_orig(isnan(sig_orig)) = 0;
                sig_rec(isnan(sig_rec)) = 0;
            
                plot(t_common,sig_orig); plot(t_common, sig_rec);
            end    
        end

        % COMPUTE for SER, correlation, etc 
         for i=1:mr_cnt
            % find a common time scale
            t_common = [0:1e-6:max(max(t)/1e6,max(stim.t))];
            %sig_orig = interp1(stim.t,ofs + Av*vpp*((stim.tex_rs{k,trial}(i,:)/Rv2i - 127) / 256),t_common);
            sig_orig = interp1(stim.t,stim.tex_rs{k,trial}(i,:)/Rv2i,t_common);
            sig_rec = interp1(t/1e6,sig{k,trial}(i,:),t_common);
        
            % replace NaN with zero
            sig_orig(isnan(sig_orig)) = 0;
            sig_rec(isnan(sig_rec)) = 0;
        
            error = sig_orig - sig_rec;
            rms_error = sqrt(mean(error.^2));
        
            ser(k,trial,i) = sig_orig.^2 / error.^2;
            ser_db(k,trial,i) = 20*log10(ser(i));
            %cc = xcorr(sig_orig, sig_rec);
            %correlation_coefficient(k,trial,i) = max(cc);
%             [correlation,~] = xcorr(sig_orig,sig_rec);
%             correlation_coefficient(k,trial,i) = max(correlation) / (sqrt(sum(sig_orig.^2)) * sqrt(sum(sig_rec.^2)));
            [correlation,~] = xcorr(sig_orig,sig_rec,'coeff');
            %correlation_coefficient(k,trial,i) = max(correlation) / (sqrt(sum(sig_orig.^2)) * sqrt(sum(sig_rec.^2)));
            correlation_coefficient(k,trial,i) = max(correlation);

            %plot(t_common,sig_orig); plot(t_common, sig_rec);
        end    

    end
end    



%% PLOT ISI per class
figure;

% for k=1:tex_cnt
%      for trial=1:trialcnt
%         subplot(tex_cnt,1,k);
%         histogram(ISI{k,trial},1000);
%         hold on;
%     end
% end

figure;
hold on;
for trial=1:trialcnt
    scatter(mean(ISI_on{1,trial}),mean(ISI_off{1,trial}),'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','r');
end

for trial=1:trialcnt
    scatter(mean(ISI_on{2,trial}),mean(ISI_off{2,trial}),'Marker','o','MarkerEdgeColor','g','MarkerFaceColor','g');
end

for trial=1:trialcnt
    scatter(mean(ISI_on{3,trial}),mean(ISI_off{3,trial}),'Marker','o','MarkerEdgeColor','b','MarkerFaceColor','b');
end

for trial=1:trialcnt
    scatter(mean(ISI_on{4,trial}),mean(ISI_off{4,trial}),'Marker','o','MarkerEdgeColor','y','MarkerFaceColor','y');
end

for trial=1:trialcnt
    scatter(mean(ISI_on{5,trial}),mean(ISI_off{5,trial}),'Marker','o','MarkerEdgeColor','cyan','MarkerFaceColor','cyan');
end

for trial=1:trialcnt
    scatter(mean(ISI_on{6,trial}),mean(ISI_off{6,trial}),'Marker','o','MarkerEdgeColor','magenta','MarkerFaceColor','magenta');
end

title('Scatter - ISI ON vs ISI OFF')
xlabel('ISI ON'); ylabel('ISI OFF')
%% PLOT spikecount (ON and OFF)

figure;
hold on;
for trial=1:trialcnt
    scatter(spikeCount_on(1,trial),spikeCount_off(1,trial),'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','r');
end

for trial=1:trialcnt
    scatter(spikeCount_on(2,trial),spikeCount_off(2,trial),'Marker','o','MarkerEdgeColor','g','MarkerFaceColor','g');
end

for trial=1:trialcnt
    scatter(spikeCount_on(3,trial),spikeCount_off(3,trial),'Marker','o','MarkerEdgeColor','b','MarkerFaceColor','b');
end

for trial=1:trialcnt
    scatter(spikeCount_on(4,trial),spikeCount_off(4,trial),'Marker','o','MarkerEdgeColor','y','MarkerFaceColor','y');
end

for trial=1:trialcnt
    scatter(spikeCount_on(5,trial),spikeCount_off(5,trial),'Marker','o','MarkerEdgeColor','cyan','MarkerFaceColor','cyan');
end

for trial=1:trialcnt
    scatter(spikeCount_on(6,trial),spikeCount_off(6,trial),'Marker','o','MarkerEdgeColor','magenta','MarkerFaceColor','magenta');
end

title('Scatter - Spike Count ON vs Spike Count OFF')
xlabel('Spike Count ON'); ylabel('Spike Count OFF')

% %%
% figure
% plot(spikeCount_on)
% 
% figure
% plot(spikeCount_off)

% %%
% figure
% hold on;
% for k=1:tex_cnt
%     for trial=1:trialcnt
%         scatter(trial+(k-1)*10,mean(ISI_on{k,trial}))
%     end
% end   
% 
% figure
% hold on;
% for k=1:tex_cnt
%     for trial=1:trialcnt
%         scatter(trial+(k-1)*10,mean(ISI_off{k,trial}))
%     end
% end  
% 
% figure
% hold on;
% for k=1:tex_cnt
%     for trial=1:trialcnt
%         scatter(trial+(k-1)*10,mean(ISI{k,trial}))
%     end
% end  
%% COMPUTE CROSS-CORRELATION BETWEEN TRIALS OF THE SAME CLASS

for k=1:tex_cnt
    for trial=1:trialcnt
        for trial2=1:trialcnt
            [correlation,~] = xcorr(sig{k,trial}(:),sig{k,trial2}(:),'coeff');
            crossCorMat(k,trial,trial2) = max(correlation);
        end
    end
end



%% COMPUTE CROSS-CORRELATION BETWEEN TRIALS OF THE SAME CLASS

for k=1:tex_cnt
    for trial=1:trialcnt
        for trial2=1:trialcnt
            [correlation,~] = xcorr(stim.tex_rs{k,trial}(:),stim.tex_rs{k,trial2}(:),'coeff');
            crossCorMat_orig(k,trial,trial2) = max(correlation);
        end
    end
end

figure
subplot(3,1,1)
heatmap(mean(crossCorMat_orig,3))
colormap(jet(512))   

subplot(3,1,2)
heatmap(mean(crossCorMat,3))
colormap(jet(512))   

subplot(3,1,3)
heatmap(mean(crossCorMat_orig,3)-mean(crossCorMat,3))
colormap(jet(512))   
title('Difference xcorr (orig - reconstructed')

cosine_sim = dot(crossCorMat_orig(:),crossCorMat(:)) / (norm(crossCorMat_orig,'fro') * norm(crossCorMat,'fro')) 

[correlation_ception,~] = xcorr(crossCorMat_orig(:),crossCorMat(:),'coeff');
correlation_ception_coefficient = max(correlation_ception);

%% PERFORM SVM CLASSIFICATION BASED ON MEAN ISI
X_train=[]; Y_train=[];
X_test=[]; Y_test=[];

i=0;
for k=1:tex_cnt
    for trial=1:floor(0.7*trialcnt)
        i=i+1;
        X_train = [X_train; mean(ISI{k,trial})];
        Y_train = [Y_train; k];
    end
end

i=0;
for k=1:tex_cnt
    for trial=floor(0.7*trialcnt)+1:trialcnt
        i=i+1;
        X_test = [X_test; mean(ISI{k,trial})];
        Y_test = [Y_test; k];
    end
end

%Train SVM
svm_model = fitcecoc(X_train,Y_train);
%svm_model = fitcecoc(X_train,Y_train,'Learners',templateSVM('KernelFunction','RBF'));

%Test
predicted_labels = predict(svm_model, X_test);

%Classification accuracy
accuracy = sum(predicted_labels == Y_test) / numel(Y_test) 
disp(['ISI accuracy: ',num2str(accuracy)])
%% PERFORM SVM CLASSIFICATION BASED ON MEAN ISI ON
X_train=[]; Y_train=[];
X_test=[]; Y_test=[];

i=0;
for k=1:tex_cnt
    for trial=1:floor(0.7*trialcnt)
        i=i+1;
        X_train = [X_train; mean(ISI_on{k,trial})];
        Y_train = [Y_train; k];
    end
end

i=0;
for k=1:tex_cnt
    for trial=floor(0.7*trialcnt)+1:trialcnt
        i=i+1;
        X_test = [X_test; mean(ISI_on{k,trial})];
        Y_test = [Y_test; k];
    end
end

%Train SVM
svm_model = fitcecoc(X_train,Y_train);
%svm_model = fitcecoc(X_train,Y_train,'Learners',templateSVM('KernelFunction','RBF'));

%Test
predicted_labels = predict(svm_model, X_test);

%Classification accuracy
accuracy = sum(predicted_labels == Y_test) / numel(Y_test) 
disp(['ISI on accuracy: ',num2str(accuracy)])

%% PERFORM SVM CLASSIFICATION BASED ON MEAN CROSS-CORRELATION PER TRIAL
X_train=[]; Y_train=[];
X_test=[]; Y_test=[];

mean_crossCorMat = mean(crossCorMat,3)
i=0;
for k=1:tex_cnt
    for trial=1:floor(0.7*trialcnt)
        i=i+1;
        X_train = [X_train; mean_crossCorMat(k,trial)];
        Y_train = [Y_train; k];
    end
end

i=0;
for k=1:tex_cnt
    for trial=floor(0.7*trialcnt)+1:trialcnt
        i=i+1;
        X_test = [X_test; mean_crossCorMat(k,trial)];
        Y_test = [Y_test; k];
    end
end

%Train SVM
svm_model = fitcecoc(X_train,Y_train);
%svm_model = fitcecoc(X_train,Y_train,'Learners',templateSVM('KernelFunction','RBF'));

%Test
predicted_labels = predict(svm_model, X_test);

%Classification accuracy
accuracy = sum(predicted_labels == Y_test) / numel(Y_test) 
disp(['xcorr accuracy: ',num2str(accuracy)])

%% OTHER RESULTS
mean_ser=mean(mean(mean(ser)))
mean_db=20*log10(mean(mean(mean(ser))))
mean_correlation_coefficient=mean(mean(mean(correlation_coefficient)))

cosine_sim = dot(crossCorMat_orig(:),crossCorMat(:)) / (norm(crossCorMat_orig,'fro') * norm(crossCorMat,'fro')) 

[correlation_ception,~] = xcorr(crossCorMat_orig(:),crossCorMat(:),'coeff');
correlation_ception_coefficient = max(correlation_ception)
