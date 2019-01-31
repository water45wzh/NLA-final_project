function U = GS0(A,U,F,v)
%G-S迭代法，迭代v次
for i = 1:v
    U = U + tril(A)\(F - A*U);
end
end