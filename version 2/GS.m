function U = GS(A,B,U,P,F)
%G-S������
U = U + tril(A)\(F - B*P - A*U );
end