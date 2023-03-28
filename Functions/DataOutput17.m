function [PKP] = DataOutput17

global  KoefandL UlPod

%Ulazni podaci 
%==========================================================================
m_ouk=UlPod.mukopt;
V=UlPod.v;
g=UlPod.g;
% phi=UlPod.phi;
h_c=UlPod.hc;
l=UlPod.l;
l_p=KoefandL.lp;
l_z=KoefandL.lz;
% f=KoefandL.f;
alpha=0;
f=0.02;
phi=0.5:0.1:0.9;

%U funkciji od koeficienta prijanjanja
%%
%Granicna vrednost kocne sile
%==========================================================================
F_kphi=m_ouk.*g.*phi;




%Normalne reakcije tla
%==========================================================================
%Pri kocenju zadnjim tockovima
Z_zzt=m_ouk.*g.*cosd(alpha).*(l_p./(l+(phi.*h_c)));
Z_pzt=m_ouk.*g.*cosd(alpha)-Z_zzt;
%Pri kocenju prednjim tockovima
Z_ppt=(m_ouk.*g.*cosd(alpha).*l_z)./(l-(phi.*h_c));
Z_zpt=m_ouk.*g.*cosd(alpha)-Z_ppt;
%Pri kocenju svim tockovima
Z=m_ouk.*g.*cosd(alpha);


%Maksimalne sile kocenja 
%==========================================================================
%Pri kocenju samo zadnjim tockovima
F_kzphi=Z_zzt.*phi;
%Pri kocenju samo prednjim tockovima
F_kpphi=Z_ppt.*phi;
%Pri kocenju svim tockovima
F_kphi=m_ouk.*g.*phi;

%Maksimalno usporenje pri kocenju
%==========================================================================
%Samo zadnjim tockovima
a_zmax=(1./m_ouk).*(F_kzphi+(m_ouk.*g.*f));
%Samo prednjim tockovima
a_pmax=(1./m_ouk).*(F_kpphi+(m_ouk.*g.*f));
%Svim tockovima
a_max=(1./m_ouk).*(F_kphi+(m_ouk.*g.*f));

%Minimalni put kocenja (pri Rv=0 i alpha=0)
%==========================================================================
%Samo zadnjim tockovima 
S_zmin=(max(V).^2)./(2.*a_zmax);
%Samo prednjim tockovima
S_pmin=(max(V).^2)./(2.*a_pmax);
%Svim tockovima 
S_min=(max(V).^2)./(2.*a_max);


%Crtanje dijagrama 
%==========================================================================
%Zaustavni put u funkciji brzine i prijanjanja
for i=1:1:5
S_minp(i,:)=(V(1,:).^2)./(2.*a_max(1,i));
S_pminp(i,:)=(V(1,:).^2)./(2.*a_pmax(1,i));
S_zminp(i,:)=(V(1,:).^2)./(2.*a_zmax(1,i));

end
for i=i:1:5
figure(23)
hold on
xlabel('v[m/s]');
ylabel('S_{min}[m]');
plot(V(1,:),S_minp(i,:),'-k');
plot(V(1,:),S_pminp(i,:),'-m');
plot(V(1,:),S_zminp(i,:),'-c');
legend('S_{minp}','S_{pminp}','S_{zminp}');
title('\fontsize{16}Minimalni put zaustavljanja u funkciji od brzine vozila');
end





%Izlaz iz funkcije
%==========================================================================
PKP.phi=phi;
PKP.F_kphi=F_kphi;
PKP.Z_zzt=Z_zzt;
PKP.Z_pzt=Z_pzt;
PKP.Z_ppt=Z_ppt;
PKP.Z_zpt=Z_zpt;
PKP.Z=Z;
PKP.F_kzphi=F_kzphi;
PKP.F_kpphi=F_kpphi;
PKP.F_kphi=F_kphi;
PKP.a_zmax=a_zmax;
PKP.a_pmax=a_pmax;
PKP.a_max=a_max;
PKP.S_zmin=S_zmin;
PKP.S_pmin=S_pmin;
PKP.S_min=S_min;
PKP.S_minp=S_minp;
PKP.S_pminp=S_pminp;
PKP.S_zminp=S_zminp;
end

