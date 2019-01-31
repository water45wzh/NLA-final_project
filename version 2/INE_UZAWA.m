function [U,P] = INE_UZAWA(A,B,U,P,F,v,a)
%Inexact Uzawa�����������ʱ��ͣ����׼��Ϊ�ֶ����Ƶ�������Ϊv
n = sqrt(length(P));
for i = 1:v
    U = GS(A,B,U,P,F);
    P = P + a*(B'*U);
end