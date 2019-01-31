function [f1,g1] = res(u,v,p,f,g)
%残量
n = size(p,1);
%更新f
f1(:,1) = zeros(n,1);
f1(:,n+1) = zeros(n,1);
%边界
for j = 2:n
    f1(1,j) = f(1,j) + n^2*(u(2,j) + u(1,j+1) + u(1,j-1) - 3*u(1,j)) - n*(p(1,j) - p(1,j-1));
    f1(n,j) = f(n,j) + n^2*(u(n-1,j) + u(n,j+1) + u(n,j-1) - 3*u(n,j)) - n*(p(n,j) - p(n,j-1));
end
%内部
for i = 2:n-1
    for j = 2:n
        f1(i,j) = f(i,j) + n^2*(u(i+1,j) + u(i-1,j) + u(i,j+1) + u(i,j-1) - 4*u(i,j)) - n*(p(i,j) - p(i,j-1));
    end
end
%更新g
g1(1,:) = zeros(1,n);
g1(n+1,:) = zeros(1,n);
%边界
for i = 2:n
     g1(i,1) = g(i,1) + n^2*(v(i,2) + v(i-1,1) + v(i+1,1) - 3*v(i,1)) - n*(p(i,1) - p(i-1,1));
     g1(i,n) = g(i,n) + n^2*(v(i,n-1) + v(i-1,n) + v(i+1,n) - 3*v(i,n)) - n*(p(i,n) - p(i-1,n));
end
%内部
for i = 2:n
    for j = 2:n-1
        g1(i,j) = g(i,j) + n^2*(v(i,j+1) + v(i,j-1) + v(i-1,j) + v(i+1,j) - 4*v(i,j)) - n*(p(i,j) - p(i-1,j));
    end
end 
end