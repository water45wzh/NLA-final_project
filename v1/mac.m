function [A,B] = mac(N)
    H(N,N) = 0;
    G(N-1,N-1) = 0;
    H(1,1) = 3;
    H(1,2) = -1;
    H(N,N) = 3;
    H(N,N-1) = -1;
    T(N-1,N) = 0;
    for i = 2:N-1
        H(i,i-1) = -1;
        H(i,i) = 4;
        H(i,i+1) = -1;
        G(i-1,i) = -1;
        G(i,i-1) = -1;
    end
    for j = 1:N-1
        T(j,j) = -1;
        T(j,j+1) = -1;
    end
    A = blkdiag(kron(eye(N-1),H)+kron(G,eye(N)),kron(H,eye(N-1))+kron(eye(N),G));
    A = N^2*A;
    B = [kron(T,eye(N));kron(eye(N),T)];
    B = N*B;
    A = sparse(A);
    B = sparse(B);
end