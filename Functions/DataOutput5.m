function [ SBKL ] = DataOutput5

global UlPod Km
%Ulazni podaci
%==========================================================================
v=UlPod.v;
Peopt=Km.Peopt;
Pr=Km.Pr;

%Spoljna brzinska karakteristika izrazena preko Lajdermana 
%--------------------------------------------------------------------------
%Odnos brzina po intervalu i maksimalne
v_vmaxR=v./max(v);
%Odnos brzina po intervalu i maksimalne na kvadrat
v_vmaxRSQR=v_vmaxR.^2;
%Odnos brzina po intervalu i maksimalne na kub
v_vmaxRCUBE=v_vmaxR.^3;
%Lajdermanove konstante(vrednost zavisi od izbora vrste motora)
%Unosenje vrednosti C1
InputStr_C1=input('Unesi brojevnu Lajdermanovog koeficienta C1(OTTO=1, DIESEL=0.5-0.7):  ','s');
%String konvertujemo u brojevnu vrednost 
C1 = str2num(InputStr_C1);
InputStr_C2=input('Unesi brojevnu Lajdermanovog koeficienta C2(OTTO=1, DIESEL=1.3-1.5):  ','s');
%String konvertujemo u brojevnu vrednost 
C2 = str2num(InputStr_C2);

C1times_v_vmaxR=C1.*v_vmaxR;
C2times_v_vmaxRSQR=C2.*v_vmaxRSQR;
C1times_v_vmaxR_add_C2times_v_vmaxRSQR=C1times_v_vmaxR+C2times_v_vmaxRSQR;
C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE=C1times_v_vmaxR_add_C2times_v_vmaxRSQR-v_vmaxRCUBE;
PeL=max(Peopt).*((v_vmaxR.*C1)+(v_vmaxRSQR.*C2)-(v_vmaxRCUBE));
figure(8)
plot(v,PeL,'-m');
hold on;
plot(v,Pr,'LineWidth',3);
title('\fontsize{16}Spoljna brzinska karakteristika pogonskog agregata izrazena preko Lajdermanove karakteristike P_{e}');
xlabel('v[m/s]');
ylabel('P_{r} P_{e}[W]');
legend('P_{e}','P_{r}');
%Izlaz iz funkcije
%==========================================================================
SBKL.v_vmaxR=v_vmaxR;
SBKL.v_vmaxRSQR=v_vmaxRSQR;
SBKL.v_vmaxRCUBE=v_vmaxRCUBE;
SBKL.C1=C1;
SBKL.C2=C2;
SBKL.C1times_v_vmaxR=C1times_v_vmaxR;
SBKL.C2times_v_vmaxRSQR=C2times_v_vmaxRSQR;
SBKL.C1times_v_vmaxR_add_C2times_v_vmaxRSQR=C1times_v_vmaxR_add_C2times_v_vmaxRSQR;
SBKL.C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE=C1times_v_vmaxR_add_C2times_v_vmaxRSQR_sub_v_vmaxRCUBE;
SBKL.PeL=PeL;
end

