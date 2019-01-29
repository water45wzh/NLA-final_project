clear
iu = @INE_UZAWA;
eN = zeros(6,1);
ittime = zeros(6,1);
cputime = zeros(6,1);
for i = 6:11
    [eN(i-5),ittime(i-5),cputime(i-5)] = v_cycle(2^i,i-3,20,10,0.008,iu);
end