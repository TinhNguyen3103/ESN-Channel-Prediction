%Aperture Averaging Effect
function AA = AA_func(lambda,v_wind,C2n_0,H_U,Ha,si,Dr)
f1           = @(x) (0.00594*(v_wind/27)^2.*(x.*10^(-5)).^10.*exp(-x./1000) + 2.7*10^(-16).*exp(-x./1500)... 
              + C2n_0.*exp(-x./100)).*x.^2; 
f2           = @(x) (0.00594*(v_wind/27)^2.*(x.*10^(-5)).^10.*exp(-x./1000) + 2.7*10^(-16).*exp(-x./1500)... 
              + C2n_0.*exp(-x./100)).*x.^(5/6); 
h0           = (integral(f1,H_U,Ha)/integral(f2,H_U,Ha))^(6/7);
AA           = (1 + 1.1*(Dr^2/(lambda*h0*(1/cos(si))))^(7/6))^(-1); %Average Aperture Factor 
end

