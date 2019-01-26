function v1 = rest(v)
%限制算子
[m,n] = size(v);
trans = 0;
if m ~= n
    %速度
    if m > n
        v = v';
        [m,n] = size(v);
        trans = 1;
    end
    m0 = m/2;
    v1(m0,m0+1) = 0;
    for i = 1:m0
        for j = 2:m0
            v1(i,j) = (2*v(2*i-1,2*j-1)+2*v(2*i,2*j-1)+v(2*i-1,2*j-2)+v(2*i-1,2*j)+v(2*i,2*j-2)+v(2*i,2*j))/8;
        end
    end
    if trans == 1
        v1 = v1';
    end
else
    %压力
    m0 = m/2;
    v1(m0,m0) = 0;
    for i = 1:m0
        for j = 1:m0
            v1(i,j) = (v(2*i-1,2*j-1)+v(2*i,2*j-1)+v(2*i-1,2*j)+v(2*i,2*j))/4;
        end
    end
end
v1 = sparse(v1);
end