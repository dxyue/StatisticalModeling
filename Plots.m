%**********Plots for SAR image statistical modeling Part I:Single-pixel model*********************
% Founded by Dong-Xiao Yue
% Date: 2020.1.14
% *************************distributions************************************************************
I = 0:0.1:10;
A = sqrt(I);
% ********************************************************
%% Gamma distribution
sigma = 1;
n = 1;
PI_gamma = 1./gamma(n).*((n./sigma)^n).*(I.^(n-1)).*exp(-1.*n.*I./sigma);
PA_gamma = PI_gamma.*2.*A;
%% G distribution
beta = 0.5; % beta = lambda./2./mu
gam = 0.5; % lambda/2
alpha = -1/2;
n = 1;
PI_G = (n.^n).*(beta./gam).^(alpha/2)./gamma(n)./besselk(alpha,2.*sqrt(beta.*gam)).*(I.^(n-1)).*(((gam + n.*I)./beta).^((alpha-n)./2)).*besselk(alpha-n,2.*sqrt(beta.*(gam + n.*I)));
PA_G = PI_G.*2.*A;
%% K distribution
beta = 1;
alpha = 1;
n = 1;
PI_K = 2.*beta.*n./gamma(n)./gamma(alpha).*((beta.*n.*I).^((alpha+n)./2-1)).*besselk(alpha-n,2*sqrt(beta.*n.*I));
PA_K = PI_K.*2.*A;
%% G0 distribution
gam = 1;
alpha = -2;
n = 1;
PI_G0 = n.^n.*gamma(n-alpha).*(gam.^(-1.*alpha)).*(I.^(n-1))./gamma(n)./gamma(-1.*alpha)./((gam + n.*I).^(n-alpha));
PA_G0 = PI_G0.*2.*A;
%% Gh distribution
lambda = 1;
mu = 1;
n = 1;
PI_Gh = sqrt(2*lambda/pi).*exp(lambda./sqrt(mu)).*(n.^n).*(I.^(n-1))./gamma(n).*(((lambda + 2.*n.*I).*mu./lambda).^((-1-2*n)./4)).*besselk(n + 1/2, (lambda + 2.*n.*I).*lambda./mu);
PA_Gh = PI_Gh.*2.*A;
%% GC distribution
a = 1/4;
b1 = 1;
v1 = 1;
b2 = 1;
v2 = 1;
PI_GC = GC(a,b1,v1,b2,v2,I);
PA_GC = PI_GC.*2.*A;
%% Rice distribution
sigma = 0.5;
A0 = 0.5;
PI_Rice = 1./2./sigma.^2.*exp(-1.*(I + A0^2)./2./sigma^2).*besseli(0,sqrt(sigma).*A0./(sigma.^2));
PA_Rice = PI_Rice.*2.*A;
%% RiIG distribution
alpha = 2;
beta = 0;
delta = 10;
PI_RiIG= RiIG(alpha,beta,delta,I);
PA_RiIG = PI_RiIG.*2.*A;
%% W distribution
beta = 1;
p = 1;
q = 1;
n = 1;
PI_W = W(beta,p,q,n,I);
PA_W = PI_W.*2.*A;
%% U distribution
beta = 1;
p = 1;
q = 1;
n = 1;
PI_U = U(beta,p,q,n,I);
PA_U = PI_U.*2.*A;
%% SaSGR distribution
gam = 1;
alpha = 1;
PI_SaSGR = SaSGR(gam,alpha,I);
PA_SaSGR = PI_SaSGR.*2.*A;
%% GGR distribution
gam = 1;
c = 1;
PI_GGR = GGR(gam,c,I);
PA_GGR = PI_GGR.*2.*A;
%% GrR distribution
kappa = 1;
nu = 1;
eta = 1;
PI_GrR = GrR(kappa,nu,eta,I);
PA_GrR = PI_GrR.*2.*A;
%% log-normal distribution
beta = 1;
V = 1;
PI_LN = 1./I./sqrt(2.*pi.*V).*exp(-1.*(log(I)-beta).^2./2./V);
PA_LN = PI_LN.*2.*A;
%% Weibull distribution
c = 1;
b = 1;
PI_WB = c.*I.^(c-1)./(b.^c).*exp(-1.*(I./b).^c);
PA_WB = PI_WB.*2.*A;
%% Fisher distribution
L = 1;
M = 1;
mu = 1;
PI_F = gamma(L+M)./gamma(L)./gamma(M).*L./M./mu.*((L.*I./M./mu).^(L-1))./((1 + L.*I./M./mu).^(L + M));
PA_F = PI_F.*2.*A;
%% GrD-1 distribution
a = 1;
b = 1;
v = 1;
PI_GrD1 = b./a./gamma(v).*((I./a).^(b.*v-1)).*exp(-1.*((I./a).^b));
PA_GrD1 = PI_GrD1.*2.*A;
%% GrD-2 distribution
v = 1;
k = 1;
eta = 1;
PI_GrD2 = abs(v).*k.^k./eta./gamma(k).*((I./eta).^(k.*v-1)).*exp(-1.*k.*(I./eta).^v);
PA_GrD2 = PI_GrD2.*2.*A;
% **********************Figures******************************
figure; 
plot(A,PA_gamma,'Linewidth',2);
hold on; plot(I,PI_gamma,'Linewidth',2);
legend({'Amplitude','Intensity'},'FontSize',10,'Location','northeast','FontName','Times New Roman');
title('Gamma distribution');
ylim([0,max([PA_gamma(:);PI_gamma(:)])]);
set(gca,'FontSize',10)

