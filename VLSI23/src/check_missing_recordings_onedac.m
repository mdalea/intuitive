%% check missing recordings
tex_cnt=6;  % if <108, choose only a subset of the dataset for easier classification
trialcnt=40;  % how many trials per class to use
mr_cnt=12*16;
ch_cnt=8; % 8 of 16 VDAC channels

folderPath = pwd;
%vdac_cfg = '12x16_180mvpp_250mvofs_onedac';
taxelbatchcnt = floor(mr_cnt/ch_cnt); % 16 active taxels only; limited by VDAC

tex_array = [];
trial_array = [];
tbch_array = [];
for k=1:tex_cnt
    for trial=1:trialcnt
        for tbch=1:taxelbatchcnt
            name = ['N_',num2str(Nres),'b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
            %name = ['N_4b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
            srcFolder = [folderPath,'\out\',name];
            %srcFiles = dir(srcFolder);

            %f0 = fopen([srcFolder,'\missing.txt'],'w+'); 
            % create subfolder for oneperiod spikes (auto extracted)
            if not(isfile([srcFolder,'\',num2str(trial),'-',num2str(tbch),'.bs2']))
                [srcFolder,'\',num2str(trial),'-',num2str(tbch)]
                %fprintf(f0,"%s\n", [srcFolder,'\',num2str(trial),'-',num2str(tbch)]);
                tex_array = [tex_array;k];
                trial_array = [trial_array;trial];
                tbch_array = [tbch_array;tbch];
            end  
            %fclose(f0);
        end
    end
end

tex_array
trial_array
tbch_array