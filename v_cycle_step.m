function [u1,rh] = v_cycle_step(N,k,v1,v2,method)
    h = 1/N;
    [A,B] = mac(N);
    u = zeros(N,N+1);
    v = zeros(N+1,N);
    U{1} = [m2v(u(:,2:N));m2v(v(2:N,:))];
    P = zeros(N*N,1);
    f = zeros(N,N+1);
    g = zeros(N+1,N);
    for i = 1:N
        for j = 1:N+1
            f(i,j) = func_f((j-1)*h,(i-1/2)*h);
            g(j,i) = func_g((i-1/2)*h,(j-1)*h);
        end
    end
    F{1} = [m2v(f(:,2:N));m2v(g(2:N,:))];
    for t = 1:v1
        U{1} = method(A,B,U{1},F{1},P);
    end
    rh = F{1}-A*U{1};
    %ÏÞÖÆ
    for l = 1:k
        f = v2m(rh(1:N*(N-1)),N);
        g = v2m(rh(N*(N-1)+1:2*N*(N-1)),N+1);
        N = N/2;
        f = rest(f);
        g = rest(g);
        F{l+1} = [m2v(f(:,2:N));m2v(g(2:N,:))];
        u = zeros(N,N+1);
        v = zeros(N+1,N);
        U{l+1} = [m2v(u(:,2:N));m2v(v(2:N,:))];
        [A,B] = mac(N);
        P = zeros(N*N,1);
        for t = 1:v1
            U{l+1} = method(A,B,U{l+1},F{l+1},P);
        end
        r = F{l+1}-A*U{l+1};
    end
    %ÌáÉý
    for l = 1:k
        u = v2m(U{k+2-l}(1:N*(N-1)),N);
        v = v2m(U{k+2-l}(N*(N-1)+1:2*N*(N-1)),N+1);
        u = prol(u);
        v = prol(v);
        N = N*2;
        U{k+2-l} = [m2v(u(:,2:N));m2v(v(2:N,:))];
        size(U{k+1-l})
        size(U{k+2-l})
        U{k+1-l} = U{k+1-l} + U{k+2-l};
        [A,B] = mac(N);
        P = zeros(N*N,1);
        for t = 1:v2
            U{k+1-l} = method(A,B,U{k+1-l},F{k+1-l},P);
        end
    end
    u1 = U{1};
    rh = F{1} - A*U{1};
end