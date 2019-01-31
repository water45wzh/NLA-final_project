function [u,v] = solver(p,f,g)
%Uzawa第一步，精确求解方程
n = size(p,1);
P = m2v(p);
F = [m2v(f(:,2:n));m2v(g(2:n,:))];
[A,B] = mac(n);
b = F - B*P;
U = A\b;
u = v2m(U(1:n*(n-1)),n);
v = v2m(U(n*(n-1)+1:2*n*(n-1)),n+1);
end