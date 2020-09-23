function  [lne, Y1S] = my5700FFT(time,sig)
%MY5700FFT Summary of this function goes here
%   Detailed explanation goes here

%% calculate some parameters based on the inputs
T = time(2) - time(1);          % (sec)     sampling period
fs = 1/T;                       % (Hz)      sampling frequency
N = length(sig);                % (null)    block size
fNyq = fs/2;                    % (Hz)      nyquist frequency

%% check the signal length and determine how much of the double-sided goes to the single-sided spectrum
if ~rem(N,2)
    % even
    len = N/2+1;
else
    % odd
    len = N/2+0.5;
end

%% calculate the transform
Y2  = fft(sig);                 % matlab fft command - double sided
Y1  = Y2(1:len);                % get the single sided
Y1S = 2/N.*Y1;                  % scale the single sided to have full spectrum power and a set period (using N blocks)
Y1A = abs(Y1S);                 % get the autopower
%% plot it!
f = linspace(0,fNyq,len);       % (Hz)  frequency vector
lne = line(f,mag2db(Y1A));      %       plot the line in db scale

% format the plot
h = gca;
h.XScale = "log";
xlabel("Frequency (Hz)")
ylabel("Mag dB")
title("Frequency Response")
grid on

end

