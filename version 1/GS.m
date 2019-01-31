function [u,v] = GS(u,v,p,f,g,v1,a)
%G-S迭代法
n = size(p,1);
h = 1/n;

%更新u
%内部
for i = 2:n-1
    for j = 2:n
        u(i,j) = (h^2*f(i,j) - h*(p(i,j) - p(i,j-1)) + u(i,j+1)+u(i,j-1) + u(i-1,j) + u(i+1,j))/4;
    end
end
%边界
for j = 2:n
    u(1,j) = (h^2*f(1,j) - h*(p(1,j) - p(1,j-1)) + u(1,j+1) + u(1,j-1) + u(2,j))/3;
    u(n,j) = (h^2*f(n,j) - h*(p(n,j) - p(n,j-1)) + u(n,j+1) + u(n,j-1) + u(n-1,j))/3;
end

%更新v
%内部
for i = 2:n
    for j = 2:n-1
        v(i,j) = (h^2*g(i,j) - h*(p(i,j) - p(i-1,j)) + v(i,j+1) + v(i,j-1) + v(i-1,j) + v(i+1,j))/4;
    end
end
%边界
for i = 2:n
    v(i,1) = (h^2*g(i,1) - h*(p(i,1) - p(i-1,1)) + v(i,2) + v(i-1,1) + v(i+1,1))/3;
    v(i,n) = (h^2*g(i,n) - h*(p(i,n) - p(i-1,n)) + v(i,n-1) + v(i-1,n) + v(i+1,n))/3;
end
end