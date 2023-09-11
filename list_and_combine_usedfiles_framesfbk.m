% Specify the path to your top-level MATLAB file
parentFolder = '/users/micas/malea/Documents/ArduinoRead_2/' 
topLevelFolder = '/users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/' 
topLevelFile =    'read_serial_frames_fbk.m';

addpath(parentFolder)

% Use requiredFilesAndProducts to get the file dependencies
[fileDependencies, ~] = matlab.codetools.requiredFilesAndProducts([topLevelFolder,topLevelFile]);

% % Extract the file paths from the returned structure
% if isfield(fileDependencies, 'Filename')
%     dependencyList = {fileDependencies(:).Filename}';
% elseif isfield(fileDependencies, 'Path')
%     dependencyList = {fileDependencies(:).Path}';
% else
%     error('Unable to determine field name for file dependencies.');
% end

% Create a new folder to copy the files
destinationFolder = '/users/micas/malea/Documents/Housekeeping/FBKSensorChip/src';
mkdir(destinationFolder);

% Copy the files to the destination folder
for i = 1:numel(fileDependencies)
    [~, fileName, fileExt] = fileparts(fileDependencies{i});
    destinationPath = fullfile(destinationFolder, [fileName, fileExt]);
    copyfile(fileDependencies{i}, destinationPath);
    fileName   
end

disp('Files copied successfully.');

% %% Upload to Github
% % Specify the folder path containing the files to upload
% folderPath = destinationFolder;
% 
% % Specify the GitHub repository URL
% repositoryUrl = 'https://github.com/mdalea/intuitive.git';
% 
% % Change directory to the folder path
% cd(folderPath);
% 
% % Initialize a Git repository
% system('git init');
% 
% system('git config --global user.name "Mark Alea"')
% system('git config --global user.email markdaniel.alea@gmail.com')
% 
% % Set the SSL certificate path for Git
% sslCommand = 'git config http.sslCAinfo /etc/ssl/certs/ca-certificates.crt';
% system(sslCommand);
% 
% % Add all files to the Git repository
% system('git add -A');
% 
% % Commit the changes
% system('git commit -m "Initial commit"');
% 
% % Check if the remote repository 'origin' already exists
% remoteCommand = 'git remote show origin';
% [~, result] = system(remoteCommand);
% if contains(result, repositoryUrl)
%     % If the remote URL matches, update the remote URL
%     updateRemoteCommand = ['git remote set-url origin ', repositoryUrl];
%     system(updateRemoteCommand);
% else
%     % If the remote URL does not exist, add the remote repository URL
%     addRemoteCommand = ['git remote add origin ', repositoryUrl];
%     system(addRemoteCommand);
% end
% 
% % Push the changes to the remote repository
% pushCommand = 'git push -u origin master';
% system(pushCommand);
% 
% disp('Files uploaded successfully.');
% 
