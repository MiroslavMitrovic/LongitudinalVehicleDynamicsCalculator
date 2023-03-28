function [UlPod] = DataInputConst

%Ulazni podaci
%--------------------------------------------------------------------------------
%% Pregled koriscenih oznaka:
% f               [-]         koeficient otpora kotrljanja
% rd              [m]         dinamicki poluprecnik tocka
% phi             [-]         koeficient prijanjanja
% etap            [-]         stepen korisnosti sistema za prenos snage
% k               [kg/m^3]    redukovani koeficient otpora vazduha
% Cx              [-]         koeficient otpora vazduha
% rho             [kg/m^3]    gustina vazduha
% A               [m^2]       ceona povrsina vozila
%kA               [mg/m]      faktor aerodinamicnosti
%mukopt           [kg]        ukupna masa vozila u opterecenom stanju
%mukneopt         [kg]        ukupna masa vozila u neopterecenom stanju
%lp               [m]         rastojanje prednje osovine od tezista 
%lz               [m]         rastonjanje zadnje osovine od tezista
%l                [m]         ukupno medjuosovinsko rastojanje
%hc               [m]         visina tezista
%Gpst             [N]         staticka tezina vozila na prednjoj osovini 
%Gzst             [N]         staticka tezina vozila na zadnjoj osovini
%G                [N]         ukupna tezina vozila 
%RWR               [-]         odnos tezine na zadnjoj osovini i ukupne tezine
%Zpst             [N]         reakcija tla na prednjoj osovini 
%Zzst             [N]         reakcija tla na zadnjoj osovini
%Z                [N]         ukupna reakcija tla
%g                [m/s^2]     gravitaciono ubrzanje koja iznosi 9,81
%FLR              [-]         odnos rastojanja tezista od prednje osovine i
%                             ukupnog medjuosovinskog rastojanja
%RLR              [-]         odnos rastojanja tezista od zadnje osovine i
%                             ukupnog medjuosovinskog rastojanja
%V                [m/s]       brzina kretanja vozila
%u                [%]         procentualne vrednosti uspona
%npemax           [min^-1]    broj obrtaja KV pri maksimalnoj snazi
%N                [-]         ukupan broj stepeni prenosa
%i_1ul             [-]         prenosni odnos prvog stepena prenosa dat u
%podacima za vozilo
%i_2ul             [-]         prenosni odnos drugog stepena prenosa dat u
%podacima za vozilo
%i_3ul             [-]         prenosni odnos treceg stepena prenosa dat u
%podacima za vozilo
%i_4ul             [-]         prenosni odnos cetvrtog stepena prenosa dat u
%podacima za vozilo
%i_5ul             [-]         prenosni odnos petog stepena prenosa dat u
%podacima za vozilo
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Primer za unos broja stepeni prenosa
%--------------------------------------------------------------------------
% koristi se naredba 'input' za unos preko komandne linije
% opcija 's' se odnosi na to da izlazni parametar bude string
% zatim se koristi komanda 'str2num' za pretvaranje stringa u numericki
% zapis 
% program sam pisao ovako radi lakseg pracenja, inace je racionalnije:
% % N=str2num(input('Unesi broj stepeni prenosa N:','s'));
% InputStr_XXX moze kasnije da se koristi za ispis u nekoj datoteci
InputStr_N=input('Unesi broj stepeni prenosa N:  ','s');
N = str2num(InputStr_N);
% deklaracija vektora prenosnih odnosa u prenosniku
i_p=ones(N,1,'double');
% unos vrednosti poslednjeg stepena prenosa
InputStr_i_pm=input('Prenosni odnos poslednjeg stepena prenosa i_pm:  ','s');
i_pm = str2num(InputStr_i_pm);
% postavljenje brojaca za broj stepeni prenosa
for i=1:1:(N)
    % unos za stepene prenosa 1:(N-1)
    if i < N
        DisplayStr=sprintf('Prenosni odnos %d%-20s', i, '. stepena prenosa:  ');
        InputStr_i_p=input(DisplayStr,'s');
        i_p(i,1)=str2double(InputStr_i_p);
% i eksplicitno, i_p(N,1)=i_pm
    elseif i==N
        DisplayStr=sprintf('Prenosni odnos %d%-20s%d%-9s', i, '. stepena prenosa:  ',i_pm,'  (=i_pm)');
        disp(DisplayStr);
        i_p(i,1)=i_pm;
    end
end
  
%==========================================================================
%Unosenje vrednosti brzine po intervalima
InputStr_NV=input('Unesi broj intervala brzine NV:  ','s');
%String konvertujemo u brojevnu vrednost 
NV = str2num(InputStr_NV);
%Deklaracija vektora brzine 
v=zeros(1,NV,'double');
%deklaracija vektora uspona
u=zeros(1,NV,'double');
%brojac za intervale brzine i uspona
for i=1:1:(NV)
        %brzina
        DisplayStr=sprintf('vrednost %d%-20s', i, '. intervala brzine:  ');
        InputStr_v=input(DisplayStr,'s');
        v(1,i)=str2double(InputStr_v);
        
end
for i=1:1:(NV)
        %uspon
        DisplayStr=sprintf('vrednost %d%-20s', i, '. intervala uspona:  ');
        InputStr_u=input(DisplayStr,'s');
        u(1,i)=str2double(InputStr_u);
end
%=============================================================================
    
