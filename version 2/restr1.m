function I = restr1(n)
%2n到n，限制算子（矩阵形式）
A = sparse(n,2*n);
for i = 1:n
    A(i,2*i-1) = 1/2;
    A(i,2*i) = 1/2;
end
I = kron(A,A);
end