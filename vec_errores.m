function vec_e = vec_errores(a,b,c,d,n,m,x,sol)
    h = (b-a)/n;
    k = (d-c)/m;
    vec_e = zeros(size(x));
    for i=1:n-1
        for j=1:m-1 
            x_i = a+i*h;
            y_j = c+j*k;
            val = sol(x_i,y_j);
            l = i+(m-1-j)*(n-1);
            vec_e(l) = abs(x(l)-val);
        end
    end
end