function yAve = my5700Ave_LinWeight(data,N)
% input a data set that is to be average with a linear weight for a given
% block size

% trim and reshape the data
y = my5700TrimReshape(data,N);

% average the data
yAve = mean(y,1);

end