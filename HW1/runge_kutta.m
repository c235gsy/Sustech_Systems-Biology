function [x,y]=runge_kutta(ufunc,y0,h,start,tail)
n_step=floor((tail-start)/h);
x = zeros(n_step,1);
y = zeros(n_step,length(y0));
x(1)=start;
y(1,:)=y0;
for i=1:n_step
s1=ufunc(x(i),y(i,:));
s2=ufunc(x(i)+h/2,y(i,:)+h*s1/2);
s3=ufunc(x(i)+h/2,y(i,:)+h*s2/2);
s4=ufunc(x(i)+h,y(i,:)+h*s3);
y(i+1,:)=y(i,:)+h*(s1+2*s2+2*s3+s4)/6;
x(i+1)=x(i)+h;
end