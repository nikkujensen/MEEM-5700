function y = my5700Quantize(sig,bits,rg)
% quantization for 5700

% encode and decode to get quantized data
ye = uencode(sig,bits,rg);      % encoded
y  = udecode(ye,bits,rg);       % decode

end