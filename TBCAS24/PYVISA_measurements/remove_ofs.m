ofs = 1e6*[27.95 79 27.3 10.45 7.97 10 13.55 20.95 12.95 7.59 16.88 5.13 10.58 5.42 10.11 7.87 2.24 6.11 9.17 57.07 8.94 7.69 4.89 5.63 15.03]; %store start of spikes
folderPath = pwd;
name='sensor_1b_pdms_N5b_itail_50nA_squ_indentperiod'

mkdir([folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'_noofs'])
for trial=1:25

    if trial<18
        filename = [folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'\',num2str(trial),'.bs2']
    else
        filename = [folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'\',num2str(60000+trial),'.bs2']
    end    
    TD = Read_Ndataset_longTs(filename);
    
    % sort dataset if unsorted
    [TD.ts,I] = sort(TD.ts);
    TD.x = TD.x(I);
    TD.y = TD.y(I);
    TD.p = TD.p(I);   
    
    TD.ts = TD.ts(TD.ts > ofs(trial));
    TD.x = TD.x(TD.ts > ofs(trial));
    TD.y = TD.y(TD.ts > ofs(trial));
    TD.p = TD.p(TD.ts > ofs(trial));
    
    TD.ts = TD.ts - ofs(trial)
      
    if trial<18   
        %Encode_Ndataset_longTs([folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'_noofs','\',num2str(trial)],TD);   
        Encode_Ndataset([folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'_noofs','\',num2str(trial)],TD);   % encode into non-long format
    else
        %Encode_Ndataset_longTs([folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'_noofs','\',num2str(60000+trial)],TD);  
        Encode_Ndataset([folderPath,'\for_paper\SENSOR_SPIKES\PROCESSED_SPIKES\',name,'_noofs','\',num2str(60000+trial)],TD);    % encode into non-long format
    end
end    