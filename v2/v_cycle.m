function [eN,rh,ittime,cputime] = v_cycle(n,k,v1,v2,a,method)

f = cell(1,k);
g = cell(1,k);
u = cell(1,k);
v = cell(1,k);
p = cell(1,k);

u{1} = zeros(n,n+1);
v{1} = zeros(n+1,n);
p{1} = zeros(n,n);
for i = 1:k
    n0 = n/2^(i-1);
    [f{i},g{i}] = fg(n0);
end

tic
ittime = 0;

u{k} = zeros(n0,n0+1);
v{k} = zeros(n0+1,n0);
p{k} = zeros(n0,n0);


for i = k:-1:2
    [u{i},v{i},p{i}] = method(u{i},v{i},p{i},f{i},g{i},v2,a);
    [u{i-1},v{i-1},p{i-1}] = prol(u{i},v{i},p{i});
end

[u{1},v{1},p{1}] = method(u{1},v{1},p{1},f{1},g{1},v2,a);
rh = rh_norm(u{1},v{1},p{1});

while rh/norm([f{1},g{1}'],2) > 1e-8
    ittime = ittime + 1;
    fprintf("Start ittime : %d\n",ittime);
    [u{1},v{1},p{1}] = method(u{1},v{1},p{1},f{1},g{1},v1,a);
    for i = 2:k
        [ u{i},v{i},p{i} ] = restr(u{i-1},v{i-1},p{i-1});
        [ u{i},v{i},p{i} ] = method(u{i},v{i},p{i},f{i},g{i},v1,a);
    end

    for i = k:-1:2
        [u{i},v{i},p{i}] = method(u{i},v{i},p{i},f{i},g{i},v2,a);
        [u{i-1},v{i-1},p{i-1}] = prol(u{i},v{i},p{i});
    end

    [u{1},v{1},p{1}] = method(u{1},v{1},p{1},f{1},g{1},v2,a);

    eN = err(u{1},v{1},p{1});
    rh = rh_norm(u{1},v{1},p{1});
    fprintf("error:%f\nrh:%f\n",eN,rh/norm([f{1},g{1}'],2));
end
cputime = toc
fprintf("Parameter:\nN = %d\nk = %d\nv1 = %d\nv2 = %d\na = %f\nerror = %f\nittime: = %f\ncputime: %d \n",n,k,v1,v2,a,eN,ittime,cputime);

end
