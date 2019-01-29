function m = v2m(v,n)
%������Ȼ˳��дΪ������n�о���ԭ
    k = size(v,1);
    if k == n^2
        m(n,n) = 0;
        for i = 1:n
            for j = 1:n
                m(i,j) = v((i-1)*n+j);
            end
        end
    elseif k == n*(n-1)
        m(n,n+1) = 0;
        for i = 1:n
            for j = 2:n
                m(i,j) = v((i-1)*(n-1)+j-1);
            end
        end
    elseif k == (n-2)*(n-1)
        m(n,n-1) = 0;
        for i = 2:n-1
            for j = 1:n-1
                m(i,j) = v((i-2)*(n-1)+j);
            end
        end
    end
end