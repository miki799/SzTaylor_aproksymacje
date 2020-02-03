function [mB,mRL,mRC] = COSINUS(x0,x,N),
    X = linspace(x0-x,x0+x,1000); % dziedzina funkcji 
    Y = cos(x); % warto�ci funkcji
    y = 0;          
    for k = 0:1:N,  % wyznaczanie aproksymacji
        y = y + (cos(x0+k*pi/2)/factorial(k)).*(X-x0).^k;
        figure(2);  grid on; 
        subplot(3,2,1); axis([x0-x-2 x0+x+2 -5 5]);
        plot(X,y,"-"); xlabel("X"); ylabel("Y"); title("Aproksymacje funkcji cos(x)"); hold on; % aproksymacje
        plot(x0,cos(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
        set(gcf, 'Position',  [0, 0, 1920, 1080])
    end
    figure(2);
    subplot(3,2,2); grid on; hold on; xlabel("X"); ylabel("Y"); axis([x0-x-2 x0+x+2 -5 5]);
    plot(X,cos(X),'b-'); title("Funkcja cos(x) i jej aproksymacja"); % cos(x)
    plot(X,y,"r--");  % aproksymacja
    plot(x0,cos(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
    legend("Funkcja cos(x)","Aproksymacja dla podanego N","x0");
    
    % B��D APROKSYMACJI
    Y=cos(X); B=Y-y;
    figure(2); subplot(2,3,4); 
    plot(X,B,'b-'); hold on; title("B��D"); grid on; xlabel("X"); ylabel("Y");
    %RESZTA LAGRANGE
    if x0 == 0,
       xc = 1;
    else
       xc = x0;
    end
    figure(2); subplot(2,3,5); 
    RL = (cos(xc)./factorial(N+1)).*(X-x0).^(N+1); % reszta
    plot(X,RL,'r-'); hold on; title("Reszta Lagrange'a"); grid on; xlabel("X"); ylabel("Y");
    plot(X,B,'b-');
    R1=B-RL; % r�nica mi�dzy b��dem aproksymacji ,a reszt�
    plot(X,R1,'g-'); legend("Reszta Lagrange'a","B��D", "R�nica");
    %RESZTA CAUCHY
    t=0,5;% od 0 do 1
    figure(2); subplot(2,3,6);
    RC = (cos(xc)./factorial(N)).*((1-t).^N).*(X-x0).^(N+1); % reszta 
    plot(X,RC,'r-'); hold on; title("Reszta Cauchy'ego"); grid on; xlabel("X"); ylabel("Y");
    plot(X,B,'b-'); 
    R2=B-RC; % r�nica mi�dzy b��dem aproksymacji, a reszt�
    plot(X,R2,'g-'); legend("Reszta Cauchy'ego","B��D", "R�nica"); 
    
     
    mB=max(abs(B)); % maksymalna warto�� b��du
    mRL=max(abs(RL)); % maksymalna warto�� reszty
    mRC=max(abs(RC)); % maksymalna warto�� reszty
    display("Maksymalna warto�� reszty Lagrange'a (mRL)");
    display(mRL);
    display("Maksymalna warto�� reszty Cauchy'ego (mRC)");
    display(mRC);
    display("Maksymalna warto�� B��DU (mB)");
    display(mB); 
end