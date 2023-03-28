function [ test2 ] = testing
global UlPod  Ri SBKM  Izbor_ii  Izbor_i1
%Podaci potrebni za izradu vucnog dijagrama 
[UlPod] = DataInputConst;
[ Ri ] = DataOutput2;
[SBKM ] = DataOutput7;
[Izbor_ii] = DataOutput11;
[Izbor_i1] = DataOutput10;
rd=UlPod.rd;
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



for i=1:1:10
        for j=1:1:10
            Rrfv(j,i)=Rf(1,i)+Rv(1,i)+Ru(1,j);
        end
end 
for i=1:1:10
   figure(1)
   plot(v(1,:),Rrfv(i,:));
   hold on
end

      
test2.Ru=Ru;
test2.v=v;
test2.Rrfv=Rrfv;


end

