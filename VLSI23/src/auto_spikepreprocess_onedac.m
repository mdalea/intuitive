% step 0: sort data 
% step 1: find start of spikes, cut one period and then scale to 400ms
% step 2a: create new merged folder
% step 2b: map orig taxel x,y address to desired x_chip,y_chip address to
% fill 192 taxels
% step 3: renumber samples to 1 to 240.bs2
tex_cnt=6;  % if <108, choose only a subset of the dataset for easier classification
trialcnt=40;  % how many trials per class to use
mr_cnt=12*16;
ch_cnt=8; % 8 of 16 VDAC channels

%vdac_cfg = '12x16_9mvpp_250mvofs_onedac';
taxelbatchcnt = floor(mr_cnt/ch_cnt); % 16 active taxels only; limited by VDAC

folderPath = pwd;

%destFolder = [folderPath,'\out\','N_4b_allchannels_ALLCLASS','_auto_nospkfilter_cleaned_',vdac_cfg];
destFolder = [folderPath,'\out\','N_',num2str(Nres),'b_allchannels_ALLCLASS','_auto_nospkfilter_cleaned_',vdac_cfg];
if not(isfolder(destFolder))
    mkdir(destFolder)
end  

period = 1956000/2; % assuming period is now halved
origperiod = 400000;

% addresses of used chip taxels
% addrx = [4 5 6 11 3 4 5 6 7 8 9 10 11 12 13 14];
% addry = [2 2 3 2  6 6 7 7 8 8 9 9  10 10 11 11];
addrx = [3 4 5 6 7 8 9 10];
addry = [6 6 7 7 8 8 9 9];
%% sort spikes
for k=1:tex_cnt
    name = ['N_',num2str(Nres),'b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
    %name = ['N_4b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
    srcFolder = [folderPath,'\out\',name];
    srcFiles = dir(srcFolder);

    % create subfolder for oneperiod spikes (auto extracted)
    if not(isfolder([srcFolder,'_sorted','\oneperiod\']))
        mkdir([srcFolder,'_sorted','\oneperiod\'])
    end  
    
    for i=3:size(srcFiles,1)
        tokens_dot = split(srcFiles(i).name,'.');  % get filename without .bs2
        TD=dataset_sort_timestep_arduino_12x16(srcFolder,['\',tokens_dot{1}]);
        
        %% automatically extract relevant spike period      
        ISI = diff(TD.ts);
        maxISI = find(ISI == max(ISI));
        spkstarttime = TD.ts(maxISI+1);      
        spkendtime = spkstarttime + period;

        I = (TD.ts > spkstarttime);
        TD.x = TD.x(I);
        TD.y = TD.y(I);
        TD.p = TD.p(I);
        TD.ts = TD.ts(I);

        I = (TD.ts < spkendtime);
        TD.ts = TD.ts(I);
        TD.x = TD.x(I);
        TD.y = TD.y(I);
        TD.p = TD.p(I); 

        TD.ts = TD.ts - spkstarttime
        % scale spike period to orig 400ms texture recording
        TD.ts = round(TD.ts * (origperiod/period));
        
        % filter spikes from undefined address (outside the predicted
        % taxels)       
        Ix = find(ismember(TD.x,addrx));
        Iy = find(ismember(TD.y,addry));
        I = intersect(Ix,Iy);        

        TD.ts = TD.ts(I);
        TD.p = TD.p(I);
        TD.x = TD.x(I);
        TD.y = TD.y(I);

        Encode_Ndataset_longTs([srcFolder,'_sorted','\oneperiod\',tokens_dot{1},'-long'],TD);    
        Encode_Ndataset([srcFolder,'_sorted','\oneperiod\',tokens_dot{1}],TD);   
    end
end 


%% re-map taxel address to populate 192 taxels
% make sure there are no missing spikes
for k=1:tex_cnt
    for trial=1:trialcnt
        
        TD_merged = []
        TD_merged.x = []; TD_merged.y = []; TD_merged.ts = []; TD_merged.p = [];
        for tbch=1:taxelbatchcnt
            
            name = ['N_',num2str(Nres),'b_allchannels_cl',num2str(k),'_auto_nospkfilter_',vdac_cfg];
            srcFolder = [folderPath,'\out\',name,'_sorted','\oneperiod\'];
            [srcFolder,num2str(trial),'-',num2str(tbch),'.bs2']
            TD = Read_Ndataset([srcFolder,num2str(trial),'-',num2str(tbch),'.bs2']);
            
            %% renumber taxels
            for ch=1:ch_cnt
               I = find(TD.x==addrx(ch) & TD.y==addry(ch));
               if mod(tbch,2)==1    % if taxelbatch (of 24 batches) is odd, fill cols 0-7; 
                TD.x(I) = ch-1; %ch-1; %0-15
               else  % else fill cols 8-15
                TD.x(I) = 8+ch-1; %ch-1; %0-15
               end    
               TD.y(I) = floor((tbch-1)/2); %0-11 %tbch-1;
            end
            
            TD_merged.x = [TD_merged.x;TD.x];
            TD_merged.y = [TD_merged.y; TD.y];
            TD_merged.ts = [TD_merged.ts; TD.ts];  
            TD_merged.p = [TD_merged.p; TD.p];            
            
        end
        Encode_Ndataset([destFolder,'\',num2str(trial+(k-1)*40)],TD_merged);  
    end
end
