function [U,P] = DGS(A,B,Ap,U,P,F,G,v)
%DGS������������v��
for i = 1:v
U = U + tril(A)\(F - A*U - B*P);
B_dq = B*(tril(Ap)\(G - B'*U) );
U = U + B_dq;
P = P - B'*B_dq;
end