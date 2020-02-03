function w = pochodna(a,x0,N)
    for i = 1:1:N,
        a=polyder(a);
        w(1,i)=polyval(a,x0);
    end
end


