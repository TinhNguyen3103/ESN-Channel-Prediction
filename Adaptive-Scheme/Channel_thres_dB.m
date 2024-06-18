%Channel-state Modeling 
%Equal-duration method 
%SNR thresholds with unit in dB 
%Using bisection search method
function channel_state_thres = Channel_thres_dB(t_slot,chi,A0,hl,C0,SNR_av,Rytov,w_zeq,sigma_jt,muy,f_c,rho,theta_FOV,sigma_o,f_u)
channel_state_thres = [];
%-----------------------------------------------------------------------%
SNR1_dB             = -20; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
channel_state_thres = [channel_state_thres SNR1_dB];
func = @(x) (CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,10.^(x./10))-CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,SNR1))... 
./(level_crossing_rate(w_zeq,sigma_jt,hl,C0,SNR_av,chi,Rytov,10.^(x./10),A0,f_c,rho,theta_FOV,sigma_o,f_u) + level_crossing_rate(w_zeq,sigma_jt,hl,C0,SNR_av,chi,Rytov,SNR1,A0,f_c,rho,theta_FOV,sigma_o,f_u)) - t_slot;
st  = SNR1_dB;
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
channel_state_thres = [channel_state_thres SNR2_dB];
%-----------------------------------------------------------------------%
while abs(CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,10^(SNR2_dB/10))-CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,10^(SNR1_dB/10)))>=10^(-5) && abs(SNR2_dB-SNR1_dB)>10^(-4)
SNR1_dB = SNR2_dB;
SNR1    = 10^(SNR1_dB/10);
func    = @(x) (CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,10.^(x./10))-CDF_func(chi,A0,hl,C0,SNR_av,Rytov,muy,rho,sigma_jt,w_zeq,theta_FOV,sigma_o,SNR1))... 
./(level_crossing_rate(w_zeq,sigma_jt,hl,C0,SNR_av,chi,Rytov,10.^(x./10),A0,f_c,rho,theta_FOV,sigma_o,f_u) + level_crossing_rate(w_zeq,sigma_jt,hl,C0,SNR_av,chi,Rytov,SNR1,A0,f_c,rho,theta_FOV,sigma_o,f_u)) - t_slot;
st  = SNR1_dB;
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
%-----------------------------------------------------------------------%
channel_state_thres = [channel_state_thres SNR2_dB];
end
% channel_state_thres = channel_state_thres(1,1:length(channel_state_thres)-1);
channel_state_thres(length(channel_state_thres)) = 100;    
if length(channel_state_thres) == 2
    channel_state_thres = [channel_state_thres(1) 8 channel_state_thres(2)];
end

