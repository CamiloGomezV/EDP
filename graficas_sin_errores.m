function [X,Y] = graficas_sin_errores(a,b,c,d,n,m,aprox)
    h = (b-a)/n;
    k = (d-c)/m;
    
    x = a+h:h:b-h;
    y = c+k:k:d-k;
    z = zeros(n-1);
    
    for i=1:n-1
        for j=1:m-1
            l = i+(m-1-j)*(n-1);
            z(i,j) = aprox(l);
        end
    end
    
    [X,Y] = meshgrid(x,y);
    
    figure()
    surf(X,Y,z)
    title('Puntos VS Solución numérica')
    xlabel('eje x')
    ylabel('eje y')
    zlabel('Sol numérica')
end