function U = GS(A,B,U,P,F)
%G-Sµü´ú·¨
U = U + tril(A)\(F - B*P - A*U );
end