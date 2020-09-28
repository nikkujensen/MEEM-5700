function  [Y1PSD, f] = my5700PSD(time,sig,win)
%MY5700PSD Summary of this function goes here
%   Detailed explanation goes here

%% utilize the custom FFT function
[Y1S, f] = my5700FFT(time,sig);

%% calculate the window correction factor
ECF = 1/rms(win);               %           energy correction factor

%% perform PSD calcs
delta_f = f(2)-f(1);            % (Hz)      frequency resolution
Y1A = ECF*abs(Y1S);             %           get the autopower
Y1PSD = Y1A./delta_f;           %           power spectral density

end

