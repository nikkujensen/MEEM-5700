%% MEEM 5700 new "general" project script
% this script populates a project template in the current directory. This
% template is found in the "templates\general" folder of the "MEEM 5700" repository.

% get the original working directory
currDir = pwd;

% get the root directory this file is running in
rootDir = fileparts(mfilename('fullpath'));

% navigate to source folder
cd(rootDir)

% now go up two level
cd ..

% copy the template to the original working directory
copyfile('templates\general', currDir)

% navigate back to the original working directory
cd(strcat(currDir,"\"))

% clear remnants
clearvars rootDir currDir

