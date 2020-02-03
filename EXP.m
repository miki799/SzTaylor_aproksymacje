function [mB,mRL,mRC] = EXP(x0,x,N),
    X = linspace(x0-x,x0+x,1000); % dziedzina funkcji 
    Y = exp(X); % wartoœci funkcji
    y = 0;          
    for k = 0:1:N,  % wyznaczanie aproksymacji
        y = y + (exp(x0)/factorial(k)).*(X-x0).^k;
        figure(2);  grid on; 
        subplot(3,2,1); axis([x0-x-2 x0+x+2 -1 15]);
        plot(X,y,"-"); xlabel("X"); ylabel("Y"); title("Aproksymacje funkcji exp(x)"); hold on; % aproksymacje
        plot(x0,exp(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
        set(gcf, 'Position',  [0, 0, 1920, 1080]) 
    end
    figure(2);
    subplot(3,2,2); grid on; hold on; xlabel("X"); ylabel("Y"); axis([x0-x-2 x0+x+2 -1 15]);
    plot(X,exp(X),'b-'); title("Funkcja exp(x) i jej aproksymacja"); % exp(x)
    plot(X,y,"r--");  % aproksymacja
    plot(x0,exp(x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
    legend("Funkcja exp(x)","Aproksymacja dla podanego N","x0");
   
    %B£¥D APROKSYMACJI   
    Y=exp(X); B=Y-y;
    figure(2); subplot(2,3,4);
    plot(X,B,'b-'); hold on; title("B£¥D"); grid on;
    %RESZTA LAGRANGE
    if x0 == 0,
       xc = 1;
    else
       xc = x0;
    end
    figure(2); subplot(2,3,5); 
    RL = (exp(xc)./factorial(N+1)).*(X-x0).^(N+1); % reszta
    plot(X,RL,'r-'); hold on; title("Reszta Lagrange'a"); grid on; xlabel("X"); ylabel("Y");
    plot(X,B,'b-');
    R1=B-RL; % ro¿nica miêdzy b³êdem aproksymacji, a reszt¹
    plot(X,R1,'g-'); legend("Reszta Lagrange'a","B£¥D", "Ró¿nica");
    %RESZTA CAUCHY
    t=0.5;% od 0 do 1
    figure(2); subplot(2,3,6);
    RC = (exp(xc)./factorial(N)).*((1-t).^N).*(X-x0).^(N+1); % reszta
    plot(X,RC,'r-'); hold on; title("Reszta Cauchy'ego"); grid on; xlabel("X"); ylabel("Y");
    plot(X,B,'b-'); 
    R2=B-RC; % ró¿nica miêdzy b³êdem, a reszt¹
    plot(X,R2,'g-'); legend("Reszta Cauchy'ego","B£¥D", "Ró¿nica");    
    
    
    mB=max(abs(B)); % maksymalna wartoœæ b³êdu
    mRL=max(abs(RL)); % maksymalna wartoœæ reszty
    mRC=max(abs(RC)); % maksymalna wartoœæ reszty
    display("Maksymalna wartoœæ reszty Lagrange'a");
    display(mRL);
    display("Maksymalna wartoœæ reszty Cauchy'ego");
    display(mRC);
    display("Maksymalna wartoœæ B£ÊDU");
    display(mB);
      
end