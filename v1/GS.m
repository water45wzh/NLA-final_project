function U = GS(A,B,U,F,P)
DA = diag(A);
LA = -tril(A);
UA = -triu(A);
U = U + (DA-LA)^-1*(F-B*P-A*U);
end