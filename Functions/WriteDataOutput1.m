function [ XLS ] = WriteDataOutput1
global UlPod Ri

%Ulazni podaci 
%==========================================================================
v=UlPod.v;
u=UlPod.u;
R_f=Ri.Rf;
R_v=Ri.Rv;
R_u=Ri.Ru;
psi=Ri.psi;


%Zapis u .xls datoteku 
%==========================================================================
A={'v[m/s]','R_f[N]', 'R_v[N]' ,'u[%]','R_u[N]','psi[/]'};
At=A';
xlswrite('VucniProracun.xls', At, 'Otpori kretanja vozila', 'A1');
B=[v; R_f; R_v; u; R_u; psi];
xlswrite('VucniProracun.xls', B, 'Otpori kretanja vozila', 'B1');

 XLS.i=1; 
end

