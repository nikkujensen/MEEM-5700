function  [Y1S, f] = my5700FFT(time,sig,win)
%MY5700FFT Summary of this function goes here
%   Detailed explanation goes here

%% calculate some parameters based on the inputs
T = time(2) - time(1);          % (sec)     sampling period
fs = 1/T;                       % (Hz)      sampling frequency
N = length(sig);                % (null)    block size
fNyq = fs/2;                    % (Hz)      nyquist frequency
ACF = 1/mean(win);              %           amplitude correction factor

%% check the signal length and determine how much of the double-sided goes to the single-sided spectrum
if ~rem(N,2)
    % even
    len = N/2+1;
else
    % odd
    len = N/2+0.5;
end

% apply the window before the freq domain
sigW = win.*sig;

%% calculate the transform
Y2  = fft(sigW);                % matlab fft command - double sided
Y1  = Y2(1:len);                % get the single sided
Y1S = ACF*2/N.*Y1;              % scale the single sided to have full spectrum power and a set period (using N blocks)
Y1A = abs(Y1S);                 % get the autopower
f = linspace(0,fNyq,len);       % (Hz)  frequency vector

end

