function y = my5700IFFT(yFFT,win)
% MY5700IFFT takes the double sided spectrum from an FFT and inverts it to
% its original domain (typically time domain but could be others)
%   Note: the blocks of matrices of data are in the rows and the data is in the
%   columns. This goes for the time, signal, and window.

%% perform the calculations
y = ifft(yFFT)./win;

end