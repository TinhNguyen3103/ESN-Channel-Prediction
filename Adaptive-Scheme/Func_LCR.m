%Level crossing rate: exact form
function LCR_av = Func_LCR(phi_mod,Rytov,b,A_mod,A0,hl,f0,h_mean)
% h0          = h_mean*10^(FT/10);
h0          = h_mean;
C1          = phi_mod/(sqrt(pi)*Rytov);
chi         = log(h0/(A0*hl)) + Rytov^2/2; 
%-------------------------------------------------------------------------%
I           = @(y) (C1*sqrt(2*pi^2*f0^2.*y + phi_mod^2*b^2).*exp(-phi_mod^2.*y - (y+chi).^2./(2*Rytov^2)));
%-------------------------------------------------------------------------%
LCR_av   = integral(I,log(A0/A_mod),10000);
end

