function PI = GGR(gam,c,I)
f = @(theta,z) gam^2*c^2./2./(gamma(1/c)^2)*exp(-(gam.*sqrt(z)).^c.*(abs(cos(theta)).^c + abs(sin(theta)).^c));
m = length(I);
PI = zeros(1,m);
for k = 1:m
    z = I(k);
    PI(k) = quadgk(@(theta)f(theta,z),0,pi/2);
end