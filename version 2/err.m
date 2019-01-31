function e = err(U,P)
%计算误差，修改自version1中的err
n = sqrt(length(P));
u = U(1:n^2-n);
v = U(n^2-n+1:end);
u = [zeros(n,1),reshape(u,n,n-1),zeros(n,1)];
v = [zeros(1,n);reshape(v,n-1,n);zeros(1,n)];
p = reshape(P,n,n);

n = size(p,1);

u_exact = zeros(n,n+1);
v_exact = zeros(n+1,n);
% p_exact = zeros(n,n);

for i = 1:n
    for j = 1:n+1
u_exact(i,j) = func_u( (j-1)/n,(2*i-1)/(2*n) );
    end
end

for i = 1:n+1
    for j = 1:n
v_exact(i,j) = func_v( (2*j-1)/(2*n),(i-1)/n );
    end
end
% for i = 1:n
%     for j = 1:n
% p_exact(i,j) = func_p( (2*j-1)/(2*n),(2*i-1)/(2*n) );
%     end
% end

e = norm(u_exact-u,'fro')^2 + norm(v_exact-v,'fro')^2;
e = sqrt(e)/n;