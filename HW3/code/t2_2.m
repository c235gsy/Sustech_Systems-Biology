clear;
population_number=10000;% Number of bacteria
speed=50;% Speed. Unit: 20 \mu m in 1s
maxTime=1000; 
Timeseq=1:1:maxTime; % camera captuer 0.1s one frame in 100s.
x=zeros(population_number,1);
y=zeros(population_number,1); % Bacteria are random distrubtion
tseq=zeros(population_number,1);
dist_X=zeros(population_number,maxTime);   % distance to start point at X-axis
dist_Y=zeros(population_number,maxTime);   % distance to start point at Y-axis

for t=Timeseq
    x=x+speed*0.1*(randn(population_number,1));
    y=y+speed*0.1*(randn(population_number,1));
    dist_X(:,t)=x;
	dist_2_X(:,t)=dist_X(:,t).^2;
	dist_Y(:,t)=y;
	dist_2_Y(:,t)=dist_Y(:,t).^2;
end

meanX=sum(dist_X(:,1:maxTime))/population_number;
meanX_2=sum(dist_2_X(:,1:maxTime))/population_number;
%meanX_2=meanX.^2;
meanY=sum(dist_Y(:,1:maxTime))/population_number;
meanY_2=sum(dist_2_Y(:,1:maxTime))/population_number;
%meanY_2=meanY.^2;
dist_2_mean=meanX_2+meanY_2;

figure(1);
ax1 = subplot(2,2,1);
plot(Timeseq*0.1,[meanX(1,:)',meanY(1,:)'],'LineWidth',3)
title('Simple brownian motion');
legend('Mean of X-Coordinate','Mean of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum');
%ylim([-1000,1000]);

ax2 = subplot(2,2,2);
plot(Timeseq*0.1,[meanX_2(1,:)',meanY_2(1,:)'],'LineWidth',3)
title('Simple brownian motion');
legend('Mean Squance of X-Coordinate','Mean Squance of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum^2');

population_number=10000;% Number of bacteria
speed=50;% Speed. Unit: 20 \mu m in 1s
k = 0.02;
A0 = 2;
maxTime=1000; 
Timeseq=1:1:maxTime; % camera captuer 0.1s one frame in 100s.
x=zeros(population_number,1);
y=zeros(population_number,1); % Bacteria are random distrubtion
tseq=zeros(population_number,1);
dist_X=zeros(population_number,maxTime);   % distance to start point at X-axis
dist_Y=zeros(population_number,maxTime);   % distance to start point at Y-axis


for t=Timeseq
    x = x + speed*0.1*randn(population_number,1) + A0*0.1 + k*x*0.1 ;
    y = y + speed*0.1*randn(population_number,1) ;
    dist_X(:,t)=x;
	dist_2_X(:,t)=dist_X(:,t).^2;
	dist_Y(:,t)=y;
	dist_2_Y(:,t)=dist_Y(:,t).^2;
end

meanX=sum(dist_X(:,1:maxTime))/population_number;
meanX_2=sum(dist_2_X(:,1:maxTime))/population_number;
%meanX_2=meanX.^2;
meanY=sum(dist_Y(:,1:maxTime))/population_number;
meanY_2=sum(dist_2_Y(:,1:maxTime))/population_number;
%meanY_2=meanY.^2;
dist_2_mean=meanX_2+meanY_2;

ax3 = subplot(2,2,3);
plot(Timeseq*0.1,[meanX(1,:)',meanY(1,:)'],'LineWidth',3)
title('Brownian motion with chemotaxis');
legend('Mean of X-Coordinate','Mean of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum');
axis([0 100 -100 700]);
%ylim([-1000,1000]);

ax4 = subplot(2,2,4);
plot(Timeseq*0.1,[meanX_2(1,:)',meanY_2(1,:)'],'LineWidth',3)
title('Brownian motion with chemotaxis');
legend('Mean Squance of X-Coordinate','Mean Squance of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum^2');
%axis([0 100 -50000 450000]);

linkaxes([ax1,ax3],'xy')
linkaxes([ax2,ax4],'xy')
