function [ I0Analysis ] = DataOutput9
%%
global UlPod SBKM I0 KoefandL

%Ulazni podaci
%==========================================================================
etap=UlPod.etap;
i_pm=UlPod.i_pm;
i0=I0.i0;
rd=UlPod.rd;
Me=SBKM.Me;
omega_e=SBKM.omega_e;
PeL=SBKM.PeL;
mukopt=UlPod.mukopt;
g=UlPod.g;
k=KoefandL.k;
A=UlPod.A;
f0=UlPod.f0;

%Analiza i0 preko dijagrama Fomax, amax, Domax, Vmax
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Obimna sila Fo=(Memax*etap*i_pm*i0)/rd [N]
Fomaxi0=(max(Me)*etap*i_pm).*(i0./rd);

%--------------------------------------------------------------------------
%Ugaona brzina pri maksimalnom obrtnom momentu omega_Me_max [rad/s]
%Finterp = griddedInterpolant(Me,omega_e);
%omega_Me_max = Finterp(max(Me));
MeSize = size(Me);
for cnt=MeSize(1,2)./2:1:MeSize(1,2)
Me(1,cnt)=Me(1,cnt) + 0.01; % konstrukcija unikatnih vrednosti druge polovine krive zbog interp1 funkcije
end
omega_eSize = size(omega_e);
for cnt=omega_eSize(1,2)/2:1:omega_eSize(1,2)
Me(1,cnt)=Me(1,cnt) + 0.01; % konstrukcija unikatnih vrednosti druge polovine krive zbog interp1 funkcije
end
omega_Me_max=interp1(Me,omega_e,max(Me));
%--------------------------------------------------------------------------
%Brzina pri maksimalnoj snazi V_Pe_max
Vmaxi0=I0.Vmaxi0;
Vmaxi0=Vmaxi0(end:-1:1);

%--------------------------------------------------------------------------
%Brzina pri maksimalnom obrtnom momentu motora
%V_Me_max=(omega_Me_max/omega_Pe_max)*V_Pe_max
V_Me_max=(omega_Me_max./max(omega_e)).*Vmaxi0;
%--------------------------------------------------------------------------
%Vrednosti maksimalne dinamicke karakteristike za razlicite vrednosti
%prenosnog odnosa u glavnom prenosniku
%Do_max_i0=(Pemax*etap/V_Me_max)-k*A*V_Me_max^2
Do_max_i0=(((max(PeL)).*etap./V_Me_max)-(k*A).*(V_Me_max).^2)./(mukopt*g);
%--------------------------------------------------------------------------
%Koeficient obrtnih masa delta=1.04+0.03*i_m
delta=1+(i0.*0.02)+0.045;
%--------------------------------------------------------------------------
%Koeficient otpora kotrljanja za brzinu pri maksimalnom momentu f_V_Me_max
f_V_Memax=f0+(0.5/10^6).*(V_Me_max.*3.6).^2;
%--------------------------------------------------------------------------
%Maksimalno ubrzanje a_max [m/s^2] 
%za izabrani prenosni odnos u glavnom prenosniku
%a_max=(g/delta)*(Domax-f_V_Me_max)
a_max=(g./delta).*(Do_max_i0-f_V_Memax);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%crtanje dijagrama
figure(11)
plot(i0,Fomaxi0);
xlabel('i0[-]');
ylabel('F[N]');
legend('F_{oMaxI0}');
title('\fontsize{16}Analiza izbora prenosnog odnosa glavnog prenosnika I_{0}');

figure(12)
plot(i0,Vmaxi0);
xlabel('i0[-]');
ylabel('V[m/s]');
legend('V_{MaxI0}');
title('\fontsize{16}Analiza izbora prenosnog odnosa glavnog prenosnika I_{0}');

figure(13)
plot(i0,Do_max_i0);
xlabel('i0[-]');
ylabel('Do[m/s]');
legend('D_{oMaxI0}');
title('\fontsize{16}Analiza izbora prenosnog odnosa glavnog prenosnika I_{0}');

figure(14)
plot(i0,a_max);
xlabel('i0[-]');
ylabel('a[m/s^{2}]');
legend('a_{MaxI0}');
title('\fontsize{16}Analiza izbora prenosnog odnosa glavnog prenosnika I_{0}');



%--------------------------------------------------------------------------
I0Analysis.Fomaxi0=Fomaxi0;
I0Analysis.omega_Me_max=omega_Me_max;
I0Analysis.Vmaxi0=Vmaxi0;
I0Analysis.V_Me_max=V_Me_max;
I0Analysis.Do_max_i0=Do_max_i0;
I0Analysis.delta=delta;
I0Analysis.f_V_Memax=f_V_Memax;
I0Analysis.a_max=a_max;
end

