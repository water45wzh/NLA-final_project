function [eN,rhnorm,ittime,cputime] = v_cycle1(n,k,v1,v2,a,method)

f = cell(1,k);
g = cell(1,k);
u = cell(1,k);
v = cell(1,k);
p = cell(1,k);

n0 = n;
for i = 1:k
    u{i} = zeros(n0,n0+1);
    v{i} = zeros(n0+1,n0);
    p{i} = zeros(n0,n0);
    n0 = n0/2;
end
[f{1},g{1}] = fg(n);

tic
ittime = 0;

rhnorm = 1;
while rhnorm/norm([f{1},g{1}'],2) > 1e-8
    ittime = ittime + 1;
    fprintf("Start ittime : %d\n",ittime);
    [u{1},v{1},p{1}] = method(u{1},v{1},p{1},f{1},g{1},v1,a);
    [fh,gh] = res(u{1},v{1},p{1},f{1},g{1});
    for i = 2:k
        [f{i},g{i},~] = restr(fh,gh,p{i-1});
        [u{i},v{i},p{i}] = method(u{i},v{i},p{i},f{i},g{i},v1,a);
        [fh,gh] = res(u{i},v{i},p{i},f{i},g{i});
    end

    for i = k:-1:2
        [uh,vh,ph] = prol(u{i},v{i},p{i});
        u{i-1} = u{i-1} + uh;
        v{i-1} = v{i-1} + vh;
        p{i-1} = p{i-1} + ph;
        [u{i-1},v{i-1},p{i-1}] = method(u{i-1},v{i-1},p{i-1},f{i-1},g{i-1},v2,a);
        
    end

    eN = err(u{1},v{1},p{1});
    rhnorm = rh_norm(u{1},v{1},p{1});
    fprintf("error:%f\nrh:%f\n",eN,rhnorm/norm([f{1},g{1}'],2));
end
cputime = toc
fprintf("Parameter:\nN = %d\nk = %d\nv1 = %d\nv2 = %d\na = %f\nerror = %f\nittime: = %f\ncputime: %d \n",n,k,v1,v2,a,eN,ittime,cputime);

end