function lne = my5700FFTPlot(time,sig,win,WCF)
%MY5700FFTPLOT Summary

%% utilize the custom FFT function
[Y1S, f] = my5700FFT(time,sig,win,WCF);

%% plot it!
lne = plot(f,mag2db(abs(Y1S)));     %       plot the line in db scale

% format the plot
h = gca;
h.XScale = "log";
xlabel("Frequency (Hz)")
ylabel("Mag dB")
title("Autopower Spectrum")
grid on

end