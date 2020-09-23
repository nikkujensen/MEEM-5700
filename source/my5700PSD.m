function  [f, Y1PSD] = my5700PSD(time,sig)
%MY5700PSD Summary of this function goes here
%   Detailed explanation goes here

%% utilize the custom FFT function
[f, Y1S] = my5700FFT(time,sig);

%% perform PSD calcs
delta_f = f(2)-f(1);            % (Hz)      frequency resolution
Y1A = abs(Y1S);                 %           get the autopower
Y1PSD = Y1A./delta_f;           %           power spectral density

end

