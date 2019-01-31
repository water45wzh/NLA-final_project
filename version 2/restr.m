function I = restr(n)
%2n到n，限制算子（矩阵形式）
H1 = sparse(n-1,2*n-1);
H2 = sparse(n-1,2*n-1);
G = sparse(n,2*n);
for i = 1:n-1
    H1(i,2*i-1) = 1;
    H1(i,2*i+1) = 1;
    H2(i,2*i) = 1;
end
for i = 1:n
    G(i,2*i-1) = 1;
    G(i,2*i) = 1;
end
I1 = 0.25*kron(H2,G) + 0.125*kron(H1,G);
I2 = 0.25*kron(G,H2) + 0.125*kron(G,H1);
I = blkdiag(I1,I2);
end