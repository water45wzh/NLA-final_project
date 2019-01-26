function [f,g] = fg(n)
%计算f,g
f = zeros(n,n+1);
g = zeros(n+1,n);
b = zeros(n+1,1);
t = zeros(n+1,1);
l = zeros(n+1,1);
r = zeros(n+1,1);

for i = 1:n+1
    b(i) = func_b((i-1)/n,n);
    l(i) = func_l((i-1)/n,n);
end
%在迭代法的计算式中已考虑外法向量方向导致的正负问题
t = b;
r = l;

for i = 1:n
    for j = 1:n+1
        f(i,j) = func_f((j-1)/n,(i-1/2)/n);
        g(j,i) = func_g((i-1/2)/n,(j-1)/n);
    end
end
for j = 1:n+1
    f(1,j) = f(1,j) - n*b(j);
    f(n,j) = f(n,j) + n*t(j);
    g(j,1) = g(j,1) - n*l(j);
    g(j,n) = g(j,n) + n*r(j);
end
end