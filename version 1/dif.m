function r = dif(u,v)
%²ÐÁ¿
n = size(u,1);
r = u(:,2:n+1) - u(:,1:n) + v(2:n+1,:) - v(1:n,:);
end