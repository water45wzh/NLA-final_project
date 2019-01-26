function e = err(u,v,p)
n = size(p,1);
%精确解
u0 = zeros(n,n+1);
v0 = zeros(n+1,n);
for i = 1:n
    for j = 1:n+1
        u0(i,j) = func_u((j-1)/n,(i-1/2)/n);
        v0(j,i) = func_v((i-1/2)/n,(j-1)/n);
    end
end
%误差计算
e = norm(u0-u,'fro')^2 + norm(v0-v,'fro')^2;
e = sqrt(e)/n;
end