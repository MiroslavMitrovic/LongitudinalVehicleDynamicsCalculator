function [ XLS ] = WriteDataOutput3
global  Km 

%Ulazni podaci
%==========================================================================
P_r=Km.Pr;
P_eopt=Km.Peopt;


%Zapis u .xls datoteku 
%==========================================================================
A={'P_r[W]','P_eopt[W]'};
At=A';
xlswrite('VucniProracun.xls', At, 'PotSnagZaOtp', 'A15');
B=[P_r;P_eopt];
xlswrite('VucniProracun.xls', B, 'PotSnagZaOtp', 'B15');

XLS.i=1; 
end

