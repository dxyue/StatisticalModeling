function PI = RiIG(alpha,beta,delta,I)
% alpha = 15;
% beta = 9;
% delta = 20;
% A = 0:0.1:30;
if (alpha^2-beta^2) < 0
    disp('Error: alpha must be bigger than beta');
end
gamma = sqrt(alpha.^2-beta.^2);
temp1 = sqrt(1/2/pi).*(alpha.^(3/2)).*delta.*exp(delta.*gamma);
temp2 = 1./((delta.^2+I).^(3/4));
temp3 = besselk(3/2,alpha.*sqrt(delta.^2+I)).*besseli(0,beta.*sqrt(I));
PI = temp1.*temp2.*temp3;


