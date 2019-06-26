
clear
clc
X = randn(1000,1);
h = histogram(X)
axis([-5 5 0 100]);
%set(gca,'xscale','log')