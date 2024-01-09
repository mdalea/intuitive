function [spike_cnt]=count_spikes_dataset(path,tex_cnt,trialcnt)
    
    srcFolder = path;
    
    spike_cnt_tot=0;
    
    for k=1:tex_cnt
        for trial=1:trialcnt
                
            [srcFolder,'/',num2str(trial+(k-1)*40),'.bs2']
            TD = Read_Ndataset([path,'/',num2str(trial+(k-1)*40),'.bs2']);

            spike_cnt_tot = spike_cnt_tot + length(TD.ts)
        end
    end

    spike_cnt = spike_cnt_tot / (tex_cnt * trialcnt)

end    