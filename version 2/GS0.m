function U = GS0(A,U,F,v)
%G-S������������v��
for i = 1:v
    U = U + tril(A)\(F - A*U);
end
end