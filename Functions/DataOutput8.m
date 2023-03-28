function [ I0 ] = DataOutput8

global UlPod SBKL SBKM Km
%Ulazni podaci
%==========================================================================
PeL=SBKL.PeL;
etap=UlPod.etap;
rd=UlPod.rd;
v=UlPod.v;
i_pm=UlPod.i_pm;
omega_e=SBKM.omega_e;
v=UlPod.v;
Pr=Km.Pr;

%Racunsko odredjivanje prenosnog odnosa u glavnom prenosniku

i0r=(rd.*max(omega_e))./(max(v))./i_pm;

%Minimalne i maksimalne vrednosti prenosnog odnosa u odnosu na racunski
%+/- 1
%Dodata 0.1 razlika da bi mogao da se nađe presek 2 tačke.
i0min=i0r-1.1;
i0max=i0r+1.1;
i0=i0min:0.5:i0max;

%Odredjivanje prenosnog odnosa u glavnom prenosniku i0
Po=PeL.*etap;
Poit=[Po Po(1,1)];
    for it=1:5
        Vi0(it,:)=(omega_e(1,:).*rd)./(i0(1,it)*i_pm);
    end
    for it=1:5
        Vi0it(it,:)=[Vi0(it,:) (max(Vi0(it,:)) + 5)];
    end
% %--------------------------------------------------------------------------
% % %%
% %Petlja koja sluzi za odredjivanje maksimalne brzine i graficki prikaz u funkciji prenosnog
% %odnosa u glavnom prenosniku
for it=1:5
    figure(10)
    hold on
    plot(Vi0it(it,:),Poit,'k',v,Pr,'b');
    xlabel('v[m/s]');
    ylabel('P[W]');
    legend('P_{ei}','P_{r}');
    title('\fontsize{16}Odredjivanje maksimalne brzine vozila u funkciji prenosnog odnosa glavnog prenosnika I_{0}');
    [xis(it),yis(it)]=curveintersect(Vi0it(it,:),Poit,v,Pr);
    debugValx= xis(it);
    debugValy= yis(it);
    Vmaxi0=xis;
end
I0.Vmaxi0=Vmaxi0;
I0.i0=i0;
end

