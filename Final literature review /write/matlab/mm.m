% filename: mm.m
close all;
clear;

K2 = 10 ;
sigma1 = 0.5;
K4 = 10000 ;
sigma2 = 0.5;
alpha = 80 ;
kd = 0.01 ;
r = 1 ;

options = [];


[t y]=ode45('mmfunc',[0.01:0.1:10000],[100],options,K2,sigma1,K4,sigma2,...
    alpha,kd,r);

S=y(:,1);
figure(1);
loglog(t,S,'.-r');
legend('Y');
xlabel('log(Time (s))');
%axis([0.1 10000 0 10000]);
ylabel('Concentration (M)');

figure(2);
plot(t,S,'.-r');
legend('Y');
xlabel('log(Time (s))');
%axis([0.1 10000 0 10000]);
ylabel('Concentration (M)');

%
% plot(log10(t),v_real,'.-r',log10(t),v_predicted,'.-b');
% legend('Calculatd turnover rate v','Predicted turnover rate v0',0);
% xlabel('log(Time) (s)');
% ylabel('Turn-over rate (M/s)');
