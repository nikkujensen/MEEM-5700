function [FRF, COH] = my5700FRF(in,out,typ)
% this performs an FRF on a input/output single-sided linear spectrum with
% a given estimate type. The options are H1 and H2.

% select the option
switch typ
    case 'H1'
        % compute the crosspowers
        % Gfx(w)/Gxx(w) = H1(w)
        G_num = my5700CrossPower(out,in);
        G_den = my5700CrossPower(out,out);
    case 'H2'
        % compute the crosspowers
        % Gxx(w)/Gxf(w) = H2(w)
        G_num = my5700CrossPower(in,in);
        G_den = my5700CrossPower(in,out);        
end

% compute the FRF
FRF = G_num./G_den;

% compute the coherence
COH = Coherence(in,out);

    function COH = Coherence(in,out)
       Gfx = my5700CrossPower(out,in);
       Gxf = my5700CrossPower(in,out);
       Gxx = my5700CrossPower(in,in);
       Gff = my5700CrossPower(out,out);
       
       COH = (Gfx.*Gxf)./(Gff.*Gxx);
       
    end


end