function  lne = my5700PSD(time,sig)
%MY5700FFT Summary of this function goes here
%   Detailed explanation goes here

%% calculate some parameters based on the inputs
T = time(2) - time(1);          % (sec)     sampling period
fs = 1/T;                       % (Hz)      sampling frequency
N = length(sig);                % (null)    block size
fNyq = fs/2;                    % (Hz)      nyquist frequency
f = linspace(0,fNyq,N/2+1);     % (Hz)      frequency vector. one added to include zero

%% calculate the transform
Y = fft(sig);                   % matlab fft command
Y = Y.*conj(Y);                 % convert to power of the signal
Y2 = abs(Y/N);                  % two-sided spectrum. normalize for further calcs???
Y1 = Y2(1:N/2+1);               % single sided spectrum
Y1(2:end-1) = 2*Y1(2:end-1);    % correction to include full signal strength from the other side???          

%% plot it!
% figure
% semilogx(f,mag2db(abs(Y1)),"linewidth",2)
lne = line(f,mag2db(abs(Y1)./fs));
h = gca;
h.XScale = "log";
xlabel("Frequency (Hz)")
ylabel("Mag dB")
title("Power Spectral Density (PSD)")
grid on

end

