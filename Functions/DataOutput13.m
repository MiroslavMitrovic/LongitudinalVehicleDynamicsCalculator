function [ DinKar2 ] = DataOutput13
%Dinamicka karakteristika
global  VucDij KoefandL
%Ulazni podaci
%==========================================================================
Fo=VucDij.Fo;
G=VucDij.G;
Vi=VucDij.Vi;
kA=KoefandL.kA;
    for i=1:1:5
        for j=1:1:10
            Rvi(i,j)=kA.*(Vi(i,j)).^2;
        end
    end
    


    for i=1:1:5
        for j=1:1:10
            Doi(i,j)=(Fo(i,j)-Rvi(i,j))./G;
      
      
        end
     figure(18)
      hold on    
      grid on
            plot(Vi(i,:),Doi(i,:));
            xlabel('v[m/s]');
            ylabel('D_{o}[/]');
            legend('D_{o}'); 
            title('\fontsize{16} Dinamicka karakteristika u razlicitim stepenima prenosa D_{o} ');
        
       end
  DinKar2.Rvi=Rvi;
  DinKar2.Doi=Doi;

end

