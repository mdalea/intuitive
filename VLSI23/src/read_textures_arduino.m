%% Reduced version - for Kylberg texture only -> for automated dataset collection
function [stim] = read_textures_arduino(file_loc,dataset,tex_cnt,trialcnt,randtex,randtex_indices,fs_stim,stim_os,mr_cnt,scanv,scandir,exp_tf,spatialres)



if dataset == "Kylberg_filt_6"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    fs_stim=10e3; % assumption
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = imread([dataset_dir,Files(trial+2).name]);
           rs = rs(1:sqrt(mr_cnt),1:sqrt(mr_cnt));  % get mr_Cnt number of pixels == taxels5
           L = tsamples;  % assume all recording lengths are uniform
           t = (0:L-1)*(1/(fs_stim)); % time vector
           t50 = 0.1; % time at 50% rise time
           Tr = 0.1; % risetime
           for h=1:mr_cnt
               disp(['--->Filling receptors # ',num2str(h)]);
               %rs_step(h,:) = [zeros(1,tsamples/4) double(rs(h))*ones(1,tsamples/2) zeros(1,tsamples/4)];  % populate heminodes with step signal with each maximum value equivalent to the pixel value
               rs_step(h,:) =  double(rs(h))./(1+exp(-4*(t-t50)/Tr));               
               %% FILTER

               %[rs_step(h,:),~] = lsim(step_lpf,rs_step(h,:),t); % apply LPF to non-idealize the steps
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_step(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = tsamples; % le

elseif dataset == "Kylberg_filt_6_with_rotations"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    fs_stim=10e3; % assumption
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    
    tex_name = {'canvas1', 'cushion1', ...
              'linseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'-with-rotations/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = imread([dataset_dir,Files(trial+2).name]);
           rs = rs(1:sqrt(mr_cnt),1:sqrt(mr_cnt));  % get mr_Cnt number of pixels == taxels5
           L = tsamples;  % assume all recording lengths are uniform
           t = (0:L-1)*(1/(fs_stim)); % time vector
           t50 = 0.1; % time at 50% rise time
           Tr = 0.1; % risetime
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_step(h,:) = [zeros(1,tsamples/4) double(rs(h))*ones(1,tsamples/2) zeros(1,tsamples/4)];  % populate heminodes with step signal with each maximum value equivalent to the pixel value
               rs_step(h,:) =  double(rs(h))./(1+exp(-4*(t-t50)/Tr));               
               %% FILTER

               %[rs_step(h,:),~] = lsim(step_lpf,rs_step(h,:),t); % apply LPF to non-idealize the steps
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_step(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = tsamples; % le


elseif dataset == "Kylberg_filt_6_scan"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    fs_stim=10e3;
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling
    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_rs(h,:) = resample(rs_scan(h,:),stim_os*length(rs_scan(h,:)),length(rs_scan(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array %tsamples; % le    

elseif dataset == "Kylberg_filt_6_scan_actualdim"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    texsize=26; %mm, based on the linseed size haha
    fs_stim=10e3; %smaller to reduce memory usage
    texcnt = 6;
    tlength = 0.4; % duration of scanning (assumed)
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    spatialres_orig=texsize/origx;
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling

    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_ds(h,:) = downsample(rs_scan(h,:),round(spatialres/spatialres_orig));  % downsample based on actual spatial res             
               rs_scan_rs(h,:) = resample(rs_scan_ds(h,:),stim_os*round(spatialres/spatialres_orig)*length(rs_scan_ds(h,:)),length(rs_scan_ds(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array
elseif dataset == "Kylberg_filt_6_scan"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    fs_stim=10e3;
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling
    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_rs(h,:) = resample(rs_scan(h,:),stim_os*length(rs_scan(h,:)),length(rs_scan(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array %tsamples; % le    

elseif dataset == "Kylberg_filt_6_scan_actualdimscale"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    texsize=26; %mm, based on the linseed size haha
    fs_stim=2.5e3; %smaller to reduce memory usage
    texcnt = 6;
    tlength = 0.4; % duration of scanning (assumed)
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    spatialres_orig=texsize/origx;
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling

    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1e3 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=1;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               %[x,y] = linto2D(h,mr_cnt);
               xdim=16; ydim=12;
               [x,y] = linto2D_customxy(h,xdim,ydim);  % reflect actual chip sensors
               %rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan(h,:) = rs(x:x+origx-xdim,y);   % reflect actual chip sensors
               rs_scan_ds(h,:) = downsample(rs_scan(h,:),round(spatialres/spatialres_orig));  % downsample based on actual spatial res             
               rs_scan_rs(h,:) = resample(rs_scan_ds(h,:),stim_os*round(spatialres/spatialres_orig)*length(rs_scan_ds(h,:)),length(rs_scan_ds(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               %tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
               tex_rs{k,trial}(h,:) = abs(round(tex_rs{k,trial}(h,:))); % no normalization, keep 8bit uint value
               %tex_rs{k,trial}(h,:) = 0.25 + 0.01*(tex_rs{k,trial}(h,:)-2^7)/(2^8);  % shift common mode to 0, then normalize 8bit pixel value to 10mVpp
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array

elseif dataset == "Kylberg_filt_6_scan_oversampled20x_actualdimscale"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    texsize=26; %mm, based on the linseed size haha
    fs_stim=10e3; %smaller to reduce memory usage
    texcnt = 6;
    tlength = 0.4; % duration of scanning (assumed)
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    spatialres_orig=texsize/origx;
    stim_os=20*round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling

    
    tex_name = {'canvas1', 'cushion1', ...
              'linsseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1e3 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=1;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_ds(h,:) = downsample(rs_scan(h,:),round(spatialres/spatialres_orig));  % downsample based on actual spatial res             
               rs_scan_rs(h,:) = resample(rs_scan_ds(h,:),stim_os*round(spatialres/spatialres_orig)*length(rs_scan_ds(h,:)),length(rs_scan_ds(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/(fs_stim*20)); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array


elseif dataset == "Kylberg_filt_6_with_rotations_scan"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    fs_stim=10e3; %smaller to reduce memory usage
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling
    
    tex_name = {'canvas1', 'cushion1', ...
              'linseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'-with-rotations/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_rs(h,:) = resample(rs_scan(h,:),stim_os*length(rs_scan(h,:)),length(rs_scan(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %just make it long enough before chunkification for fill_array 


elseif dataset == "Kylberg_filt_6_with_rotations_scan_actualdim"
    %% from Kylberg dataset - https://kylberg.org/kylberg-texture-dataset-v-1-0/
    % converted PNG image data to a pseudo-texture indendation
    % 576 x 576 pixels -> assume 0.2mm per pixel, total area = 115.2mm
    % (area makes sense when comparing with size of lins seeds)

    texsize=26; %mm, based on the linseed size haha
    fs_stim=10e3; %smaller to reduce memory usage
    texcnt = 6;
    tlength = 0.4; % assumption
    tsamples = tlength*fs_stim;   % number of samples across tlength
    origx=576; origy=576; % no. of pixels on orig texture
    spatialres_orig=texsize/origx;
    stim_os=round(tsamples/origx); % resample sequence of pixel value to have approx, fs_stim sampling
    
    tex_name = {'canvas1', 'cushion1', ...
              'linseeds1','sand1', 'seat2', ...
              'stone1', ...
              };
 
    if randtex==1      
        tex_name = tex_name(randtex_indices); % choose a random subset
    else
        tex_name = tex_name(1:tex_cnt); % choose a subset of the dataset if tex_cnt < 108
    end

    %% SETUP SIGNAL FILTER TO EMULATE POSFET RESPONSE
    %pos_filt = tf([1 0],[1 7]);  % based on Dahiya paper IEEESensors2011
    %step_lpf = tf(3,[1,2,3]); %tf([1],[1 2e3 1e3^2]);  % 2 pole @ 1kHz
    pos_filt = tf([1 0],[1 1007 7e3]);  % based on Dahiya paper IEEESensors2011, add pole at 1kHz to model limited POSFET BW
    Av=100;  % gain (small signal due to HPF on step)
    
    for k = 1:numel(tex_name)
       dataset_dir = [file_loc,'/',tex_name{k},'-with-rotations/']
       Files=dir([dataset_dir]);
       for trial=1:trialcnt
           %Files.name
           %Files(trial).name
           disp(['Reading stimulus # ',num2str(k),': ',tex_name{k},'/',Files(trial+2).name]);
           rs = double(imread([dataset_dir,Files(trial+2).name]));
           for h=1:mr_cnt
               %disp(['--->Filling receptors # ',num2str(h)]);
               %rs_scan(h,:) = rs(h:h+origx-sqrt(mr_cnt));
               [x,y] = linto2D(h,mr_cnt);
               rs_scan(h,:) = rs(x:x+origx-sqrt(mr_cnt),y);
               rs_scan_ds(h,:) = downsample(rs_scan(h,:),round(spatialres/spatialres_orig));  % downsample based on actual spatial res
               rs_scan_rs(h,:) = resample(rs_scan_ds(h,:),stim_os*round(spatialres/spatialres_orig)*length(rs_scan_ds(h,:)),length(rs_scan_ds(h,:)));
               %% FILTER

               L = length(rs_scan_rs(h,:));  % assume all recording lengths are uniform
               t = (0:L-1)*(1/(fs_stim*stim_os)); % time vector
               [rs_step_filt(h,:),~] = lsim(pos_filt,rs_scan_rs(h,:),t);             
               tex_rs{k,trial}(h,:) = Av*rs_step_filt(h,:);  
               %tex_rs{k,trial}(h,:) = rs_step(h,:);  
               tex_rs{k,trial}(h,:) = tex_rs{k,trial}(h,:)/(2^8);  % normalize 8bit pixel value to 1
           end     
       end
    end


    L = length(tex_rs{1,1}(1,:));  % assume all recording lengths are uniform
    t = (0:L-1)*(1/fs_stim); % time vector
    ti = 1:length(t); % time index vector     
    

    stim.DT = 1/(fs_stim);  % needed for tau computation
    stim.tex_rs = tex_rs;
%    stim.tex_rsdiff = tex_rsdiff;
    stim.tex_rsdiff = 0;
    stim.tex_name = tex_name;
    stim.L = L;
    stim.t = t;
    stim.ti = ti;
    stim.tlength = tlength;
    stim.fs_stim = fs_stim;
    stim.stim_os = 1;    

    %% to be used for adding variability during quantizations
    stim.tdelay = 0;  % N/A
    stim.time_chunks = 0; % N/A
    stim.tdelaycnt = 0; % N/A
    stim.tlength_des = tlength;
    stim.tlength_origrs = 2*L; %tsamples - just make it long enough before chunkification for fill_array   
end





end
