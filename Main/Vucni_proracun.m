
%%Vucni proracun
%
% Univerzitet u Beogradu
% Masinski fakultet
% Katedra za motorna vozila
%
% Beograd, 11.2013.
% verzija: 1.0
%
% Miroslav Mitrovic
% -------------------------------------------------------------------------

%-------------------------------------------------------------------------
clear all;
close all;
clc;
global  KoefandL Ri Pi Km SBKL DinKar SBKM I0 I0Analysis UlPod Izbor_i1...
        Izbor_ii VucDij DinKar2 DijSnag MSU Ubrzanje PKP SV PV XLS


%% Test podaci:
%--------------------------------------------------------------------------
%==========================================================================
%Ulazni podaci
[UlPod] = DataInputConst;
%==========================================================================
%--------------------------------------------------------------------------
%%
%%Faktori, odnosi duzina i masa
[KoefandL] =DataOutput1;

%--------------------------------------------------------------------------
%%Otpori kretanju
[ Ri ] = DataOutput2;
%--------------------------------------------------------------------------
%%Potrebna snaga za savladjivanje otpora
[ Pi ] = DataOutput3;
%--------------------------------------------------------------------------
%Izbor karakteristika motora 
[ Km ] = DataOutput4;
%--------------------------------------------------------------------------
%%Spoljna brzinska karakteristika Preko Lajdermana
[ SBKL ] = DataOutput5;

%--------------------------------------------------------------------------
%%Dinamicka karakteristika u poslednjem stepenu prenosa
[ DinKar ] = DataOutput6;



%%Spoljna brzinska karakteristika motora
[SBKM ] = DataOutput7;


%Dijagram za izbor IO u funkciji od brzine 
[ I0 ] = DataOutput8;
   


%%
%Prikaz dijagrama sa vrednostima Fomax,amax,Vmax
[ I0Analysis ] = DataOutput9;

%%Izbor prenosnog odnosa u prvom stepenu prenosa
[Izbor_i1] = DataOutput10;
%==========================================================================

%Izbor prenosnog odnosa u ostalim nepoznatim stepenima prenosa
[Izbor_ii] = DataOutput11;
%==========================================================================
%Dijagram vuce 
%==========================================================================
[ VucDij] =DataOutput12;

%Dinamicka karakteristika
%==========================================================================
[ DinKar2 ] = DataOutput13;

%Dijagram snage
%==========================================================================
[ DijSnag ] = DataOutput14;

%Mogucnost savladjivanja uspona u pojedinim stepenima prenosa
%==========================================================================
[ MSU ] = DataOutput15;

%Ubrzanje 
%==========================================================================
[ Ubrzanje ] = DataOutput16;

%Proracun kocnih pokazatelja
%==========================================================================
[PKP] = DataOutput17;

%Stabilnost vozila
%==========================================================================
[ SV ] = DataOutput18;

%Prevrtanje vozila
%==========================================================================
[PV ] = DataOutput19;
%%
%Pisanje u .xls datoteku
%==========================================================================
[ XLS ] = WriteDataConst;
[ XLS ] = WriteDataOutput1;
[ XLS ] = WriteDataOutput2;
[ XLS ] = WriteDataOutput3;
[ XLS ] = WriteDataOutput5;
[ XLS ] = WriteDataOutput6;
[ XLS ] = WriteDataOutput7;
[ XLS ] = WriteDataOutput8;
[ XLS ] = WriteDataOutput9;

