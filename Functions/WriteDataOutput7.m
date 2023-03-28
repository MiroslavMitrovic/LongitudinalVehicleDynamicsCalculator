function [ XLS ] = WriteDataOutput7
global UlPod VucDij  DinKar2 SBKM MSU Ubrzanje

%Ulazni podaci 
%==========================================================================
v=UlPod.v;
I=VucDij.I;  
omega_e=VucDij.omega_e;            
Me=VucDij.Me;
Pe=SBKM.PeL;
Rf=VucDij.Rf;     
Rv=VucDij.Rv;     
Ru=VucDij.Ru;    
Rr=VucDij.Rr;
Fo=VucDij.Fo;
Foh=VucDij.Foh;
Vi=VucDij.Vi;
Rvi=DinKar2.Rvi;
Doi=DinKar2.Doi;
sin_alpha=MSU.sin_alpha;
a=Ubrzanje.a;
Rfv=Rf+Rv;


%zapsisivanje podataka u .xls datoteku
%==========================================================================
A={'v[m/s]','Rf[N]','R_v[N]','Rf+Rv [N]','Ru[N]','Rr_1[N]'...
   ,'Rr_2[N]','Rr_3[N]','Rr_4[N]'...
   ,'Rr_6[N]','Rr_7[N]','Rr_8[N]','Rr_9[N]','Rr_10[N]',};
At=A';
xlswrite('VucniProracun.xls', At, 'Vucni Dijagram', 'A1');
B=[v; Rf; Rv; Rfv; Ru; Rr ];
xlswrite('VucniProracun.xls', B, 'Vucni Dijagram', 'B1');
C={'omega_e[1/s]','M_e[Nm]','P_e[W]','F_oi[N]'};
xlswrite('VucniProracun.xls', C', 'Vucni Dijagram', 'A20');
D=[omega_e; Me; Pe; Fo];
xlswrite('VucniProracun.xls', D, 'Vucni Dijagram', 'B20');
E={'Vi[m/s]'};
xlswrite('VucniProracun.xls', E, 'Vucni Dijagram', 'A28');
xlswrite('VucniProracun.xls', Vi, 'Vucni Dijagram', 'B28');
F={'v[m/s]','omega_e[1/s]','F_oh[N]'};
xlswrite('VucniProracun.xls', F', 'Vucni Dijagram', 'A35');
G=[v; omega_e; Foh];
xlswrite('VucniProracun.xls', G, 'Vucni Dijagram', 'B35');
H={'Do_i[/]'};
xlswrite('VucniProracun.xls', H, 'Vucni Dijagram', 'A40');
xlswrite('VucniProracun.xls', Doi, 'Vucni Dijagram', 'B40');
J={'sin_i(alpha)'};
xlswrite('VucniProracun.xls', J, 'Vucni Dijagram', 'A45');
xlswrite('VucniProracun.xls', sin_alpha, 'Vucni Dijagram', 'B45');
K={'a_i[m/s^2]'};
xlswrite('VucniProracun.xls', K, 'Vucni Dijagram', 'A50');
xlswrite('VucniProracun.xls', a, 'Vucni Dijagram', 'B50');
XLS.i=1; 
end