fig_dis('Gamma distribution',A,I,PA_gamma,PI_gamma)
print('-dtiff','-r300',['Figures\','Gamma distribution'])

fig_dis('G distribution',A,I,PA_G,PI_G)
print('-dtiff','-r300',['Figures\','G distribution'])

fig_dis('K distribution',A,I,PA_K,PI_K)
print('-dtiff','-r300',['Figures\','K distribution'])

fig_dis('G0 distribution',A,I,PA_G0,PI_G0)
print('-dtiff','-r300',['Figures\','G0 distribution'])

fig_dis('Gh distribution',A,I,PA_Gh,PI_Gh)
print('-dtiff','-r300',['Figures\','Gh distribution'])

fig_dis('GC distribution',A,I,PA_GC,PI_GC)
print('-dtiff','-r300',['Figures\','GC distribution'])

fig_dis('Rice distribution',A,I,PA_Rice,PI_Rice)
print('-dtiff','-r300',['Figures\','Rice distribution'])

fig_dis('RiIG distribution',A,I,PA_RiIG,PI_RiIG)
print('-dtiff','-r300',['Figures\','RiIG distribution'])

fig_dis('W distribution',A,I,PA_W,PI_W)
print('-dtiff','-r300',['Figures\','W distribution'])

fig_dis('U distribution',A,I,PA_U,PI_U)
print('-dtiff','-r300',['Figures\','U distribution'])

fig_dis('S\alphaSGR distribution',A,I,PA_SaSGR,PI_SaSGR)
print('-dtiff','-r300',['Figures\','SaSGR distribution'])

fig_dis('GGR distribution',A,I,PA_GGR,PI_GGR)
print('-dtiff','-r300',['Figures\','GGR distribution'])

fig_dis('GrR distribution',A,I,PA_GrR,PI_GrR)
print('-dtiff','-r300',['Figures\','GrR distribution'])

fig_dis('LN distribution',A,I,PA_LN,PI_LN)
print('-dtiff','-r300',['Figures\','LN distribution'])

fig_dis('WB distribution',A,I,PA_WB,PI_WB)
print('-dtiff','-r300',['Figures\','WB distribution'])

fig_dis('F distribution',A,I,PA_F,PI_F)
print('-dtiff','-r300',['Figures\','F distribution'])

fig_dis('G\GammaD1 distribution',A,I,PA_GrD1,PI_GrD1)
print('-dtiff','-r300',['Figures\','GrD1 distribution'])

fig_dis('G\GammaD2 distribution',A,I,PA_GrD2,PI_GrD2)
print('-dtiff','-r300',['Figures\','GrD2 distribution'])
