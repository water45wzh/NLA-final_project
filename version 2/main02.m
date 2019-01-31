clear
%µÚ¶þÎÊ
v1 = 4;
v2 = 1;
a = 0.8;
method = @UZAWA;
for k = 6:11
n = 2^k;
L = k;
F = cell(1,L);
F{1} = F_vec(n);
for i = 1:L
    [A{i},B{i}] = mac(n/2^(i-1));
    [U{i},P{i}] = uvp(n/2^(i-1));
end
for i = 1:L-1
    [IPU{i},IPP{i}] = prol(n/(2^i));
end
for i = 1:L-1
    I{i} = restr(n/2^i);
end
tic
ittime = 0;
rhnorm = 1;
while rhnorm > 1e-8
    ittime = ittime + 1;
    [ U{1},P{1} ] = method( A{1},B{1},U{1},P{1},F{1},v1,a );
    for i = 2:L
        Fr = F{i-1} - A{i-1}*U{i-1} - B{i-1}*P{i-1};
        if i == 2
        rhnorm = norm(Fr,2)/n^2;
        if rhnorm < 1e-8
            break;
        end
        end
        F{i} = I{i-1}*Fr;
        [U{i},P{i}] = uvp(n/2^(i-1));
        [U{i},P{i}] = method(A{i},B{i},U{i},P{i},F{i},v1,a);
    end
    for i = L-1:-1:1
        U{i} = U{i} + IPU{i}*U{i+1};
        P{i} = P{i} + IPP{i}*P{i+1};
        [U{i},P{i}] = method(A{i},B{i},U{i},P{i},F{i},v2,0.001);
    end
end
time = toc;
e = err(U{1},P{1});
fprintf("N=%d cputime=%f eN=%e ittime=%d\n",n,time,e,ittime);
end
