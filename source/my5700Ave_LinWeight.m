function yAve = my5700Ave_LinWeight(data,N)
% input a data set that is to be average with a linear weight for a given
% block size

% handle the inputs for have block sizes that fit the data length
len  = length(data);            % data length
rmnd = rem(len,N);              % get the remainder
newData = data(1:len-rmnd);     % get data that can be split up evenly with the given block size
dataChop = data(len-rmnd+1:end);% get the chopped off data
newLen = length(newData);       % get the new data length
blcks = newLen/N;               % get the number of blocks

% reshape the data to the block sizes
y = reshape(newData,blcks,N);	% row is the run. column is the data

% average the data
yAve = mean(y,1);

% % now chunk up the data
% k = 1;                      % counter
% y = zeros(blcks,N);    % initialize
% for i = 1:blcks
    % y(i,:) = newData(k:k+N-1);          % get the next block
    % k = k + N;                          % shift the block
% end

% % now average up each of the data points
% yAve = zeros(1,N);     % initialize
% for k = 1:N
    
    % % check if the chopped data can be averaged in (e.g. does it have data
    % % in that index)
    % if k<=rmnd
        % yAve(k) = mean([y(:,k);dataChop(k)]);   % average them with the chopped data
    % else
        % yAve(k) = mean(y(:,k));                 % average them without the chopped data
    % end
% end

end