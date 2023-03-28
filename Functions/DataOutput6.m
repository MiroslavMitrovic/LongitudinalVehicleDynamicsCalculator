function [ DinKar ] = DataOutput6
global UlPod SBKL
%Ulazni podaci
%==========================================================================
PeL=SBKL.PeL;
etap=UlPod.etap;
v=UlPod.v;
mukopt=UlPod.mukopt;
g=UlPod.g;

%Dinamicka karakteristika u poslednjem stepenu prenosa Do[-]
Do=(PeL.*etap./v)./(mukopt*g);
%OBAVEZNO OBRATI  PAZNJU NA PSI I POGLEDAJ DAL JE LEPO NAVEDEN(NAPISAN OVAJ USLOV)
Dolog=Do>psi(1:10);
 
%Videti da li ispunjava uslov Domax>Dodoz i ako ne, ili promeniti vrednosti
%C1 i C2, smanjiti Vmax, Povecati Pemax...
DinKar.Do=Do;
DinKar.Dolog=Dolog;

%==========================================================================
A={'v[m/s]','D_o[/]','D_olog'};
At=A';
xlswrite('VucniProracun.xls', At, 'SBKL', 'B15');
B=[v;Do;Dolog];
xlswrite('VucniProracun.xls', B, 'SBKL', 'C15');

end

