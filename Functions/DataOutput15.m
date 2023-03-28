function [ MSU ] = DataOutput15

global DinKar2 KoefandL SBKM

%Ulazni podaci
%==========================================================================

D_oi=DinKar2.Doi;
f=KoefandL.f;
omega_e=SBKM.omega_e;

%Uspon u pojedinim stepenima prenosa 
%==========================================================================
y=1+(f).^2;
z=1-((D_oi).^2);
for i=1:5
    for j=1:10
a(i,j)=f(1,j).*((z(i,j)+f(1,j).^2).^(1/2));
b(i,j)=D_oi(i,j)-a(i,j);
sin_alpha(i,j)=b(i,j)./y(1,j);
    end
end

%Izlaz iz funkcije 
%==========================================================================

MSU.sin_alpha=sin_alpha;
end

