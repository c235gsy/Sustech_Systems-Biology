% filename: mmfunc.m
function dydt = mmfunc(t,y)
% [S] = y(1), [ES] = y(2), [P] = y(3)\\

k1=1e3; 			% units 1/(Ms)
k_1=0.1e-0;        	% units 1/s
k2=0.05; 		    % units 1/s
E0=0.5e-3;          % units M
dydt = [-k1*E0*y(1)+(k1*y(1)+k_1)*y(2);
   		k1*E0*y(1)-(k1*y(1)+k_1+k2)*y(2);
			k2*y(2)];
