% Root directory of this running .m file
projectRootDir = fileparts(mfilename('fullpath'));

% Add project directories to path
addpath(fullfile(projectRootDir,genpath('data')),'-end');
addpath(fullfile(projectRootDir,genpath('documents')),'-end');
addpath(fullfile(projectRootDir,'figures'),'-end');
% addpath(fullfile(projectRootDir,'libraries'),'-end');
% addpath(fullfile(projectRootDir,'models'),'-end');
% addpath(fullfile(projectRootDir,'work'),'-end');
addpath(fullfile(projectRootDir,'scripts'),'-end');

% % Save Simulink-generated helper files to work
% Simulink.fileGenControl('set',...
%     'CacheFolder',fullfile(projectRootDir,'work'),...
%     'CodeGenFolder',fullfile(projectRootDir,'work'));