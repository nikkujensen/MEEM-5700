function xBlocks = my5700Overlap(x,N,overlap)
% this function is used to create a overlapped blocked up set of data. 
% Note, the data will be outputted with data in the rows. Also,
% the block size (N) needs to be an even number.

% input x is the whole length of data not blocked up yet. Make sure it is
% trimmed to a size that can be reshaped with an even block size (N)

% calculate the shift
shift = N*(overlap/100);

% take partial block off the front and end of the data
xPartial        = x(shift+1:end-shift);         % add one for MATLAB index start at 1
xPartialBlocks  = reshape(xPartial,N,[]);

% aggregated the blocks
xBlocks = reshape(x,N,[]);
xBlocks = [xBlocks,xPartialBlocks];

end