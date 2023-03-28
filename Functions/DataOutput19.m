function [PV ] = DataOutput19
global UlPod SV

%Ulazni podaci 
%==========================================================================
g=UlPod.g;
b=UlPod.b;
h_c=UlPod.hc;
V=UlPod.v;
NV=UlPod.NV;
beta=SV.beta;

%Poluprecnik krivine izveden preko granicne brzine pri 
%bocnom nagibu puta beta=0;
%==========================================================================
R=((V.^2).*2.*h_c)./(g.*b); %poluprecnik krivine 

%Granicna brzina kretanja vozila na putu sa konstantnim poluprecnikom
%krivine i razlicitim nagibima puta
%==========================================================================
for i=1:1:10
    for j=1:1:7
x(j,i)=(R(1,i).*g).*(h_c.*tand(beta(1,j))+(b./2));
y(1,j)=(h_c-(b./2).*tand(beta(1,j)));
   V_gr(j,i)=(x(j,i)./y(1,j)).^(1./2);
    end
end
for i=1:1:7
    figure(26)
    hold on
    plot(R(1,:),V_gr(i,:));
    xlabel('R[m]');
    ylabel('V_{gr}[m/s]');
    title('\fontsize{16}Granicna brzina kretanja vozila u slucaju prevrtanja, u krivini konstantnog poluprecnika, sa promenom bocnog nagiba puta');
    legend('\beta_{i}');
end

%Izlazi iz funkcije
%==========================================================================
PV.R=R;
PV.beta=beta;
PV.V_gr=V_gr;

  

end

