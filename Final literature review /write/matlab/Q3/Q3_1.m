% filename: mm.m
close all;
clear;

K2 = 10 ;
sigma1 = 0.5;
K4 = 1000 ;
sigma2 = 0.5;
alpha = 100 ;
kd = 0.01 ;
r = 1 ;
options = [];

n = 1000;
K2_random = (randn(n,1));
K4_random = (randn(n,1));
alpha_random = (randn(n,1));
r_random = (randn(n,1));
kd_random = (randn(n,1));
%alpha_random = repelem([1,2,3],[0.8*n,0.15*n,0.05*n]);
%h = histogram(X)
%axis([-5 5 0 100]);

out = [];
final = [0.01,0.1,1,10,100,1000,3200,10000];
for j = 1:length(final)
    K2_random = (randn(n,1));
    K4_random = (randn(n,1));
    alpha_random = (randn(n,1));
    r_random = (randn(n,1));
    kd_random = (randn(n,1));
    S0_random = (randn(n,1));
    
    out = [];
for i = 1:n
    K2 = 10 ;
    sigma1 = 0.5;
    K4 = 1000 ;
    sigma2 = 0.5;
    alpha = 100 ;
    kd = 0.01 ;
    r = 1 ;
    options = [];
    
    K2 = K2 * (1+K2_random(i)/5);
    K4 = K4 * (1+K4_random(i)/5);
    alpha = alpha * (1+alpha_random(i)/5);
    
    r = r * (5+r_random(i)/5);
    kd = kd * (1+kd_random(i)/5);
    if final(j) <= 100
    [t y]=ode45('Q1func',(0.01:0.01:final(j)),(100*(1+S0_random(i)/5)),options,K2,sigma1,K4,sigma2,...
    alpha,kd,r);
    else
    [t y]=ode45('Q1func',(0.01:final(j)),(100*(1+S0_random(i)/5)),options,K2,sigma1,K4,sigma2,...
    alpha,kd,r);
    end
    S = y(:,1);
    value = S(end);
    out = [out S(end)];
end
disp(out);
subplot(length(final),1,j)
h = histogram(out);
h.NumBins = 50 ;
axis([10 100000 0 100]);
if final(j) <= 1
    ylabel(sprintf('Dox = %.2f',final(j)));
end
if final(j) > 1
    ylabel(sprintf('Dox = %d',final(j)));
end
if j==length(final)
    xlabel('Concentration of GFP');
end
set(gca,'xscale','log');
hold on 
end
hold off







