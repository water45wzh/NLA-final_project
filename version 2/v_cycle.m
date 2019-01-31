function U1 = v_cycle(U0,F0)
%第四问中采用的v_cycle
global A IPU I n;
v1 = 1;
v2 = 0;
L = log2(n);
%初始化变量
F = cell(1,L);
U = cell(1,L);
F{1} = F0;
U{1} = U0;
U{1} = GS0(A{1},U{1},F{1},v1);
for i = 2:L
    F_res = F{i-1} - A{i-1}*U{i-1};
    F{i} = I{i-1}*F_res;
    U{i} = zeros(2*(n/2^(i-1))*(n/2^(i-1)-1),1);
    if i < L
        U{i} = GS0(A{i},U{i},F{i},v1);
    else 
            U{i} = A{i}\F{i};
    end
end
for i = L-1:-1:1
    U{i} = U{i} + IPU{i}*U{i+1};
    U{i} = GS0(A{i},U{i},F{i},v2);
end
U1 = U{1};
end