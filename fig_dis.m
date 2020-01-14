function fig_dis(dis,A,I,PA,PI)
figure; 
plot(A,PA,'Linewidth',2);
hold on; plot(I,PI,'Linewidth',2);
legend({'Amplitude','Intensity'},'FontSize',10,'Location','northeast','FontName','Times New Roman');
title(dis);
ylim([0,max([PA(:);PI(:)])]);
set(gca,'FontSize',10)