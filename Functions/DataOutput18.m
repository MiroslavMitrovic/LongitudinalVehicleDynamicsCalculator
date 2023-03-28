function [ SV ] = DataOutput18
global UlPod 

%Ulazni podaci
%==========================================================================
V=UlPod.v;
g=UlPod.g;
phi=UlPod.phi;
%Unosenje vrednosti bocnog nagiba puta beta[deg]
InputStr_beta=input('Unesi brojevnu vrednost bocnog nagiba puta polazeci od negativne(pr:-15):  ','s');
%String konvertujemo u brojevnu vrednost 
beta_ul= str2num(InputStr_beta);

beta=beta_ul:5:15;
   
    


%Poluprecnik krivine izveden preko granicne brzine pri 
%bocnom nagibu puta beta=0;
%==========================================================================
R=(V.^2)./(g.*phi); %poluprecnik krivine 

%Granicna brzina kretanja vozila na putu sa konstantnim poluprecnikom
%krivine i razlicitim nagibima puta
%==========================================================================
for i=1:1:10
    for j=1:1:7
a(j,i)=(g.*(phi+tand(beta(1,j))).*R(1,i));
b(1,j)=(1-(phi.*tand(beta(1,j))));
    V_gr(j,i)=(a(j,i)./b(1,j)).^(1./2);
    end

    
%Izlaz iz funkcije
%==========================================================================

end

for i=1:1:7
    figure(25)
    hold on
    xlabel('R[m]');
    ylabel('V_{gr}[m/s]');
    title('\fontsize{16}Granicna brzina kretanja vozila u slucaju gubitka stabilnosti, u krivini konstantnog poluprecnika, sa promenom bocnog nagiba puta');
    legend('\beta_{i}');
    plot(R(1,:),V_gr(i,:));
  end
SV.beta=beta;
SV.R=R;
SV.V_gr=V_gr;


end

