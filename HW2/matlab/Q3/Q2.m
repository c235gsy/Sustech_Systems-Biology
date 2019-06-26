% filename: mm.m
close all;
clear;

K2 = 100 ;
sigma1 = 1;
K4 = 0.001 ;
sigma2 = 1;
alpha1 = 4000 ;
alpha2 = 4000 ;
kdc = 0.1 ;
kdrd = 0.05;
rc = 10 ;
rrd = 10;

options = [];


[t y]=ode45('Q3_2_func',[0.01 100],[100 1000],options,K2,sigma1,K4,sigma2,alpha1,alpha2,kdc,kdrd,rc,rrd);

C = y(:,1);
R = y(:,2);

figure(1);
loglog(t,C,'.-r',t,R,'.-b');
legend('C','R');
xlabel('log(Time (s))');
%axis([0.1 10000 0 10000]);
ylabel('Concentration (M)');

figure(2);
loglog(t,C,'.-r');
legend('C');
xlabel('log(Time (s))');
%axis([0.1 10000 0 10000]);
ylabel('Concentration (M)');



%
% plot(log10(t),v_real,'.-r',log10(t),v_predicted,'.-b');
% legend('Calculatd turnover rate v','Predicted turnover rate v0',0);
% xlabel('log(Time) (s)');
% ylabel('Turn-over rate (M/s)');
