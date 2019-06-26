close all;
clear;

K2 = 100 ;
sigma1 = 0.5;
K4 = 100000 ;
sigma2 = 0.5;
alpha = 400 ;
kd = 0.01 ;
r = 1 ;

options = [];


[t y]=ode45('Q1func',[0.01:0.01:10000],[100],options,K2,sigma1,K4,sigma2,...
    alpha,kd,r);

S=y(:,1);
disp(S(end));
figure(1);
loglog(t,S,'.-g');
legend('GFP');
xlabel('Concentration of Doxycycline (mM)');
axis([0.01 1000 0 100000]);
ylabel('Mean of reporter gene protein');
hold on

K2 = 100 ;
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


[t y]=ode45('Q3_2_func',[0.01:0.01:10000],[100 1000],options,K2,sigma1,K4,sigma2,alpha1,alpha2,kdc,kdrd,rc,rrd);

C = y(:,1);
R = y(:,2);

loglog(t,C,'.-r');
legend('GFP','mCherry');
