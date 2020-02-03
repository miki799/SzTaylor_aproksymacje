function [mB,mRL,mRC] = SINUS(x0,x,N),
    X = linspace(x0-x,x0+x,1000); % dziedzina funkcji 
    Y = sin(X); % wartoœci funkcji
    y = 0;          
    for k = 0:1:N,  % wyznaczanie aproksymacji 
        y = y + (sin(x0+k*pi/2)/factorial(k)).*(X-x0).^k;   
        figure(1);  grid on; 
        subplot(2,2,1); axis([x0-x-2 x0+x+2 -5 5]) 
        plot(X,y,"-"); xlabel("X"); ylabel("Y"); title("Aproksymacje funkcji sin(x)"); hold on; % aproksymacje
        plot(x0,sin(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
        set(gcf, 'Position',  [0, 0, 1920, 1080])
    end
    figure(1);
    subplot(2,2,2); grid on; hold on; xlabel("X"); ylabel("Y"); axis([x0-x-2 x0+x+2 -5 5])
    plot(X,sin(X),'b-'); title("Funkcja sin(x) i jej aproksymacja"); % funkcja sin(x)
    plot(X,y,"r--"); % aproksymacja
    plot(x0,sin(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
    legend("Funkcja sin(x)","Aproksymacja dla podanego N","x0");
    
    %B£¥D APROKSYMACJI
    Y=sin(X); B=Y-y;
    figure(1); subplot(2,3,4);
    plot(X,B,'b-'); hold on; title("B£¥D"); grid on; xlabel("X"); ylabel("Y");  
    %RESZTA LAGRANGE'A
    if x0 == 0,
       xc = 1;
    else
       xc = x0;
    end
    figure(1); subplot(2,3,5); 
    RL = (sin(xc)./factorial(N+1)).*(X-x0).^(N+1); % reszta
    plot(X,RL,'r-'); hold on; title("Reszta Lagrange'a"); grid on; xlabel("X"); ylabel("Y"); 
    plot(X,B,'b-');
    R1=B-RL; % ro¿nica miêdzy b³êdem ,a reszt¹
    plot(X,R1,'g-'); legend("Reszta Lagrange'a","B£¥D", "Ró¿nica");
    % RESZTA CAUCHY'EGO
    t=0.5;% od 0 do 1
    figure(1); subplot(2,3,6);
    RC = (sin(xc)./factorial(N)).*((1-t).^N).*(X-x0).^(N+1); % reszta
    plot(X,RC,'r-'); hold on; title("Reszta Cauchy'ego"); grid on; xlabel("X"); ylabel("Y");
    plot(X,B,'b-'); 
    R2=B-RC; % ro¿nica miêdzy b³êdem ,a reszt¹
    plot(X,R2,'g-'); legend("Reszta Cauchy'ego","B£¥D", "Ró¿nica");
    
    mB=max(abs(B)); % maksymalna wartoœæ b³êdu
    mRL=max(abs(RL)); % maksymalna wartoœæ reszty
    mRC=max(abs(RC)); % maksymalna wartoœæ reszty
    display("Maksymalna wartoœæ reszty Lagrange'a (mRL)");
    display(mRL);
    display("Maksymalna wartoœæ reszty Cauchy'ego (mRC)");
    display(mRC);
    display("Maksymalna wartoœæ B£ÊDU (mB)");
    display(mB);
    
end
    
    
    
    
    
   