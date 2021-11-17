function [X,Y] = graficas(a,b,c,d,n,m,aprox,errores)
    h = (b-a)/n;
    k = (d-c)/m;
    
    x = a+h:h:b-h;
    y = c+k:k:d-k;
    z = zeros(n-1);
    matriz_er = zeros(n-1);
    
    for i=1:n-1
        for j=1:m-1
            l = i+(m-1-j)*(n-1);
            z(i,j) = aprox(l);
            matriz_er(i,j) = errores(l);
        end
    end
    
    [X,Y] = meshgrid(x,y);
    
    figure()
    mesh(X,Y,z)
    title('Puntos VS Solución numérica')
    xlabel('eje x')
    ylabel('eje y')
    zlabel('Sol numérica')
    
    figure()
    mesh(X,Y,matriz_er)
    title('Puntos VS error')
    xlabel('eje x')
    ylabel('eje y')
    zlabel('Error')
end