%Unosenje vrednosti dinamickog poluprecnika tocka rd[m]
InputStr_rd=input('Unesi brojevnu vrednost dinamickog poluprecnika tocka rd u [m]:  ','s');
%String konvertujemo u brojevnu vrednost 
rd = str2num(InputStr_rd);
%-----------------------------------------------------------------------------
%Unosenje vrednosti koeficienta prijanjanja phi[-]
InputStr_phi=input('Unesi brojevnu vrednost koeficienta prijanjanja:  ','s');
%String konvertujemo u brojevnu vrednost 
phi = str2num(InputStr_phi);
%-----------------------------------------------------------------------------
%Unosenje vrednosti stepena korisnosti transmisije etap
InputStr_etap=input('Unesi brojevnu vrednost stepena iskoriscenja transmisije:  ','s');
%String konvertujemo u brojevnu vrednost 
etap = str2num(InputStr_etap);
%-----------------------------------------------------------------------------
%Unosenje vrednosti koeficienta otpora vazduha
InputStr_Cx=input('Unesi brojevnu vrednost koeficienta otpora vazduha Cx:  ','s');
%String konvertujemo u brojevnu vrednost 
Cx = str2num(InputStr_Cx);
%Cx=0.32;
%------------------------------------------------------------------------------
%Unosenje vrednosti gustine vazduha rho[kg/m^3]
InputStr_rho=input('Unesi brojevnu vrednost gustine vazduha u [kg/m^3]:  ','s');
%String konvertujemo u brojevnu vrednost 
rho = str2num(InputStr_rho);
%rho=1.29;
%------------------------------------------------------------------------------
%Unosenje vrednosti prednje ceone povrsine vozila u [m^2]
InputStr_A=input('Unesi brojevnu vrednost prednje ceone povrsine vozila u [m^2]:  ','s');
%String konvertujemo u brojevnu vrednost 
A = str2num(InputStr_A);
%A=1.86;
%------------------------------------------------------------------------------
%Unosenje vrednosti medjuosovinskog rastojanja [m]
InputStr_l=input('Unesi brojevnu vrednost medjuosovinskog rastojanja [m]:  ','s');
%String konvertujemo u brojevnu vrednost 
l= str2num(InputStr_l);
%l=2.57;
%------------------------------------------------------------------------------
%Unosenje vrednosti visine tezista u poduznoj osi vozila hc[m]
InputStr_hc=input('Unesi brojevnu vrednost visine tezista hc [m]:  ','s');
%String konvertujemo u brojevnu vrednost 
hc= str2num(InputStr_hc);
%hc=0.41;
%------------------------------------------------------------------------------
%Unosenje vrednosti ukupne mase vozila u opterecenom stanju [kg]
InputStr_mukopt=input('Unesi brojevnu vrednost kupne mase vozila u opterecenom stanju [kg]:  ','s');
%String konvertujemo u brojevnu vrednost 
mukopt= str2num(InputStr_mukopt);
%-------------------------------------------------------------------------------
%Unosenje vrednosti odnosa ukupne mase i mase na zadnjoj osovini [-]
InputStr_RWR=input('Unesi brojevnu vrednost odnosa ukupne mase i mase na zadnjoj osovini:  ','s');
%String konvertujemo u brojevnu vrednost 
RWR= str2num(InputStr_RWR);
%RWR=0.503;
%------------------------------------------------------------------------------


%Gravitaciona konstanta g[m/s^2]
g=9.81;

%mukopt=1600;
% v=[5 10 20 25 30 35 40 45 50 56.67];
% vr=[5 10 20 25 30 35 40 45 50 56.67 60 65 70];
%Unosenje vrednosti nultog koeficienta otpora kotrljanja f0[-]
InputStr_f0=input('Unesi brojevnu vrednost nultog koeficienta otpora kotrljanja f0:  ','s');
%String konvertujemo u brojevnu vrednost 
f0= str2num(InputStr_f0);
%-------------------------------------------------------------------------------
%f0=0.010;
% u=[4	8	12	20	24	28	32	35	38	41];
%Unosenje vrednosti maksimalne snage motora Pe[W]
InputStr_Pemaxzad=input('Unesi brojevnu vrednost maksimalne snage motora Pe[W]:  ','s');
%String konvertujemo u brojevnu vrednost 
Pemaxzad= str2num(InputStr_Pemaxzad);
% Pemaxzad=150000;
%------------------------------------------------------------------------------
%Unosenje vrednosti broja obrtaja pri maksimalnoj snazi npemax[min^1]
InputStr_npemax=input('Unesi brojevnu vrednost broja obrtaja pri maksimalnoj snazi npemax[min^1]:  ','s');
%String konvertujemo u brojevnu vrednost 
npemax= str2num(InputStr_npemax);
% npemax=6800;
%=============================================================================
%------------------------------------------------------------------------------
%Unosenje vrednosti sirine vozila b[m]
InputStr_b=input('Unesi brojevnu vrednost sirine vozila b[m]:  ','s');
%String konvertujemo u brojevnu vrednost 
b= str2num(InputStr_b);


%%
%==============================================================================
%Izlazni podaci
UlPod.rd=rd;
UlPod.phi=phi;
UlPod.etap=etap;
UlPod.Cx=Cx;
UlPod.rho=rho;
UlPod.A=A;
UlPod.mukopt=mukopt;
UlPod.l=l;
UlPod.hc=hc;
UlPod.RWR=RWR;
UlPod.g=g;
UlPod.v=v;
UlPod.f0=f0;
UlPod.u=u;
UlPod.Pemaxzad=Pemaxzad;
UlPod.npemax=npemax;
% UlPod.i_0=i_0;
UlPod.i_pm=i_pm;
UlPod.i_p=i_p;
% UlPod.vr=vr;
UlPod.N=N;
UlPod.NV=NV;
UlPod.b=b;


