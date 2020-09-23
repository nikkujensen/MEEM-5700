function lne = my5700FFTPlot(time,sig)
%MY5700FFTPLOT Summary

%% utilize the custom FFT function
[Y1S, f] = my5700FFT(time,sig);

%% plot it!
lne = line(f,mag2db(abs(Y1S)));     %       plot the line in db scale

% format the plot
h = gca;
h.XScale = "log";
xlabel("Frequency (Hz)")
ylabel("Mag dB")
title("Autopower Spectrum")
grid on

end