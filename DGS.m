function [U,P] = DGS(A,B,U,F,P)
n = floor(sqrt(size(U,1)/2))+1;
u = v2m(U(1:n*(n-1)),n);
v = v2m(U(n*(n-1)+1:2*n*(n-1)),n-1);
f = v2m(F(1:n*(n-1)),n);
g = v2m(F(n*(n-1)+1:2*n*(n-1)),n-1);
p = v2m(P,n);
