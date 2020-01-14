function PI = W(beta,p,q,n,I)
% beta = 1;
% p = 1;
% q = 1;
% n = 1;
% A = 0:0.1:5;
temp1 = gamma(p+q)./beta./gamma(n)./gamma(p);
temp2 = (I./beta).^((p+n-3)./2).*exp(-1.*I./2./beta);
temp3 = whittakerW((-p-2*q+n+1)./2,(p-n)./2,I./beta);
PI = temp1.*temp2.*temp3;
% figure; plot(A,P)