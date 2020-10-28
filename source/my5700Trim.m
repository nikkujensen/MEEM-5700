function yNew = my5700Trim(y,N)
% function used to trim data and reshape for the chosen block size. Data
% will be outputted with columns being blocks and rows being the data.

len  = length(y);               % data length
rmnd = rem(len,N);              % get the remainder
yNew = y(1:len-rmnd);           % get data that can be split up evenly with the given block size
% yNew = reshape(yTemp,N,[]);     % reshape the data

end