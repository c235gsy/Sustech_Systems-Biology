% filename: mmfunc.m
function dydt = f(t,dy,flag,K2,sigma1,K4,sigma2,alpha1,alpha2,kdc,kdrd,rc,rrd)
% [S] = y(1), [ES] = y(2), [P] = y(3)
%K1 = 10 ;

x = t(1);
y = dy(1);
R0 = dy(2);
N = K2 * x;
M = 1 + N + sigma1 * N^2;
U = K4 * R0;
V = 1 + U + sigma2 * U^2;
dy = alpha1*(1)/V - kdc*y + rc;
dR0 = alpha2*(1)/(M*V) - kdrd*R0 + rrd/M;
dydt = [dy;
        dR0];
%dydt = [alpha/(1)-kd*y+r];
