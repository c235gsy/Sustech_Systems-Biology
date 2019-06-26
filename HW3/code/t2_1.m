
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
pBacteria=plot(x,y,'o'); 
axis([-800 3200 -1000 1000]);% size of microfluicds channel. Unit: mu m
grid on; 

figure(1);
for t=Timeseq
    
    if t==1
    subplot(4,1,1)
    drawnow limitrate;
    plot(x,y,'.')
    grid on
    title(sprintf('2D Brownian motion of 10000 E.coli. (t=%.1f s)',0)); 
	xlabel('x (\mum)');	ylabel('y (\mum)');
    axis([-800 3200 -1000 1000]);
    end
    
    x = x + speed*0.1*randn(population_number,1) + max(A0*0.1 + k*x*0.1,0) ;
    y = y + speed*0.1*randn(population_number,1) ;
    
    dist_X(:,t)=x;
	dist_2_X(:,t)=dist_X(:,t).^2;
	dist_Y(:,t)=y;
	dist_2_Y(:,t)=dist_Y(:,t).^2;
    
    if t<=250
    subplot(4,1,2)
    drawnow limitrate;
    plot(x,y,'.')
    grid on
    title(sprintf('2D Brownian motion of 10000 E.coli. (t=%.1f s)',t*0.1)); 
	xlabel('x (\mum)');	ylabel('y (\mum)');
    axis([-800 3200 -1000 1000]);
    end
    
    if t<=500
    subplot(4,1,3)
    drawnow limitrate;
    plot(x,y,'.')
    grid on
    title(sprintf('2D Brownian motion of 10000 E.coli. (t=%.1f s)',t*0.1)); 
	xlabel('x (\mum)');	ylabel('y (\mum)');
    axis([-800 3200 -1000 1000]);
    end
    
    if t<=1000
    subplot(4,1,4)
    drawnow limitrate;
    plot(x,y,'.')
    grid on
    title(sprintf('2D Brownian motion of 10000 E.coli. (t=%.1f s)',t*0.1)); 
	xlabel('x (\mum)');	ylabel('y (\mum)');
    axis([-800 3200 -1000 1000]);
    end
    
end


meanX=sum(dist_X(:,1:maxTime))/population_number;
disp(meanX)
meanX_2=sum(dist_2_X(:,1:maxTime))/population_number;
%meanX_2=meanX.^2;
meanY=sum(dist_Y(:,1:maxTime))/population_number;
meanY_2=sum(dist_2_Y(:,1:maxTime))/population_number;
%meanY_2=meanY.^2;
dist_2_mean=meanX_2+meanY_2;


figure(2);
ax21 = subplot(2,2,1);
plot(Timeseq*0.1,[meanX(1,:)',meanY(1,:)'],'LineWidth',3)
title('Population');
legend('Mean of X-Coordinate','Mean of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum');
%ylim([-1000,1000]);

ax22 = subplot(2,2,2);
plot(Timeseq*0.1,[meanX_2(1,:)',meanY_2(1,:)'],'LineWidth',3)
title('Population');
legend('Mean Squance of X-Coordinate','Mean Squance of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum^2');

ax23 = subplot(2,2,3);
ran1 = unidrnd(population_number);
plot(Timeseq*0.1,[dist_X(ran1,:)',dist_Y(ran1,:)'],'LineWidth',3)
title('Single Bacteria');
legend('X-Coordinate','Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum');
%ylim([-5000,5000]);

ax24 = subplot(2,2,4);
plot(Timeseq*0.1,[dist_2_X(ran1,:)',dist_2_Y(ran1,:)'],'LineWidth',3)
title('Single Bacteria');
legend('Square of X-Coordinate','Square of Y-Coordinate');
xlabel('Time(s)');
ylabel('\mum^2');

linkaxes([ax21,ax23],'xy')
linkaxes([ax22,ax24],'xy')

ran2 = unidrnd(population_number);
x_corr = dist_X(ran2,:)';
y_corr = dist_Y(ran2,:)';

minX = min(x_corr);
maxX = max(x_corr);
medX = 0.5*(minX+maxX);
disX = maxX - minX;

minY = min(y_corr);
maxY = max(y_corr);
medY = 0.5*(minY+maxY);
disY = maxY - minY;

if disY >= disX
    maxX = medX + 0.5 * disY;
    minX = medX - 0.5 * disY;
else
    maxY = medY + 0.5 * disX;
    minY = medY - 0.5 * disX;
end

figure(3);
subplot(2,2,4);
comet(x_corr,y_corr);
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square 
title('Single Bacteria Random Walk Trajectory (t=100.0s)');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,1);
comet(x_corr(1),y_corr(1));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Single Bacteria Random Walk Trajectory (t=0.0s)');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,2);
comet(x_corr(1:250),y_corr(1:250));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Single Bacteria Random Walk Trajectory (t=25.0s)');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,3);
comet(x_corr(1:500),y_corr(1:500));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Single Bacteria Random Walk Trajectory (t=50.0s)');
xlabel('x (\mum)');
ylabel('y (\mum)');

