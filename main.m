%% Ejemplo 1
clc; clear;
%g1=g(x0,y), g2=g(x,y0), g3=g(x,yn), g4=g(xn,y)
g1 =@(y) 0;
g2 =@(x) 0;
g3 =@(x) 200*x;
g4 =@(y) 200*y;
f =@(x,y) 0;

[w, c]= matriz_w(0,0.5,0,0.5,7,7,g1,g2,g3,g4,f);

x = w\c;
u =@(x,y) 400*x*y;
errores = vec_errores(0,0.5,0,0.5,7,7,x,u);
disp(errores)

graficas(0,0.5,0,0.5,7,7,x,errores);


%% Poisson
clc; clear;
%g1=g(x0,y), g2=g(x,y0), g3=g(x,yn), g4=g(xn,y)
g1 =@(y) y^2;
g2 =@(x) x^2;
g3 =@(x) (x-2)^2;
g4 =@(y) (y-1)^2;
f =@(x,y) 4;

[w, c]= matriz_w(0,1,0,2,10,10,g1,g2,g3,g4,f);

x = w\c;
u =@(x,y) (x-y)^2;
errores = vec_errores(0,1,0,2,10,10,x,u);
disp(errores)

graficas(0,1,0,2,10,10,x,errores);

%%
clc; clear;
%g1=g(x0,y), g2=g(x,y0), g3=g(x,yn), g4=g(xn,y)
g1 =@(y) 0;
g2 =@(x) 0;
g3 =@(x) sin(2*x);
g4 =@(y) sin(y);
f =@(x,y) -sin(x*y)*(x^2 + y^2);

[w, c]= matriz_w(0,1,0,2,30,30,g1,g2,g3,g4,f);

x = w\c;

graficas_sin_errores(0,1,0,2,30,30,x);

%%
clc; clear;
%g1=g(x0,y), g2=g(x,y0), g3=g(x,yn), g4=g(xn,y)
g1 =@(y) 0;
g2 =@(x) 0;
g3 =@(x) cos(2*x);
g4 =@(y) cos(y);
f =@(x,y) cos(x*y)*(x^2 + y^2);

[w, c]= matriz_w(0,1,0,2,30,30,g1,g2,g3,g4,f);

x = w\c;

graficas_sin_errores(0,1,0,2,30,30,x);