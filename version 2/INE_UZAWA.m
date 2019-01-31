function [U,P] = INE_UZAWA(A,B,U,P,F,v,a)
%Inexact Uzawa迭代法，求解时由停机标准改为手动控制迭代次数为v
n = sqrt(length(P));
for i = 1:v
    U = GS(A,B,U,P,F);
    P = P + a*(B'*U);
end