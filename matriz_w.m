function [w,frontera] = matriz_w(a,b,c,d,n,m,g1,g2,g3,g4,f)
    %g1=g(x0,y), g2=g(x,y0), g3=g(x,yn), g4=g(xn,y)
    h = (b-a)/n;
    k = (d-c)/m;
    dim = (n-1)*(m-1);
    w = zeros(dim);
    frontera = zeros(dim,1);
    for i=1:n-1
        for j=1:m-1
            x_i = a+i*h;
            y_j = c+j*k;
            l = i+(m-1-j)*(n-1);
            frontera(l)=frontera(l)+(-h^2*f(x_i,y_j));

            l1 = i+(m-1-j)*(n-1);
            w(l,l1) = 2*((h/k)^2 + 1);
            if(i+1 ~= n)
                l2 = (i+1)+(m-1-j)*(n-1);
                w(l,l2) = -1;
            else
                frontera(l) = frontera(l) + g4(y_j);
            end
            
            if(i-1 ~= 0)
                l3 = (i-1)+(m-1-j)*(n-1);
                w(l,l3) = -1;
            else
                frontera(l) = frontera(l) + g1(y_j);
            end
            
            if(j+1 ~=m)
                l4 = i+(m-1-(j+1))*(n-1);
                w(l,l4) = -(h/k)^2;
            else
                frontera(l) = frontera(l) + ((h/k)^2)*g3(x_i);
            end
            
            if(j-1~=0)
                l5 = i+(m-1-(j-1))*(n-1);
                w(l,l5) = -(h/k)^2;
            else
                frontera(l) = frontera(l) + ((h/k)^2)*g2(x_i);
            end
        end
    end
end