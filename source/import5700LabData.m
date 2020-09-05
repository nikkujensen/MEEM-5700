function import5700LabData(fName)
% importing lab data for MEEM 5700
%     just import the filename without any extensions

% set the file name and data structure for this filename
dat = struct("name",[],"time",[],"values",[]);  % create the structure

% now get a data file(s) for a given name
searchStr = strcat("data/lab/",fName,"*");  % set the search string
fNames = ls(searchStr);                     % related filenames
fNamesCell = cellstr(fNames);               % convert to cell array
fNamesStr = string(fNamesCell);             % convert to string array

%loop through the files (this is where the loop would begin)
for i = 1:numel(fNamesStr)
    
    % check on the file type to determine what next
    [~, ~, fExt] = fileparts(fNamesStr(i));
    
    switch fExt
        
        case ".txt"
            %% NISignal Express (NI Compact DAQ) importing procedure
            % BIG point!
            %     - make sure you collect channel units because this importing process
            %     does not obtain those!
            % expected conditions for this process
            %     - have only the first column as time data and the rest of the columns
            %     as channel data
            %     - use .txt ASCII format which has a set file name with appended numbers for following runs
            %         - make sure this ending is unique because a wildcard is used to read data (aka, don't do "test A" and "test AB" for uniqueness
            %     - still not sure about reset relative or not, but for now we will assume the relative time is reset
            nums = readmatrix(fNamesStr(i));            % get the numeric data
            dat(i).name = fNamesStr(i);                 % assign the file name
            dat(i).time = nums(:,1);                    % get and assign the time data
            dat(i).values = nums(:,2:end);              % get and assign the channel data
            
        case ".csv"
            
            %% NI Virtual Bench
            % what is the time data here? Ask Jason and/or Xuebin
            temp = readmatrix(fName);       % quick import the data
            
            % preview the data quick before finishing up
            fig = uifigure;
            fig.Name = strcat("Preview of: ",fName,fExt);
            uitable(fig,'data',temp(1:20,:));
            
            % based on the preview, input parameters for proper data sizing
            orgRow = input("Enter the data row origin: ");
            orgCol = input("Enter the data column origin: ");
            numCols = input("Enter the number of columns of data (include time): ");
            cols = orgCol + numCols - 1;
            temp = temp(orgRow:end,orgCol:cols);
            
            % close the gui
            close(fig)
            
            % get/assign data
            dat(i).name = fNamesStr(i);
            dat(i).time = temp(:,1)./1e9;           % convert nano-secs to seconds
            dat(i).values = temp(:,2:end);
            
            
        otherwise
            error("please use an appropriate data type")
    end
    
end

%% assign outputs/save the data and clean up
saveName = strcat("data/matlab/",fName);        % full filename for saving
save(saveName,'dat')                            % save the data

clear temp

end
