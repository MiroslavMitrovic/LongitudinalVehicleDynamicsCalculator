function [ izbor_ii ] = DataOutput11
% Odredjivanje ostalih prenosnih odnosa menjackog prenosnika preko
% geometrijske progresije 
% Dosta zastareo način, treba implementirati promenu logike, da se stepeni
% prenosa računaju na osnovu radnog opsega motora od omegaMeMax do
% omegaPeMax odnosno da se odredi kritični faktor prenosnog odnosa gde se
% prilikom spuštanja stepena transmisije taj odnos ne pređe i motor se ne
% prevrti.

global Izbor_i1 UlPod
%Ulazni podaci
%==========================================================================
N=UlPod.N;
%==========================================================================
%Konkretan problem je u tome kako da napisem da funkcija prepozna u kom je
%stepenu prenosa direktan prenos (i=1) i do njega da racuna prvu geometrijsku
%progresiju, a ako posle direktnog ima n broja overdrive prenosnih odnosa 
%za njih da racuna drugu geometrijsku progresiju sa direktnim prenosnim 
%odnosom kao prvim clanom te druge geometrijske progresije.
%Takodje poslednji stepen prenosa (prenosni odnos) u menjackom prenosniku
%mora da zadrzi svoju zadatu vrednost, u ovom slucaju je to prenosni odnos 
%petog stepena prenosa(overdrive) koji je zadat u ulaznim podacima, i ta
%vrednost mora da se ubaci nekako u racunanje druge geometrijske progresije
%Drugi uočen problem je vezan za logiku računanja prvog stepena prenosa,
%koja je neupotrebljiva u slučaju uzimanja karakteristika novijih SUS
%motora sa većom snagom. Npr za 150kW motor Prenosni odnos može biti 0.6
%što svakako nije realno...
%==========================================================================
%Prvi je usvojen preko uslova maksimalnog uspona ili uslova maksimalnog
%prijanjanja

i1=Izbor_i1.i1;
i4=1;
%Poslednji stepen prenosa, zadrzan iz ulaznih podataka
i5=UlPod.i_pm;
i0=Izbor_i1.i0;


%Pokusaj mog resenja ovog problema za slucaj unesenih podataka koji radi
% u slucaju kada nema direktnog prenosa, ili je direktan prenos u
%cetvrtom stepenu prenosa menjaca sa 5 stepeni prenosa(jedan prenos je
%overdrive)
%Faktor geometrijske progresije 

    %Prenosni odnos u cetvrtom stepenu prenosa je direktan, zbog toga je i4=1
    if (N==5 && i4==1)
    N=N-2;
    end
    
    %Faktor se racuna do 4 stepena prenosa, a posto imamo 5 stepeni prenosa
    %kao ulaz a faktor q racunamo kao koren iz eksponenta broja clanova N-1,
    % pod korenom se nalazi prva i poslednja vrednost niza
    if i4==1
        q=(i1./i4).^(1./(N));
        %U mom slucaju je poslednji stepen prenosa 5 stepen, tako da nema
        %potrebe za izracunavanjem druge geometrijske progresije, ali ako
        %bi vozilo bilo npr. sa sest ili sedam stepeni prenosa i dva
        %overdrive prenosna odnosa onda bi morali da racunamo drugi faktor
        %progresije i geometrijsku progresiju koja ide od direktnog stepena
        %prenosa do poslednjeg stepena prenosa
    else
        %ovo je opsti slucaj kada nema direktnog stepena prenosa
        q=(i1./i_pm).^(1./(N-1));
    end
    
%Vrednosti stepena prenosa dobijenih preko faktora geometrijske  progesije
    
%i1 je usvojen iz prethodne funkcije koja ga racuna               
i2=i1./q;   %Prenosni odnos drugog stepena prenosa

i3=i2./q;   %Prenosni odnos treceg stepena prenosa
%i4 je direktan stepen prenosa
%i5=i_pm poslednji stepen prenosa menjackog prenosnika, pa se zato ne
%racuna jer mora da zadrzi istu vrednost
%==========================================================================
%Pitanje da li ovo moze da se autmatizuje, ili mora nekako da se ogranicim
%prilikom unosa podataka, mozda da napravim funkcije ponaosob i onda preko
%uslova za date podatke pozivam te funcije u glavnom programu?
%==========================================================================
izbor_ii.Ii=[i1,i2,i3,i4,i5];
izbor_ii.i0=i0;    
izbor_ii.q=q;
izbor_ii.i1=i1;
izbor_ii.i2=i2;
izbor_ii.i3=i3;
izbor_ii.i4=i4;
izbor_ii.i5=i5;

%zapsisivanje podataka u .xls datoteku
%==========================================================================
A={'q','i1','i2','i3','i4','i5'};
xlswrite('VucniProracun.xls', A, 'Izbor i_i', 'A1');
B=[q,i1,i2,i3,i4,i5];
xlswrite('VucniProracun.xls', B, 'Izbor i_i', 'A2');

end

