function [ VucDij] =DataOutput12
global UlPod  Ri SBKM  Izbor_ii  Izbor_i1
%Podaci potrebni za izradu vucnog dijagrama 
%==========================================================================
rd=UlPod.rd;
N=UlPod.N;
NV=UlPod.NV;
v=UlPod.v;
Rf=Ri.Rf;
Rv=Ri.Rv;
Ru=Ri.Ru;
etap=UlPod.etap;
Me=SBKM.Me;
omega_e=SBKM.omega_e;
Pe=SBKM.PeL;
i0=Izbor_ii.i0;
i1=Izbor_ii.i1;
i2=Izbor_ii.i2;
i3=Izbor_ii.i3;
i4=Izbor_ii.i4;
i5=Izbor_ii.i5;
I=[i1 i2 i3 i4 i5];
G=Izbor_i1.G;  
%Ukupni otpori
    for i=1:1:NV
        for j=1:1:NV
             Rr(j,i)=Rf(1,i)+Rv(1,i)+Ru(1,j);
 
        end 

    end
    for i=1:1:NV
 figure(17)
   plot(v(1,:),Rr(i,:),'--');
   hold on
   axis([0 70 0 7500])
   xlabel('v[m/s]');
   ylabel('F, R [N]');
   title('\fontsize{16} Vucni dijagram');
    end
%Obimne sile i brzine u pojedinim stepenima prenosa

    for i=1:1:N
        
        for j=1:1:NV
            Fo(i,j)=Me(1,j).*etap.*i0.*I(1,i)./rd;
        end
    end
    
     for i=1:1:N
        
        for j=1:1:NV
            Vi(i,j)=(rd.*omega_e(1,j))./(i0.*I(1,i));
   
        end
         
     plot(Vi(i,:),Fo(i,:));

     end
  %Idealna karakteristika sile 
 Foh=max(Pe).*etap./v;
 plot(v,Foh,'-r');
       
%Izlaz iz funkcije
%==========================================================================
VucDij.G=G;
VucDij.I=I;  
VucDij.omega_e=omega_e;            
VucDij.Me=Me;
VucDij.Rf=Rf;     
VucDij.Rv=Rv;     
VucDij.Ru=Ru;    
VucDij.Rr=Rr;
VucDij.Fo=Fo;
VucDij.Foh=Foh;
VucDij.Vi=Vi;
end

