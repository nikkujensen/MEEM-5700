function y = my5700Quantize(sig,bits,pk)
% quantization for 5700
% inputs:
%   pk: peak value to be used [-pk, pk]

% encode and decode to get quantized data
ye = uencode(sig,bits,pk);      % encoded
y  = udecode(ye,bits,pk);       % decode

end