function [KoefandL] =DataInput1
 global UlPod
%Konstante
%==========================================================================
f0=UlPod.f0;
v=UlPod.v;
Cx=UlPod.Cx;
rho=UlPod.rho;
A=UlPod.A;
l=UlPod.l;
RWR=UlPod.RWR;
mukopt=UlPod.mukopt;
g=UlPod.g;
%--------------------------------------------------------------------------
%koeficient otpora kotrljanja [-]
f=f0+(0.5/10^6).*(v.*3.6).^2;
%redukovani koeficient otpora vazduha [kg/m^3]
k=Cx.*(rho./2);
%---------------------------------
%faktor aerodinamicnosti [kg/m]
kA=k.*A;
%---------------------------------
%rastojanje tezista od prednje osovine  [m]
lp=l.*RWR;
%rastojanje tezista od zadnje osovine  [m]
lz=l-lp;
%Odnos rastojanja tezista od prednje osovine[-]
FLR=lp./l;
%Odnos rastojanja tezista od zadnje osovine[-]
RLR=lz./l;
%Ukupna tezina vozila [N]
G=mukopt.*g;
%reakcija tla na prednjoj osovini   [N]
Zpst=G.*FLR;
%reakcija tla na zadnjoj osovini    [N]  
Zzst=G.*RLR;
KoefandL.f=f;
KoefandL.k=k;
KoefandL.lp=lp;
KoefandL.lz=lz;
KoefandL.FLR=FLR;
KoefandL.RLR=RLR;
KoefandL.G=G;
KoefandL.Zpst=Zpst;
KoefandL.Zzst=Zzst;


end

