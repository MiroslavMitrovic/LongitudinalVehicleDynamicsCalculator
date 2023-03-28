function [ XLS ] = WriteDataOutput9
global UlPod SV PV

%Ulazni podaci
%==========================================================================
beta=SV.beta;
Rs=SV.R;
V_grs=SV.V_gr;
Rp=PV.R;
V_grp=PV.V_gr;
%zapsisivanje podataka u .xls datoteku
%==========================================================================
C={'beta[deg]'};
xlswrite('VucniProracun.xls', C, 'Stabilnost i Prevrtanje', 'A1');
xlswrite('VucniProracun.xls', beta, 'Stabilnost i Prevrtanje', 'B1');
A={'R_s[m]','V_grs[m/s]'};
At=A';
xlswrite('VucniProracun.xls', At, 'Stabilnost i Prevrtanje', 'A2');
B=[Rs;V_grs];
xlswrite('VucniProracun.xls', B, 'Stabilnost i Prevrtanje', 'B2');


xlswrite('VucniProracun.xls', C, 'Stabilnost i Prevrtanje', 'A15');
xlswrite('VucniProracun.xls', beta, 'Stabilnost i Prevrtanje', 'B15');
D={'R_p[m]','V_grp[m/s]'};
xlswrite('VucniProracun.xls', D', 'Stabilnost i Prevrtanje', 'A16');
E=[Rp;V_grp];
xlswrite('VucniProracun.xls', E, 'Stabilnost i Prevrtanje', 'B16');
XLS.i=1; 
end

