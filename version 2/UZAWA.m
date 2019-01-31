function [U,P] = UZAWA(A,B,U,P,F,v,a)
%Uzawa迭代法，迭代v次
n = sqrt(length(P));
for i = 1:v
U = A\(F - B*P);
P = P + a*(B'*U);
end