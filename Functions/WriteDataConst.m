function [XLS ] = WriteDataConst
global UlPod
%Ulazni podaci 
%==========================================================================
r_d=UlPod.rd;
phi=UlPod.phi;
eta_p=UlPod.etap;
C_x=UlPod.Cx;
rho_v=UlPod.rho;
A_v=UlPod.A;
m_ukopt=UlPod.mukopt;
l=UlPod.l;
h_c=UlPod.hc;
RWR=UlPod.RWR;
v=UlPod.v;
f_0=UlPod.f0;
u=UlPod.u;
P_emaxzad=UlPod.Pemaxzad;
n_pemax=UlPod.npemax;

i_pm=UlPod.i_pm;
i_p=UlPod.i_p;

N=UlPod.N;
NV=UlPod.NV;
b=UlPod.b;




%Zapis u .xls datoteku 
%==========================================================================
A={'r_d[m]','phi[/]', 'eta_p[/]' ,'C_x[/]','rho_v[kg/m^3]','A[m^2]','m_ukopt'...
,'l[m]','h_c[m]','Z_zst/Z[/]','v[m/s]','u[%]','f0[/]','P_emax[W]'...
,'n_pemax[min^-1]','N[/]','i_1','i_2','i_3','i_4','i_5','i_6','i_7','i_8'};
At=A';

DataMatlab2XLS1 = [ r_d; phi; eta_p; C_x; rho_v; A_v; m_ukopt; l; h_c; ...
    RWR];
DataMatlab2XLS2=[v(1,:);u(1,:)];
DataMatlab2XLS3=[f_0; P_emaxzad; n_pemax; N; i_p];

xlswrite('VucniProracun.xls', At, 'Ulazni podaci', 'A1');

xlswrite('VucniProracun.xls', DataMatlab2XLS1, 'Ulazni podaci', 'B1');
xlswrite('VucniProracun.xls', DataMatlab2XLS2, 'Ulazni podaci', 'B11');
xlswrite('VucniProracun.xls', DataMatlab2XLS3, 'Ulazni podaci', 'B13');
 XLS.i=1; 
end

