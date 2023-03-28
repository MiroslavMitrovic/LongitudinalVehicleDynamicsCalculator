function [ XLS ] = WriteDataOutput8
global UlPod PKP

%Ulazni podaci
%==========================================================================
v=UlPod.v;
phi=PKP.phi;
F_kphi=PKP.F_kphi;
Z_zzt=PKP.Z_zzt;
Z_pzt=PKP.Z_pzt;
Z_ppt=PKP.Z_ppt;
Z_zpt=PKP.Z_zpt;
Z=PKP.Z;
F_kzphi=PKP.F_kzphi;
F_kpphi=PKP.F_kpphi;
F_kphi=PKP.F_kphi;
a_zmax=PKP.a_zmax;
a_pmax=PKP.a_pmax;
a_max=PKP.a_max;
S_zmin=PKP.S_zmin;
S_pmin=PKP.S_pmin;
S_min=PKP.S_min;
S_minp=PKP.S_minp;
S_pminp=PKP.S_pminp;
S_zminp=PKP.S_zminp;


%zapsisivanje podataka u .xls datoteku
%==========================================================================
A={'phi[/]','F_kphiz[N]','F_kphip[N]','F_kphi[N]','a_maxz[m/s^2]','a_maxp[m/s^2]'...
   ,'a_max[m/s^2]','S_minz[m]','S_minp[m]','S_min[m]'};
At=A';
xlswrite('VucniProracun.xls', At, 'Proracun kocnih pokazatelja', 'A1');
B=[phi; F_kzphi; F_kpphi; F_kphi; a_zmax; a_pmax; a_max; S_zmin; S_pmin; S_min ];
xlswrite('VucniProracun.xls', B, 'Proracun kocnih pokazatelja', 'B1');
C={'v[m/s]','S_min_i[m]'};
xlswrite('VucniProracun.xls', C', 'Proracun kocnih pokazatelja', 'A11');
D=[v;S_minp];
xlswrite('VucniProracun.xls', D, 'Proracun kocnih pokazatelja', 'B11');

XLS.i=1; 
end

