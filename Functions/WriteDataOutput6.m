function [XLS] =WriteDataOutput6
global UlPod SBKM I0 I0Analysis

%Ulazni podaci
%==========================================================================
v=UlPod.v;
omega_e=SBKM.omega_e;
Me=SBKM.Me;
PeL=SBKM.PeL./1000;
Vmaxi0=I0.Vmaxi0;
i0=I0.i0;
Fomaxi0=I0Analysis.Fomaxi0;
omega_Me_max=I0Analysis.omega_Me_max;
Vmaxi0=I0Analysis.Vmaxi0;
V_Me_max=I0Analysis.V_Me_max;
Do_max_i0=I0Analysis.Do_max_i0;
delta=I0Analysis.delta;
f_V_Memax=I0Analysis.f_V_Memax;
a_max=I0Analysis.a_max;



%zapsisivanje podataka u .xls datoteku
%==========================================================================
A={'v[m/s]','omega_e[1/s]','M_e[Nm]','P_e[kW]'};
At=A';
xlswrite('VucniProracun.xls', At, 'SBKM', 'A1');
B=[v;omega_e;Me;PeL];
xlswrite('VucniProracun.xls', B, 'SBKM', 'B1');
C={'i0[/]','V_maxI0[m/s]','F_omax[N]','V_Me_max[m/s]','Do_max_i0[/]',...
    'delta[/]','f_V_Memax[/]','a_max[m/s^2]'};
xlswrite('VucniProracun.xls', C', 'I0', 'A1');
D=[i0; Vmaxi0; Fomaxi0; V_Me_max; Do_max_i0; delta; f_V_Memax; a_max ];
xlswrite('VucniProracun.xls', D, 'I0', 'B1');

XLS.i=1; 


end

