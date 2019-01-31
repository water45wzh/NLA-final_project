function [IPU,IPP] = prol(n)
%n到2n，提升算子（矩阵形式）
A = sparse(2*n,n);
for j = 2:n-1
    A(2*j-1,j) = 3/4;
    A(2*j,j) = 3/4;
    A(2*j-2,j) = 1/4;
    A(2*j+1,j) = 1/4;
end
A(1,1) = 1/2;
A(2,1) = 3/4;
A(3,1) = 1/4;
A(end,end) = 1/2;
A(end-1,end) = 3/4;
A(end-2,end) = 1/4;
B = sparse(2*n-1,n-1);
for j = 1:n-1
    B(2*j,j) = 1;
    B(2*j-1,j) = 1/2;
    B(2*j+1,j) = 1/2;
end
L1 = kron(B,A);
L2 = kron(A,B);
IPU = blkdiag(L1,L2);
C = sparse(2*n,n);
for i = 1:n
    C(2*i-1,i) = 1;
    C(2*i,i) = 1;
end
IPP = kron(C,C);
end

