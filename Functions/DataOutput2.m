function [ Ri ] = DataOutput2

global KoefandL UlPod

%Spoljni otpori
%--------------------------------------------------------------------------
%Rf             [N]         otpor kotrljanja
%Rv             [N]         otpor vazduha
%Ru             [N]         otpor uspona
%psi            [-]         koeficient ukupnog otpora puta
%--------------------------------------------------------------------------
%Ulazni podaci
%==========================================================================
G=KoefandL.G;
f=KoefandL.f;
kA=KoefandL.kA;
u=UlPod.u;
v=UlPod.v;



%otpor kotrljanja [N]
Rf=G*f;
Ri.Rf=Rf;

figure(1)

plot(v,Rf);
title('\fontsize{16}Otpor kotrljanja R_{f}');
xlabel('v[m/s]');
ylabel('R_{f}[N]');

%otpor vazduha [N]
Rv=kA.*v.^2;
Ri.Rv=Rv;
figure(2)

plot(v,Rv);
title('\fontsize{16}Otpor vazduha R_{v}');
xlabel('v[m/s]');
ylabel('R_{v}[N]');

%ugao uspona alpha [deg]
alpha=atand(u./100);
Ri.alpha=alpha;
%otpor uspona [N]
Ru=G*sind(alpha);
Ri.Ru=Ru;

figure(3)

plot(u,Ru);
title('\fontsize{16}Otpor uspona R_{u}');
xlabel('u[%]');
ylabel('R_{u}[N]');
%Koeficient ukupnog otpora puta [-]
psi=f.*cosd(alpha)+sind(alpha);
Ri.psi=psi;
Rpsi=G.*(f.*cosd(alpha)+sind(alpha));
Ri.Rpsi=Rpsi;
Ruk=Rpsi+Rv(10:-1:1);
Ri.Ruk=Ruk;
end

