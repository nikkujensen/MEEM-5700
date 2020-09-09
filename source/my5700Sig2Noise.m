function s2N = my5700Sig2Noise(sig)
% calculates the signal to noise ratio

% calculate the mean
mn = mean(sig);

% calculate the standard deviation
sdev = std(sig);

% calculate the signal-to-noise ratio
s2N = mn/sdev;

end