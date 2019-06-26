% filename: mm.m
close all;
clear;


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
final = [0.01,0.03,0.1,0.32,1,3.2,10,32,100];
for j = 1:length(final)
    K2_random = (randn(n,1));
    K4_random = (randn(n,1));
    alpha1_random = (randn(n,1));
    alpha2_random = (randn(n,1));
    kdc_random = (randn(n,1));
    kdrd_random = (randn(n,1));
    rc_random = (randn(n,1));
    rrd_random = (randn(n,1));
    S0_random = (randn(n,1));
    S1_random = (randn(n,1));
    
    out = [];
for i = 1:n
    
    K2 = 1000 ;
    sigma1 = 1;
    K4 = 0.0001 ;
    sigma2 = 1;
    alpha1 = 4000 ;
    alpha2 = 4000 ;
    kdc = 0.1 ;
    kdrd = 0.05;
    rc = 10 ;
    rrd = 10;


    options = [];
    
    K2 = K2 * (1+K2_random(i)/5);
    K4 = K4 * (1+K4_random(i)/5);
    alpha1 = alpha1 * (1+alpha1_random(i)/5);
    alpha2 = alpha2 * (1+alpha2_random(i)/5);
    rc = rc * (1+rc_random(i)/5);
    rrd = rrd * (1+rrd_random(i)/5);
    kdc = kdc * (1+kdc_random(i)/5);
    kdrd = kdrd * (1+kdrd_random(i)/5);
    
    [t y]=ode45('Q3_2_func',(0.01:0.01:final(j)),[100*(1+S0_random(i)/5) 100*(1+S1_random(i)/5)],...
    options,K2,sigma1,K4,sigma2,alpha1,alpha2,kdc,kdrd,rc,rrd);
    S = y(:,1);
    value = S(end);
    out = [out S(end)];
end
disp(out);
subplot(length(final),1,j);
h = histogram(out);
h.NumBins = 50 ;
axis([10 100000 0 100]);
if final(j) < 10
    ylabel(sprintf('Dox = %.2f',final(j)));
end
if final(j) >= 10
    ylabel(sprintf('Dox = %d',final(j)));
end
if j==length(final)
    xlabel('Concentration of mCherry');
end
set(gca,'xscale','log');
hold on 
end
hold off







