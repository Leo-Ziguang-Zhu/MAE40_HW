%% Problem 1
clear, close all, syms s V1 V2 V0 Ca Cb Cc L Ra Rb Rc Rd Ia Ib Ic 
A  =[-1   0    Ra       0       0       0;    
      0   1    0    1/(s*Cb)    0       0;
      1  -1    0        0    1/(s*Cc)   0;
      0  -1    0        0       0      Rd;
      0   0    0       -1       1       1;
      0   0    1        0       1       0];
b  =[ V0; V0; 0; 0; 0; 0];
x=A\b; %F(x(6))
omega3=10; F=RR_tf([1 omega3 omega3^2],[1 omega3*3 omega3^2]);
figure(1), RR_bode(F)

%% Problem 2
A  =[ 1    0    1/(s*Ca)    0       0      0;    
     -1    1       0        0      -Rc     0;
      0    0       0        1      -1     -1;
      0   -1       0        0       0     Rd;
      0    0       1        0       1      0;
      0    1       0       Rb       1      0];
b  =[ V0; 0; 0; 0; 0; V0];
x=A\b; %F(x(6))
omega3=10; F2=RR_tf([1 3*omega3 omega3^2],[1 omega3*2 omega3^2]);
figure(2),RR_bode(F2)