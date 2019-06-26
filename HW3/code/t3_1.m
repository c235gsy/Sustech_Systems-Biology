clear all;
load track_data.mat 
num= length(tracks);
x=tracks(1).tracksCoordAmpCG(1,1:8:end);
y=tracks(1).tracksCoordAmpCG(1,2:8:end);
x(isnan(x))=[];y(isnan(y))=[];

for m=1:1:num
    xm=tracks(m).tracksCoordAmpCG(1,1:8:end);
    ym=tracks(m).tracksCoordAmpCG(1,2:8:end);
    xm_withNan = xm;
    ym_withNan = ym;
    xm(isnan(xm))=[];
    ym(isnan(ym))=[];
    if length(xm) > length(x)
       %x = xm;
       %y = ym;
       x = xm_withNan;
       y = ym_withNan;
    end   
end

y_end = [y ,0];
y_start = [0, y];
track_y0 = y_end-y_start;
track_y1 = track_y0(2:end-1);
x_end = [x ,0];
x_start = [0, x];
track_x0 = x_end-x_start;
track_x1 = track_x0(2:end-1);

x_corr = x;
y_corr = y;

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

turns = length(x);

figure(1);
subplot(2,2,1);
comet(x_corr(1),y_corr(1));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Track of single bacteria (t=0)','interpreter','latex');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,2);
comet(x_corr(1:round(0.25*turns)),y_corr(1:round(0.25*turns)));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Track of single bacteria (t=0.25 $t_d$)','interpreter','latex');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,3);
comet(x_corr(1:round(0.5*turns)),y_corr(1:round(0.5*turns)));
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Track of single bacteria (t=0.50 $t_d$)','interpreter','latex');
xlabel('x (\mum)');
ylabel('y (\mum)');

subplot(2,2,4);
comet(x_corr,y_corr);
axis([minX-0.1*disX maxX+0.1*disX minY-0.1*disY maxY+0.1*disY]);
axis square
title('Track of single bacteria (t=$t_d$)','interpreter','latex');
xlabel('x (\mum)');
ylabel('y (\mum)');


trknb=length(tracks); 
x=zeros(997,trknb)+999999; 
y=zeros(997,trknb)+999999;
tx=zeros(997,1); 
ty=zeros(997,1);
txx=zeros(997,1); 
tyy=zeros(997,1);

for i=1:1:trknb
	
    time_0=tracks(i).seqOfEvents(1,1);
	time_t=tracks(i).seqOfEvents(2,1);
	tracksnumber=size(tracks(i).seqOfEvents);
	
    x_temp=tracks(i).tracksCoordAmpCG(1,1:8:end);
	y_temp=tracks(i).tracksCoordAmpCG(1,2:8:end);
	
    for j=time_0+1:1:time_t-1  
		
        x0=x_temp(j-time_0);
		x1=x_temp(j-time_0+1);
		x(j-1,i)=x1-x0; 
		
        y0=y_temp(j-time_0);
		y1=y_temp(j-time_0+1);
		y(j-1,i)=y1-y0;
	end
end

counter=zeros(997,1)+trknb;
for j=1:1:997
	for i=1:1:trknb
		if(x(j,i)==999999||isnan(x(j,i))||y(j,i)==999999)
		x(j,i)=0;
		y(j,i)=0;
		counter(j)=counter(j)-1;
		else
		tx(j)=tx(j)+x(j,i);
		ty(j)=ty(j)+y(j,i);
		end
	end
	if(j==1)
	tx(j)=tx(j)/counter(j);
	ty(j)=ty(j)/counter(j);
	txx(j)=tx(j)*tx(j);
	tyy(j)=ty(j)*ty(j);
	else
		if (counter(j)==0)
		counter(j)=1;
		end
		tx(j)=tx(j)/counter(j)+x(j-1);
		txx(j)=tx(j)*tx(j)+txx(j-1);
		
        ty(j)=ty(j)/counter(j)+y(j-1);
		tyy(j)=ty(j)*ty(j)+tyy(j-1);
	end
end

figure(2);
subplot(3,2,1);
h=histogram(abs(track_x1/0.1),80);
h.FaceColor = [0 0.5 0.5];
axis([0 13 0 25]);
title('Single E.coli walk on X-axis');
ylabel('Counter');
xlabel('Move Speed(\mum/s)');

subplot(3,2,2);
h=histogram(abs(track_y1/0.1),100);
h.FaceColor = [0 0.5 0.5];
axis([0 13 0 25]);
title('Single E.coli walk on Y-axis');
ylabel('Counter');
xlabel('Move Speed(\mum/s)');

ax33 = subplot(3,2,3);
disp(length(x_corr));
disp(length(y_corr));
x_corr = x_corr - x_corr(1);
y_corr = y_corr - y_corr(1);
plot(0.1:0.1:63.5, [x_corr',y_corr'],'LineWidth',3);
%axis([0 100 -10 30]);
title('Single E.coli walk');
legend('X-Movement','Y-Movement');
ylabel('\mum');
xlabel('Time(s)');

ax34 = subplot(3,2,4);
plot(0.1:0.1:63.5,[x_corr'.^2,y_corr'.^2],'LineWidth',3);
%axis([0 100 0 60000]);
title('Single E.coli walk');
legend('Square of X-Movement','Square of Y-Movement');
ylabel('\mum^2');
xlabel('Time(s)');

ax35 = subplot(3,2,5);
plot(0.1:0.1:99.7, [tx,ty],'LineWidth',3);
axis([0 100 -10 30]);
title('E.coli population walk');
legend('Mean of X-Movement','Mean of Y-Movement');
ylabel('\mum');
xlabel('Time(s)');

ax36 = subplot(3,2,6);
plot(0.1:0.1:99.7,[txx,tyy],'LineWidth',3);
%axis([0 100 0 60000]);
title('E.coli population walk');
legend('Mean Squance of X-Movement','Mean Squance of Y-Movement');
ylabel('\mum^2');
xlabel('Time(s)');

linkaxes([ax33,ax35],'y')
linkaxes([ax34,ax36],'y')
