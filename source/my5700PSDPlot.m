function lne = my5700PSDPlot(time,sig)
%MY5700FFTPLOT Summary

%% utilize the custom FFT function
[f, Y1PSD] = my5700PSD(time,sig);

%% plot it!
lne = line(f,mag2db(Y1PSD));    %       plot the line in db scale

% format the plot
h = gca;
h.XScale = "log";
xlabel("Frequency (Hz)")
ylabel("Mag dB")
title("Power Spectral Density (PSD)")
grid on

end