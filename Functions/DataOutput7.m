function [SBKM ] = DataOutput7
%Zavisnost omega_e, Pe i Me 
global UlPod SBKL

%Ulazni podaci
%==========================================================================
npemax=UlPod.npemax;
v=UlPod.v;
NV=UlPod.NV;
PeL=SBKL.PeL;

%==========================================================================

omega_e_Pemax=(npemax.*pi)./30;
omega_e=(omega_e_Pemax./v(1,NV)).*v;
Me=PeL./omega_e;
figure(9)
[haxes,hline1,hline2]=plotyy(omega_e,PeL,omega_e,Me);
axes(haxes(1));
ylabel('Pe[kW]');
axes(haxes(2));
ylabel('Me[Nm]');
xlabel('\omega_e');
title('\fontsize{16} Dijagram zavisnosti snage i momenta pogonskog agregata izrazen preko Lajdermanove karakteristike P_{e}');
%--------------------------------------------------------------------------

SBKM.omega_e=omega_e;
SBKM.Me=Me;
SBKM.PeL=PeL;
end

