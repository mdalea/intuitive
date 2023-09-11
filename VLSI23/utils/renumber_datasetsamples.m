%% Author: Mark Daniel Alea
% mark.alea@kuleuven.be
%
% Code to merge and renumber samples from multiple classes (stored in
% different directories and start with 1.bs2 each)

destFolder = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_ALLclass_auto_nospkfilter_sorted';
srcFolder_cl1 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl1_auto_nospkfilter_sorted/oneperiod';
srcFolder_cl2 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl2_auto_nospkfilter_sorted/oneperiod';
srcFolder_cl3 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl3_auto_nospkfilter_sorted/oneperiod';
srcFolder_cl4 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl4_auto_nospkfilter_sorted/oneperiod';
srcFolder_cl5 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl5_auto_nospkfilter_sorted/oneperiod';
srcFolder_cl6 = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_18mvpp_250mvofs_cl6_auto_nospkfilter_sorted/oneperiod';

if not(isfolder(destFolder))
  mkdir(destFolder)
end

srcfiles_cl1 = dir(srcFolder_cl1);
srcfiles_cl2 = dir(srcFolder_cl2);
srcfiles_cl3 = dir(srcFolder_cl3);
srcfiles_cl4 = dir(srcFolder_cl4);
srcfiles_cl5 = dir(srcFolder_cl5);
srcfiles_cl6 = dir(srcFolder_cl6);


fid_tr = fopen([destFolder,'/train1K.txt'],'wt');
fid_te = fopen([destFolder,'/test100.txt'],'wt');  


fprintf(fid_tr,'#sample #class\n');
fprintf(fid_te,'#sample #class\n');     

for i=3:size(srcfiles_cl1,1) % ignore . and ..
    if srcfiles_cl1(i).name(end-3:end) == '.bs2'
        copyfile([srcfiles_cl1(1).folder,'/',srcfiles_cl1(i).name],destFolder)  

        tokens_dot = split(srcfiles_cl1(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            if i < floor((size(srcfiles_cl1,1)-2)*0.8)
                fprintf(fid_tr,'%d\t0\n',str2num(tokens_dot{1}));    % append
            else
                fprintf(fid_te,'%d\t0\n',str2num(tokens_dot{1}));    % append
            end    
        end
    end    
end  

%class2

for i=3:size(srcfiles_cl2,1) % ignore . and ..
    if srcfiles_cl2(i).name(end-3:end) == '.bs2'
        tokens_dot = split(srcfiles_cl2(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            newfilename = [num2str(str2num(tokens_dot{1})+40),'.bs2'];

            if i < floor((size(srcfiles_cl2,1)-2)*0.8)
                fprintf(fid_tr,'%d\t1\n',str2num(tokens_dot{1})+40);    % append
            else
                fprintf(fid_te,'%d\t1\n',str2num(tokens_dot{1})+40);    % append
            end 

        else
            tokens = split(tokens_dot{1},'-');
            newfilename = [num2str(str2num(tokens{1})+40),'-long.bs2'];
        end           

        copyfile([srcfiles_cl2(1).folder,'/',srcfiles_cl2(i).name],[destFolder,'/',newfilename])   
    end
end    

% class3

for i=3:size(srcfiles_cl3,1) % ignore . and ..
    if srcfiles_cl3(i).name(end-3:end) == '.bs2'
        tokens_dot = split(srcfiles_cl3(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            newfilename = [num2str(str2num(tokens_dot{1})+80),'.bs2'];

            if i < floor((size(srcfiles_cl3,1)-2)*0.8)
                fprintf(fid_tr,'%d\t2\n',str2num(tokens_dot{1})+80);    % append
            else
                fprintf(fid_te,'%d\t2\n',str2num(tokens_dot{1})+80);    % append
            end            
        else
            tokens = split(tokens_dot{1},'-');
            newfilename = [num2str(str2num(tokens{1})+80),'-long.bs2'];
    
        end
        copyfile([srcfiles_cl3(1).folder,'/',srcfiles_cl3(i).name],[destFolder,'/',newfilename])   
    end
end 

% class 4

for i=3:size(srcfiles_cl4,1) % ignore . and ..
    if srcfiles_cl4(i).name(end-3:end) == '.bs2'
        tokens_dot = split(srcfiles_cl4(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            newfilename = [num2str(str2num(tokens_dot{1})+120),'.bs2'];

            if i < floor((size(srcfiles_cl4,1)-2)*0.8)
                fprintf(fid_tr,'%d\t3\n',str2num(tokens_dot{1})+120);    % append
            else
                fprintf(fid_te,'%d\t3\n',str2num(tokens_dot{1})+120);    % append
            end            
        else
            tokens = split(tokens_dot{1},'-');
            newfilename = [num2str(str2num(tokens{1})+120),'-long.bs2'];
    
        end
        copyfile([srcfiles_cl4(1).folder,'/',srcfiles_cl4(i).name],[destFolder,'/',newfilename])   
    end
end 

% class 5

for i=3:size(srcfiles_cl5,1) % ignore . and ..
    if srcfiles_cl5(i).name(end-3:end) == '.bs2'
        tokens_dot = split(srcfiles_cl5(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            newfilename = [num2str(str2num(tokens_dot{1})+160),'.bs2'];

            if i < floor((size(srcfiles_cl5,1)-2)*0.8)
                fprintf(fid_tr,'%d\t4\n',str2num(tokens_dot{1})+160);    % append
            else
                fprintf(fid_te,'%d\t4\n',str2num(tokens_dot{1})+160);    % append
            end            
        else
            tokens = split(tokens_dot{1},'-');
            newfilename = [num2str(str2num(tokens{1})+160),'-long.bs2'];
    
        end
        copyfile([srcfiles_cl5(1).folder,'/',srcfiles_cl5(i).name],[destFolder,'/',newfilename])   
    end
end 

% class 6

for i=3:size(srcfiles_cl6,1) % ignore . and ..
    if srcfiles_cl6(i).name(end-3:end) == '.bs2'
        tokens_dot = split(srcfiles_cl6(i).name,'.');
        if str2num(tokens_dot{1}) > 0
            newfilename = [num2str(str2num(tokens_dot{1})+200),'.bs2'];

            if i < floor((size(srcfiles_cl6,1)-2)*0.8)
                fprintf(fid_tr,'%d\t5\n',str2num(tokens_dot{1})+200);    % append
            else
                fprintf(fid_te,'%d\t5\n',str2num(tokens_dot{1})+200);    % append
            end            
        else
            tokens = split(tokens_dot{1},'-');
            newfilename = [num2str(str2num(tokens{1})+200),'-long.bs2'];
    
        end
        copyfile([srcfiles_cl6(1).folder,'/',srcfiles_cl6(i).name],[destFolder,'/',newfilename])   
    end
end 


fclose(fid_tr)
fclose(fid_te)