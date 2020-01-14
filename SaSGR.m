function PI = SaSGR(gam,alpha,I)
% gamma = 1;
% alpha = 1;
% R = 0:0.5:5;
f = @(s,z) s.*exp(-(gam.*s).^alpha).*besselj(0,s.*sqrt(z))./2;
m = length(I);
PI = zeros(1,m);
for k = 1:m
    z = I(k);
    PI(k) = quadgk(@(s)f(s,z),0,Inf,'MaxIntervalCount',1500);
end
