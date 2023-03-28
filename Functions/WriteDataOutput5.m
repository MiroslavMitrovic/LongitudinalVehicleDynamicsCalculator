function [ XLS ] = WriteDataOutput5
global UlPod SBKL

%Ulazni podaci 
%==========================================================================
v=UlPod.v;
VmaxR=SBKL.v_vmaxR;
v_maxSQR=SBKL.v_vmaxRSQR;
v_maxCUBE=SBKL.v_vmaxRCUBE;
C_1=SBKL.C1;
C_2=SBKL.C2;
C1times_v_vmaxR=SBKL.C1times_v_vmaxR;
C2times_v_vmaxRSQR=SBKL.C2times_v_vmaxRSQR;
C1times_v_vmaxR_add_C2times_v_vmaxRSQR=SBKL.C1times_v_vmaxR_add_C2times_v_vmaxRSQR;
C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE=SBKL.C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE;
PeL=SBKL.PeL;


%Zapis u .xls datoteku 
%==========================================================================

D={'1','2','3','4','5','6','7','8'};
Dt=D';
xlswrite('VucniProracun.xls', Dt, 'SBKL', 'A4');


A={'C1[/]','C2[/]','v[m/s]','v_e/v_max[/]','(1)^2','(1)^3','C1*1','C2*2'...
    ,'(4)+(5)','(6)-(3)','P_e[W]'};
At=A';
xlswrite('VucniProracun.xls', At, 'SBKL', 'B1');
B=[C_1;C_2];
xlswrite('VucniProracun.xls', B, 'SBKL', 'C1');
C=[v; VmaxR; v_maxSQR; v_maxCUBE;  C1times_v_vmaxR; C2times_v_vmaxRSQR;...
  C1times_v_vmaxR_add_C2times_v_vmaxRSQR; C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE...
  ; PeL];
xlswrite('VucniProracun.xls', C, 'SBKL', 'C3');
XLS.i=1; 
end

