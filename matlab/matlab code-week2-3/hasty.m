% function hasty.m  solving ODE with two initial c1 values
options=[]; alpha=50; 
gamma=20;
%gamma=15;
%gamma=13.828; 
%gamma=16.96;
sigma1=1; % both OR2 and OR3 has same affinity
sigma2=3; % binding to OR2 increase binding affinity to OR3: coopertivity

[t1 y1]=ode45('hastyfunc',[0 30],[0],options,alpha,gamma,sigma1,sigma2);
[t2 y2]=ode45('hastyfunc',[0 30],[1],options,alpha,gamma,sigma1,sigma2);
plot(t1,y1(:,1),'o-b',t2,y2(:,1),'o-r');
ylabel('X');
xlabel('TIME'); 

