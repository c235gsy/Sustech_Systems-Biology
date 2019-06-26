
% 对该微分方程组用ode45和自编的龙格库塔函数进行比较，调用如下：
[T,F] = ode45(@test_func,[0 15],[1 1 3]);
subplot(121)
plot(T,F)%Matlab自带的ode45函数效果
title('ode45函数效果')

[T1,F1]=rk(@test_func,[1 1 3],0.01,0,15);
%测试时改变test_fun的函数维数，别忘记改变初始值的维数
subplot(122)
plot(T1,F1)%自编的龙格库塔函数效果
title('自编的   龙格库塔函数')

