function PI = GC(a,b1,v1,b2,v2,I)
% a = 1;
% b1 = 1;
% v1 = 1;
% b2 = 1;
% v2 = 1;
% I = 0:0.1:10;
factor = b1.*b2./2./I./gamma(v1)./gamma(v2).*(sqrt(I).^(b1*v1))./(a.^(b2*v2));
f = @(x,z) x.^(b2.*v2-b1.*v1-1).*exp(-1.*(x./a).^b2-(sqrt(z)./x).^b1);
m = length(I);
PI = zeros(1,m);
for k = 1:m
    z = I(k);
    PI(k) = quadgk(@(x)f(x,z),0,Inf);
    PI(k) = PI(k).*factor(k);
end
