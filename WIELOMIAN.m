function [mB,mRL,mRC] = WIELOMIAN(x0,x,N),
    i=input("Podaj stopieñ wielomianu \n");
    o=input("Czy chcesz podaæ wspó³czynniki (1)  czy maj¹ zostaæ wylosowane (2) ? \n"); 
    if o==1,
        for l=1:1:i+1 % podawanie wspó³czynników
            a(1,l)=input("Podaj wspó³czynnik... \n");
        end
    elseif o==2 % losowanie wspó³czynników
          a=randi([1,3],1,i+1);
%           a=rand(1,i+1);
    end
    w=pochodna(a,x0,N); % wyznaczanie pochodnej
    X = linspace(x0-x,x0+x,10000); % dziedzina funkcji 
    Y = polyval(a,X);% wyznaczanie wartoœci wielomianu ( nie aproksymacji )
    y = polyval(a,x0); % pochodna "zerowa"             
    for k = 1:1:N,      % wyznaczanie aproksymacji
        y = y + (w(1,k)/factorial(k)).*(X-x0).^k;
        figure(1);  grid on; 
        subplot(3,2,1); 
        plot(X,y,"-"); xlabel("X"); ylabel("Y"); title("Aproksymacje wielomianu"); hold on; % aproksymacje
        plot(x0,polyval(a,x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
        set(gcf, 'Position',  [0, 0, 1920, 1080]); axis([x0-x x0+x -3 10]);
    end
    figure(1); 
    subplot(3,2,2); grid on; hold on; xlabel("X"); ylabel("Y"); 
    plot(X,polyval(a,X),'b-'); title("Wielomian i jego aproksymacja"); % wielomian
    plot(X,y,"r--"); % aproksymacja
    plot(x0,polyval(a,x0),"ro","MarkerSize",5,'MarkerEdgeColor','red','MarkerFaceColor','red'); % x0
    legend("Wielomian","Aproksymacja dla podanego N","x0"); axis([x0-x x0+x -3 10]);
    
    %B£¥D APROKSYMACJI     
    Y=polyval(a,X); B=Y-y;
    figure(1); subplot(2,3,4); 
    plot(X,B,'r-'); hold on; title("B£¥D"); grid on; 
    %RESZTA LAGRANGE / RESZTA CAUCHY'EGO
    if x0 == 0,
       xc = 1;
    else
       xc = x0;
    end
    for o = 1:1:N, % pochodna
         a=polyder(a);
         r(1,o)= polyval(a,xc);
    end
    t=0.5
    figure(1); subplot(2,3,5); 
    RL = (r(1,end)./factorial(N+1)).*(X-x0).^(N+1); % reszta Lagrange'a
    plot(X,RL,'r-'); hold on; title("Reszta Lagrange'a"); grid on; xlabel("X"); ylabel("Y");
    subplot(2,3,6); 
    RC = (r(1,end)./factorial(N)).*((1-t).^N).*(X-x0).^(N+1); % reszta Cauchy'ego
    plot(X,RC,'r-'); hold on; title("Reszta Cauchy'ego"); grid on; xlabel("X"); ylabel("Y");
    
    mRL=max(abs(RL)); % maksymalna wartoœæ reszty Lagrange'a 
    mRC=max(abs(RC)); % maksymalna wartoœæ reszty Cauchy'ego
    mB=max(abs(B)); % maksymalna wartoœæ b³êdu
    display("Maksymalna wartoœæ reszty Lagrange'a");
    display(mRL);
    display("Maksymalna wartoœæ reszty Cauchy'ego");
    display(mRC);
    display("Maksymalna wartoœæ B£ÊDU");
    display(mB);
end