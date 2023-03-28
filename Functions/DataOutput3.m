function [ Pi ] = DataOutput3
global Ri UlPod
%Ulazni podaci
%==========================================================================
Rf=Ri.Rf;
u=UlPod.u;
v=UlPod.v;
NV=UlPod.NV;
Rv=Ri.Rv;
Ru=Ri.Ru;
Pi.u=u;
Pi.v=v;
%%Potrebna snaga za savladjivanje otpora
%--------------------------------------------------------------------------
%Pf         [N]         Snaga potrebna za savladjivanje otpora kotrljanja
%Pv         [N]         Snaga potrebna za savladjivanje otpora vazduha 
%Pu         [N]         Snaga potrebna za savladjivanje otpora uspona
%--------------------------------------------------------------------------
%Snaga kotrljanja
Pf=Rf.*v;
Pi.Pf=Pf;
figure(4)
plot(v,Pf);
title('\fontsize{16}Snaga potrebna za savladjivanje otpora kotrljanja P_{f}');
xlabel('v[m/s]');
ylabel('P_{f}[W]');
%Snaga otpora vazduha
Pv=Rv.*v;
Pi.Pv=Pv;
figure(5)
plot(v,Pv);
title('\fontsize{16}Snaga potrebna za savladjivanje otpora vazduha P_{v}');
xlabel('v[m/s]');
ylabel('P_{v}[W]');
%Snaga otpora uspona
%Podela po procentualnom usponu od najmanjeg ka najvecem
    for i=1:1:NV
        for j=1:1:NV
        Pu(i,j)=Ru(1,i).*v(1,j);
        end
        figure(6); 
        plot(v,Pu(i,:));
        hold on ;
        title('\fontsize{16}Snaga potrebna za savladjivanje otpora uspona P_{u}');
        xlabel('v[m/s]');
        ylabel('P_{u}[W]');
    end
Pi.Pu=Pu;

end

