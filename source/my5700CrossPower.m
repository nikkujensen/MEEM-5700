function [CP] = my5700CrossPower(y1,y2)
% this performs the crosspower as G_1_2 = conj(y1).*y2

% compute
CP = conj(y1).*y2;

end