function [u,v,p] = INE_UZAWA(u,v,p,f,g,v1,a)
%Inexact Uzawaµü´ú·¨
n = size(p,1);
for k = 1:v1
    [u,v] = GS(u,v,p,f,g);
    p = p - a*n*(u(:,2:n+1) - u(:,1:n) + v(2:n+1,:) - v(1:n,:));
end
end