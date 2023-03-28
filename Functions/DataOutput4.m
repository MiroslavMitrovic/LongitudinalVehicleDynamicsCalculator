function [ Km ] = DataOutput4
global Pi UlPod
%Ulazni podaci
%==========================================================================
etap=UlPod.etap;
v=UlPod.v;
Pf=Pi.Pf;
Pv=Pi.Pv;


%%
%Izbor karakteristika motora 
%--------------------------------------------------------------------------
%Pr         [N]         Snaga na kretacima 
%Pe         [N]         Snaga na zamajcu
%--------------------------------------------------------------------------
Pr=Pf+Pv;
Km.Pr=Pr;
Peopt=Pr./etap;
Km.Peopt=Peopt;
figure(7)
plot(v,Pr);
title('\fontsize{16}Snaga na kretacima P_{f}');
xlabel('v[m/s]');
ylabel('P_{r}[W]');
end

