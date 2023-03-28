function [ Ubrzanje ] = DataOutput16
global DinKar2  Ri Izbor_ii VucDij 

%Ulazni podaci
%==========================================================================
Vi=VucDij.Vi;
D_oi=DinKar2.Doi;
psi=Ri.psi;
i_1=Izbor_ii.i1;
i_2=Izbor_ii.i2;
i_3=Izbor_ii.i3;
i_4=Izbor_ii.i4;
i_5=Izbor_ii.i5;
i_i=[i_1,i_2,i_3,i_4,i_5];
g=9.81;
%Odredjivanje koeficienta uticaja rotirajucih masa
%==========================================================================
for i=1:5
delta_i(1,i)=1+(i_i(1,i).*0.04)+0.025;
end

%Odredjivanje ubrzanja u stepenu prenosa 
%==========================================================================
figure(20)
hold on

for i=1:5
    for j=1:10
    a(i,j)=(D_oi(i,j)-min(psi)).*(g./delta_i(1,i));
    a_recip(i,j)=1./a(i,j);
    end
    plot(Vi(i,:),a(i,:));
    xlabel('v[m/s]');
    ylabel('a[m/s^{2}]');
    title('\fontsize{16}Ubrzanje u pojedinim stepenima prenosa u zavisnosti od brzine ');
    legend('a_{i}');
end

for i=1:5
   figure(21)
    hold on
    axis([0 40 0 3 ])
    plot(Vi(i,:),a_recip(i,:))
    xlabel('v[m/s]');
    ylabel('1/a [s^{2}/m]');
end
%Izracunavanje vremena zaleta 
%Treba napraviti krivu i funkciju putem metode najmanjih kvadrata radi što
%tačnije estimacije. Nakon toga tu istu krivu integraliti u određenom
%intervalu.
%==========================================================================
V=sort([Vi(1,:),Vi(2,:),Vi(3,:),Vi(4,:),Vi(5,:)],'ascend');
a_rp=sort([a_recip(1,:),a_recip(2,:),a_recip(3,:),a_recip(4,:),a_recip(5,:)],'ascend');
figure(22)
axis([0 60 0 12]);
   xlabel('v[m/s]');
    ylabel('1/a [s^{2}/m]');
hold on
plot(V,a_rp);
%Transpose the data for function creation 
Vt=V.';
a_rpt=a_rp.';
%Fit the data to a function to be passed to integral values
f =fit(Vt,a_rpt,'poly2');
plot(f);
% pStruct = f.p;
p1= f.p1;
p2= f.p2;
p3= f.p3;
fun = @(x) p1.*(x.^2) + p2.*x + p3 ;
a_rpPlot = p1.*(V(1,:).^2) + p2.*V(1,:) + p3;

plot( V, a_rpPlot,'-r');    
A=0;
B=30;
C=50;
t_1=integral(fun,A,B);%Ubrzanje od 0-100km/h[s]
t_2=integral(fun,B,C);%Ubrzanje od 100-180km/h[s]

%Izlaz iz programa
%==========================================================================
Ubrzanje.V=V;
Ubrzanje.delta=delta_i;
Ubrzanje.Vi=Vi;
Ubrzanje.a=a;
Ubrzanje.a_rp=a_rp;
Ubrzanje.a_recip=a_recip;
Ubrzanje.t_1=t_1;
Ubrzanje.t_2=t_2;
% Ubrzanje.Area1=Area1;
% Ubrzanje.Area2=Area2;
% Ubrzanje.Area3=Area3;
% Ubrzanje.Area4=Area4;
% Ubrzanje.Area5=Area5;
% Ubrzanje.Areauk=Areauk;
end

