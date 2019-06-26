% filename: mm.m
close all;
clear;

K2 = 1000 ;
sigma1 = 0.5;
K4 = 0.0001 ;
sigma2 = 0.5;
alpha1 = 4000 ;
alpha2 = 4000 ;
kdc = 0.1 ;
kdrd = 0.05;
rc = 10 ;
rrd = 10;

options = [];


[t y]=ode45('Q2func',[0.01:0.01:1000],[100 1000],options,K2,sigma1,K4,sigma2,alpha1,alpha2,kdc,kdrd,rc,rrd);

C = y(:,1);
R = y(:,2);

figure(1);
loglog(t,C,'.-r');
legend('mCherry');
ylabel('Mean of mCherry');
%axis([0.1 10000 0 10000]);
xlabel('Concentration of Doxycycline (mM)');





%
% plot(log10(t),v_real,'.-r',log10(t),v_predicted,'.-b');
% legend('Calculatd turnover rate v','Predicted turnover rate v0',0);
% xlabel('log(Time) (s)');
% ylabel('Turn-over rate (M/s)');
