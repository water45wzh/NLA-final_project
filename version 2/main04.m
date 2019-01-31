clear
%µÚËÄÎÊ
for k = 6:11
global I IPU IPP A B F n;
n = 2^k;
L = k;
a = 1;
v = 3;
I = cell(1,L-1);
IPU = cell(1,L-1);
IPP = cell(1,L-1);
A = cell(1,L);
B = cell(1,L);
F = F_vec(n);
for i = 1:L
    [A{i},B{i}] = mac(n/2^(i-1));
end
for i = 1:L-1
    [IPU{i},IPP{i}] = prol(n/(2^i));
end
for i = 1:L-1
    I{i} = restr(n/2^i);
end
[U,P] = uvp(n);

ittime = 0;
rhnorm = 1;
tic
while rhnorm > 1e-8
    ittime = ittime + 1;
    for i = 1:v
        U = v_cycle(U,F-B{1}*P);
    end
rhnorm = norm(F - A{1}*U - B{1}*P,2)/n^2;
if rhnorm < 1e-8
    break;
end
P = P + a*(B{1}'*U);
end
time = toc;
e = err(U,P);
fprintf("N=%d cputime=%f eN=%e ittime=%d a:%f v=%d\n",n,time,e,ittime,a,v);

end






