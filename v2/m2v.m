function v = m2v(m)
%������Ȼ����дΪ����
    [k,l] = size(m);
    v(k*l) = 0;
    for i = 1:k
        for j = 1:l
            v((i-1)*l+j) = m(i,j);
        end
    end
    v = v';
end