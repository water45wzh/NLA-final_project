function [U,P] = UZAWA(A,B,U,P,F,v,a)
%Uzawa������������v��
n = sqrt(length(P));
for i = 1:v
U = A\(F - B*P);
P = P + a*(B'*U);
end