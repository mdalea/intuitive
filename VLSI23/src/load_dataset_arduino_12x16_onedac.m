%% make sure to delete ino_files/',vdac_cfg,' or csv contents before running

tic

clear all
clearvars

fileprint=0;
plot_trials=0;
retrieve=1;

fs_stim = 200; % original signal frequency
tdelay = 100e-9; % intended loop delay (how often crossing can be detected)
stim_os = cast(1/(tdelay*fs_stim),'double');
stim_os = 6000;

% use as default
mr_cnt=12*16;
ch_cnt=8; % 8 of 16 VDAC channels
tex_cnt_orig=6;
tex_cnt=6;  % if <108, choose only a subset of the dataset for easier classification
trialcnt=40;  % how many trials per class to use
randtex=0;  % if 1 - select random tex_cnt from total classes
tex_dataset = 'Kylberg_filt_6_scan_actualdimscale'
spatialres=0.2; % mm, spatial resolution of the sensors (needed by read_texture)

%vdac_cfg = '12x16_9mvpp_250mvofs_onedac';
taxelbatches = floor(mr_cnt/ch_cnt); % 8 active taxels only; limited by VDAC


    scanv=20; scandir=0;
    randtex_indices = randperm(tex_cnt_orig,tex_cnt)   % choose a random subset  

    folderPath = pwd;
    [stim] = read_textures_arduino([pwd,'/matlab_code_to_generate_vdac_values/tactile_dataset/Kylberg-6'],tex_dataset,tex_cnt,trialcnt,randtex,randtex_indices,fs_stim,stim_os,mr_cnt,scanv,scandir,0,spatialres);    

    if not(isfolder([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'']))
      mkdir([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,''])
    end


    for k=1:tex_cnt
        for trial=1:trialcnt
            for tbch=1:taxelbatches
            
                if not(isfolder([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch)]))
                  mkdir([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch)])
                end

                f0 = fopen([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],'w+'); 
                f0_1 = fileread([pwd,'/LOCAL_multich_vdac/firstpart.ino']); 
                fprintf(f0,"\n\n%s", f0_1);
                fclose(f0);

                f0 = fopen([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],'a+'); 
                fprintf(f0,"\nconst PROGMEM uint8_t DATABANK_CH0[8][DATALEN] = {");

                % populate first 7 channels of DAC values
                %for h=1:floor(ch_cnt/2)-1
                for h=1:ch_cnt-1
                    txl=ch_cnt*(tbch-1) + h; % up to 192
                    csvwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h),'-',num2str(tbch),'.ino'],stim.tex_rs{k,trial}(txl,:))
                    csv{h} = csvread([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h),'-',num2str(tbch),'.ino']);
                    fprintf(f0,'%c','{');
                    dlmwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],csv{h},'-append');
                    fprintf(f0,'%c','},');
                end
                % populate last channel of DAC values. separate to make
                % sure terminated with '}};'
                txl=ch_cnt*(tbch-1) + h+1;
                csvwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h+1),'-',num2str(tbch),'.ino'],stim.tex_rs{k,trial}(txl,:))
                csv{h+1} = csvread([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h+1),'-',num2str(tbch),'.ino']);
                fprintf(f0,'%c','{');
                dlmwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],csv{h+1},'-append');
                fprintf(f0,'%c','}};');          
                fclose(f0);

                 f0 = fopen([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],'a+');   
%                 fprintf(f0,"\n\n\nconst PROGMEM uint8_t DATABANK_CH1[8][DATALEN] = {");
% 
%                 % populate first 7 channels of DAC values
%                 for h=floor(ch_cnt/2)+1:ch_cnt-1
%                     txl=16*(tbch-1) + h;
%                     csvwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h),'-',num2str(tbch),'.ino'],stim.tex_rs{k,trial}(txl,:))
%                     csv{h} = csvread([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h),'-',num2str(tbch),'.ino']);
%                     fprintf(f0,'%c','{');
%                     dlmwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],csv{h},'-append');
%                     fprintf(f0,'%c','},');               
%                 end
%                  % populate last channel of DAC values. separate to make
%                 % sure terminated with '}};'  
%                 txl=16*(tbch-1) + h+1;
%                 csvwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h+1),'-',num2str(tbch),'.ino'],stim.tex_rs{k,trial}(txl,:))
%                 csv{h+1} = csvread([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/class-',num2str(k),'-trial-',num2str(trial),'-ch-',num2str(h+1),'-',num2str(tbch),'.ino']);
%                 fprintf(f0,'%c','{');
%                 dlmwrite([pwd,'/matlab_code_to_generate_vdac_values/ino_files/',vdac_cfg,'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'/ALLCH0-class-',num2str(k),'-trial-',num2str(trial),'-',num2str(tbch),'.ino'],csv{h+1},'-append');
%                 fprintf(f0,'%c','}};');            
%                 %fclose(f0);  

                % manually edit this file if you want to change input
                f0_1 = fileread([pwd,'\LOCAL_multich_vdac\lastpart.ino']); 
                fprintf(f0,"\n\n%s", f0_1);
                fclose(f0);          
            end
       end
   end
