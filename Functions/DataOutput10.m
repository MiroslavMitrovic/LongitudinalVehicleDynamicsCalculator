function [Izbor_i1] = DataOutput10

global UlPod  SBKM Ri KoefandL I0

%Ulazni podaci 
%==========================================================================

mukopt=UlPod.mukopt;
g=UlPod.g;
rd=UlPod.rd;
etap=UlPod.etap;
psimax=max(Ri.psi);
phi=UlPod.phi;
Me=SBKM.Me;
%Uzimamo izračunati, treba dodati izbor od nekih vrednosti koje su
%izračunate ili ponuditi unos nove vrednosti.
i0=I0.i0(1,3);
Zzst=KoefandL.Zzst;
G=mukopt*g;

%Izbor prenosnog odnosa prve brzine na osnovu uslova maksimalnog uspona

% prenosni odnos prve brzine
i1=(G*psimax*rd)./(max(Me)*etap*i0);
%Izvedeno iz jednačine prijanjanja
 Fo1max=(max(Me).*etap.*i1.*i0)./rd;
% maksimalna obimna sila na kretacu u prvom stepenu prenosa

% 
% maksimalna sila prijanjanja
Xt=Zzst*phi;

%Izbor vrednosti prenosnog odnosa prve brzine na osnovu manje vrednosti od
%dva uslova navedena iznad
%Ovo treba popraviti, trebalo bi možda na kraju računati prenosni odnos
%prvog stepena prenosa na osnovu željene brzine(kako najbrže dostići
%određenu brzinu) i geometrijske progresije.

  %  if Fo1max<Xt
    if Fo1max>Xt

    else
        i1=(Xt.*rd)./(max(Me)*etap*i0);
         Fo1max=(max(Me).*etap.*i1.*i0)./rd;
        psimax=Fo1max./(G);
       
    end
Izbor_i1.G=G;    
Izbor_i1.psimax=psimax;  
Izbor_i1.i0=i0;    
Izbor_i1.i1=i1;
Izbor_i1.Fo1max=Fo1max;
Izbor_i1.Xt=Xt;


end

