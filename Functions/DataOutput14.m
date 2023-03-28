function [ DijSnag ] = DataOutput14
%%Crtanje dijagrama snage 

global UlPod VucDij SBKM Pi


%Ulazni podaci
%=========================================================================
r_d=UlPod.rd;
V=UlPod.v;
eta_p=UlPod.etap;
omega_e=SBKM.omega_e;
V_i=VucDij.Vi;
P_e=SBKM.PeL;
P_f=Pi.Pf;
P_v=Pi.Pv;
P_u=Pi.Pu;

%Potrebne snage za savladjivanje otpora
%==========================================================================
P_o=P_f+P_v;

for i=1:10
    for j=1:10
        P_r(i,j)=(P_o(1,j)+P_u(i,j))./eta_p;
    end
end


%Crtanje dijagrama
%==========================================================================
figure(19)
hold on
axis([0 60 0 120000])
xlabel('v[m/s]');
ylabel('P_{e} P_{r} [W]');
for i=1:5
plot(V_i(i,:),P_e(1,:));
end
for i=1:10
    
  plot(V(1,:),P_r(i,:),'--');
  title('\fontsize{16}Potrebne snage za savladjivanje pojedinih otpora');
end


%Izlazi iz funkcije
%==========================================================================

DijSnag.P_f=P_f; 
DijSnag.P_v=P_v;
DijSnag.P_u=P_u; 
DijSnag.P_r=P_r; 
DijSnag.V=V; 


end

