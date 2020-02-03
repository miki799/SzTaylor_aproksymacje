%Rozwiniêcie funkcji w szereg Taylor’a wokó³ zadanego punktu. 
%Analiza b³êdów aproksymacji.
%Miko³aj Telec, Adam Krzeszowski
clc; clear all; close all;

x0=input("Podaj punkt (x0) w otoczeniu, którego rozwiniemy funkcjê ... \n");
N=input("Podaj rz¹d pochodnej (N) wyznaczanej w tym punkcie...\nW przypadku gdy chcesz aproksymowaæ wielomian podaj ich n+1 (n to stopieñ wielomianu)... \n");
x=input("Podaj liczbê (x) o któr¹ mam rozszerzyæ dziedzinê wokó³ punktu x0... \n");
display(" 1) sin(x) "); display(" 2) cos(x) "); display(" 3) exp(x) "); display(" 4) wielomian o podanych wspó³czynnikach ");
F=input("Podaj numer funkcji która ma byæ aproksymowana...  ")

if F == 1 
    [mB,mRL,mRC] = SINUS(x0,x,N);      
elseif F == 2 
    [mB,mRL,mRC] = COSINUS(x0,x,N);
elseif F == 3 
    [mB,mRL,mRC] = EXP(x0,x,N);
elseif F == 4
    [mB,mRL,mRC] = WIELOMIAN(x0,x,N);
end



