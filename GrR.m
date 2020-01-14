function PI = GrR(kappa,nu,eta,I)
f = @(theta,z) (nu./(eta.^(kappa*nu))./gamma(kappa)).^2./2.*(z.^(kappa*nu-1)).*(abs(cos(theta).*sin(theta)).^(kappa.*nu-1)).*exp(-1.*(sqrt(z)./eta).^nu.*(abs(cos(theta)).^nu + abs(sin(theta)).^nu));
m = length(I);
PI = zeros(1,m);
for k = 1:m
    z = I(k);
    PI(k) = quadgk(@(theta)f(theta,z),0,pi/2);
end