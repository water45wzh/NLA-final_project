function v = m2v(m)
%矩阵按自然次序写为向量
    [k,l] = size(m);
    v(k*l) = 0;
    for i = 1:k
        for j = 1:l
            v((i-1)*l+j) = m(i,j);
        end
    end
    v = v';
end