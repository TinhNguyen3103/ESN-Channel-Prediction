function LCR = Func_LCR_new(w_Leq, sigma_mod, Rytov, phi_mod, f_c, A0, hl, h0)
% Level Crossing Rate function
Omega   = 2;                    %resonance frequency 
Gamma   = 1.5;                  %damping coefficient 
nuy     = sqrt(2*sigma_mod^2*abs(Omega^2-Gamma^2/4));
sigma_c = f_c/(sqrt(2*log(2))); %Related to 3-dB cutoff frequency 
b1      = (2*pi*sigma_c)^2;    	%Value of b
Cth		= w_Leq/(8*pi*sigma_mod^2*Rytov);
f		=@(x)(exp(-phi_mod^2.*x).*sqrt(8*nuy^2.*x+ b1*Rytov^2*w_Leq^2).* ...
        exp(-((x+log(h0/(hl*A0))+ Rytov^2/2).^2)./(2*Rytov^2)));
LCR 	=Cth*integral(f,0,inf);
end

