function [ XLS ] = WriteDataOutput2
global UlPod Ri Pi

%Ulazni podaci
%==========================================================================
v=UlPod.v;
u=UlPod.u;
P_f=Pi.Pf;
P_v=Pi.Pv;
P_u=Pi.Pu;


%Zapis u .xls datoteku 
%==========================================================================
A={'v[m/s]','P_f[W]', 'P_v[W]' ,'P_u[W]'};
At=A';
xlswrite('VucniProracun.xls', At, 'PotSnagZaOtp', 'A1');
B=[v;P_f;P_v;P_u];
xlswrite('VucniProracun.xls', B, 'PotSnagZaOtp', 'B1');
XLS.i=1; 

end

