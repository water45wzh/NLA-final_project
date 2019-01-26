function rhn = rh_norm(u,v,p)
n = size(p,1);
%计算精确解
f0 = zeros(n,n+1);
g0 = zeros(n+1,n);
p0 = zeros(n,n);
u0 = zeros(n,n+1);
v0 = zeros(n+1,n);
for i = 1:n
    for j = 1:n+1
        u0(i,j) = func_u((j-1)/n,(i-1/2)/n);
        v0(j,i) = func_v((i-1/2)/n,(j-1)/n);
    end
end
for i = 1:n
    for j = 1:n
        p0(i,j) = func_p((j-1/2)/n,(i-1/2)/n);
    end
end

%计算边界条件
for i = 1:n+1
b(i) = func_b((i-1)/n,n);
l(i) = func_l((i-1)/n,n);
end
%在迭代法的计算式中已考虑外法向量方向导致的正负问题
t = b;
r = l;

%计算初值
for i = 1:n
    for j = 1:n+1
        f0(i,j) = func_f((j-1)/n,(i-1/2)/n);
        g0(j,i) = func_g((i-1/2)/n,(j-1)/n);
    end
end
%将边界条件的扰动加入初值
for j = 1:n+1
    f0(1,j) = f0(1,j) - n*b(j);
    f0(n,j) = f0(n,j) + n*t(j);
    g0(j,1) = g0(j,1) - n*l(j);
    g0(j,n) = g0(j,n) + n*r(j);
end

%计算残量
[r1,r2] = res(u,v,p,f0,g0);
rhn = norm([r1,r2'],'fro');
end