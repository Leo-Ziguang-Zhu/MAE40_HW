Student_Name = 'Ziguang Zhu'
Student_ID = 'A16841667'

%% 
% Problem 1
clear, close all; 

syms Vi L C Rload s;

% x = { I_L; I_C; I_Rload; Vo }
A = [-1  1   1          0;       % -IL + IC + IRload = 0
     L*s 0   0          1;       % LsIL + Vo = Vi
     0   0   0    (Rload*C*s+1); % (RCs+1)Vo = Vi
     0   0 Rload       -1];      % IRload*Rload - Vo = 0
b = [0; Vi; Vi; 0];
x = A\b;
Vo_LPF2_Rload = simplify(x(4));
omega4=10; zeta = 0.1;
F_LPF2_Rload = RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2])
figure(1), RR_bode(F_LPF2_Rload)
title('figure(1) graphs for Problem 1')
%%

%Problem 2
omega4=10; zeta = 0.1;
F_LPF2_Rload = RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(2), RR_bode(F_LPF2_Rload)
title('figure(2) zeta=0.1 graphs for Problem 2')

omega4=10; zeta = 0.7;
F_LPF2_Rload = RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(3), RR_bode(F_LPF2_Rload)
title('figure(3) zeta=0.7 graphs for Problem 2')

omega4=10; zeta = 1;
F_LPF2_Rload = RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(4), RR_bode(F_LPF2_Rload)
title('figure(4) zeta=1 graphs for Problem 2')
%%

%Problem 3
clear, close all; 

syms Vi L C Rload s Id Cd V1;

% x = { I_L; I_C; I_Rload; Id; Vo }
A = [s*L   0      0      0       1      0 ;       
     -1    1      1      0       0      0 ;       
      0    0     -1      1       0      0 ; 
      0    0    Rload    0      -1      1 ;
      0   -1      0      0      C*s     0 ;
      0    0      0     -1       0     C*s]      
b = [Vi; 0; 0; 0; 0 ; 0]
x = A\b
%Vo_LPF2_Rload = simplify(x(6));
%omega5=10; 
%F_LPF2_Rload = RR_tf([Rload*(1+L*C*s^2+L*s*(1+1/(1+Rload*C*s)))],[Rload])
%figure(5), RR_bode(F_LPF2_Rload)
%title('figure(5) graphs for Problem 3')
%}
Transfer_Function = (Rload*(1+L*C*s^2+L*s*(1+1/(1+Rload*C*s))))/(Rload)
Discussion_For_P3 = 'I think with this transfer function, I can really see how the function reaches a steady phase as resistent increases. But on the left side of the function I do not see a bound though'

%%

%Problem 4
A = [s*L   0      0              0       1      0 ;       
     -1    1      1              0       0      0 ;       
      0    0     -1              1       0      0 ; 
      0    0    (L/C)^(1/2)      0      -1      1 ;
      0   -1      0      0      4*C*s     0 ;
      0    0      0     -1       0     4*C*s]      
b = [Vi; 0; 0; 0; 0 ; 0]
x = A\b
New_Expression_for_Transfer_Function = (((L/C)^(1/2))*(1+L*C*s^2+L*s*(1+1/(1+((L/C)^(1/2))*C*s))))/((L/C)^(1/2))
Discussion_For_P4 = 'Now the expression for the transfer function is much better since it is showing in the correct format such s^2+s+1 etc.. So'