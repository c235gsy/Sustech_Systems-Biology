% filename: mmfunc.m
function dydt = f(t,y,flag,K2,sigma1,K4,sigma2,alpha,kd,r)
% [S] = y(1), [ES] = y(2), [P] = y(3)
%K1 = 10 ;



t = t(1);
y = y(1);
N = (K2 * t)^1;
A = 1+N+sigma1*N^2;
M = K4/A;
dydt = [alpha/(1+M+sigma2*M^2)-kd*y+r];
%dydt = [alpha/(1)-kd*y+r];
