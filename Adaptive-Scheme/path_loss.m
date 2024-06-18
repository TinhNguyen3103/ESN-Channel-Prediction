%Path Loss which is caused by absorption and scattering over atmospheric 
%Adopting from 2019.An FSO-based Drone Assisted Mobile Access Network For Emergency Communications 
function hl = path_loss(lambda,Ha,H_U,si)
La       = (Ha-H_U)*(1/cos(si));                %Unit: m
V        = 30;                                  %Unit: km Visibility 
delta    = 1.3;                                 %Size distribution of scattering particles 
sigma_dB = (3.912/V)*(lambda*10^9/550)^(-delta);%attenuation coefficent (dB) 
sigma    = sigma_dB/(10^4*log10(exp(1)));       %Unit: m^-1
hl       = exp(-sigma*La);                      %Path Loss Calculation 
end

