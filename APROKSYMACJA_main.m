%Rozwini�cie funkcji w szereg Taylor�a wok� zadanego punktu. 
%Analiza b��d�w aproksymacji.
%Miko�aj Telec, Adam Krzeszowski
clc; clear all; close all;

x0=input("Podaj punkt (x0) w otoczeniu, kt�rego rozwiniemy funkcj� ... \n");
N=input("Podaj rz�d pochodnej (N) wyznaczanej w tym punkcie...\nW przypadku gdy chcesz aproksymowa� wielomian podaj ich n+1 (n to stopie� wielomianu)... \n");
x=input("Podaj liczb� (x) o kt�r� mam rozszerzy� dziedzin� wok� punktu x0... \n");
display(" 1) sin(x) "); display(" 2) cos(x) "); display(" 3) exp(x) "); display(" 4) wielomian o podanych wsp�czynnikach ");
F=input("Podaj numer funkcji kt�ra ma by� aproksymowana...  ")

if F == 1 
    [mB,mRL,mRC] = SINUS(x0,x,N);      
elseif F == 2 
    [mB,mRL,mRC] = COSINUS(x0,x,N);
elseif F == 3 
    [mB,mRL,mRC] = EXP(x0,x,N);
elseif F == 4
    [mB,mRL,mRC] = WIELOMIAN(x0,x,N);
end



