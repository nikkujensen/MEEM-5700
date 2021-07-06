function y = my5700IFFT(yFFT,win,typ,WCF)
% MY5700IFFT takes the double sided spectrum from an FFT and inverts it to
% its original domain (typically time domain but could be others)
%   Note: the blocks of matrices of data are in the rows and the data is in the
%   columns. This goes for the time, signal, and window.

%% calculate some parameters based on the inputs
N = size(yFFT,1);           % (null)    block size

switch WCF
    case "ACF"
        WCF = 1/mean(win);  % amplitude correction factor
    case "ECF"
        WCF = 1/rms(win);   % energy correction factor
end

%% determine a method and perform appropriate calculations
switch typ

    case "Single-Sided"
        y = oneSideIFFT(yFFT,win,N,WCF);
    case "Double-Sided"
        y = twoSideIFFT(yFFT,win);
end

%% calculation methods
function y = twoSideIFFT(yFFT,win)
    y = ifft(yFFT)./win;
end

function y = oneSideIFFT(yFFT,win,N,WCF)
%% check the signal length to know how to propagate the double-sided
% spectrum
if ~rem(N,2)
    % even
    len = N/2+1;
    flg = 1;
else
    % odd
    len = N/2+0.5;
    flg = 0;
end

%% remove the scaling
Y1NS = (N/WCF).*yFFT;       % remove correction factor and normalization

% based on the signal length, determine how to scale (don't double multiply for 0 or fNyq if it is not present on the negative frequency side)
if flg
	Y1S = Y1NS;                                 % get all the data at first
	Y1S(2:end,:) = Y1S(2:end,:)/2;              % remove scaling
    
    % now mirror-ish
    Y2 = [Y1S;flipud(Y1S(1:end-1,:))];
else
	Y1S = Y1NS;                                 % get all the data at first
	Y1S(2:end-1,:) = Y1S(2:end-1,:)/2;          % remove scaling

    % now mirror-ish
    Y2 = [Y1S;flipud(Y1S(1:end-2,:))];
end

% IFFT and remove the window
yIFFT = ifft(Y2);
assignin("base","Y2",Y2)
y = yIFFT./win;

end

end