function v1 = prol(v)
%��������
[m,n] = size(v);
trans = 0;
if m ~= n
    %�ٶ�
    if m > n
        v = v';
        [m,n] = size(v);
        trans = 1;
    end
    v1(2*m,2*m+1) = 0;

    %������
    for j = 2:m
        %�߽�
        v1(1,2*j-1) = v(1,j)/2;
        v1(m,2*j-1) = v(m,j)/2;
        %�ڲ�
        for i = 1:m-1
            v1(2*i,2*j-1) = (3*v(i,j)+v(i+1,j))/4;
            v1(2*i+1,2*j-1) = (v(i,j)+3*v(i+1,j))/4;
        end
    end

    %ϸ����
    for j = 1:m
        for i = 1:m
            v1(2*i-1,2*j) = (v(i,j)+v(i,j+1))/2;
            v1(2*i,2*j) = (v(i,j)+v(i,j+1))/2;
        end
    end
    if trans == 1
        v1 = v1';
    end
else
    %ѹ��
    v1(2*m,2*m) = 0;
    for i = 1:m
        for j = 1:m
            v1(2*i-1,2*j-1) = v(i,j);
            v1(2*i,2*j-1) = v(i,j);
            v1(2*i-1,2*j) = v(i,j);
            v1(2*i,2*j) = v(i,j);
        end
    end
end
v1 = sparse(v1);
end