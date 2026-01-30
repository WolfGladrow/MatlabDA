disp('file: NormalPDFprobabilities.m')
% normal PDF, probabilities by integration
dx = 0.01; 
x = -4:dx:4; 
y = normpdf(x,0,1);

x1 = -4; x2 = 0; 
y1 = normpdf(x1,0,1); y2 = normpdf(x2,0,1); 
xn = x1:dx:x2; 
yn = normpdf(xn,0,1); 
xf = [x2, x1, xn]; 
yf = [0, 0, yn];

x3 = 1; x4 = 2; 
y3 = normpdf(x3,0,1); y4 = normpdf(x4,0,1); 
xn3 = x3:dx:x4; 
yn3 = normpdf(xn3,0,1); 
xf3 = [x4, x3, xn3]; 
yf3 = [0, 0, yn3];

P2 = integral(@(z) normpdf(z,0,1), x3, x4);
P2r = round(P2,4);

figure;
plot(x,y,'k','LineWidth',4);
hold on;
fill(xf,yf,'b')
fill(xf3,yf3,'m')
plot(x,y,'k','LineWidth',4);

text(-3,0.25,'P_1 = 1/2','Color','blue','FontSize',15,'HorizontalAlignment','left')
text(1.2,0.25,sprintf('P_2 = %.4f',P2r),'Color','magenta','FontSize',15,'HorizontalAlignment','left')

xlim([-3 3])
xlabel('x','FontSize',15)
ylabel('Normal PDF','FontSize',15)
set(gca,'FontSize',12)

P2a = normcdf(x4,0,1) - normcdf(x3,0,1);
%  print('-dpng','NormalPDFprobabilities260129.png')
% print('-depsc','NormalPDFprobabilities260129.eps')
% -----------------------------------------------------------------------------
% Remarks:
% Here, the aim was to show that probabilities can be calculated 
%    by integration over probability densities.
% The R routine pnorm() provides such integrals in fast way and, 
%   for example, the probability for x3 = 1 <= x <= x4 = 2 can 
%   be calculated as follows: pnorm(x4) - pnorm(x3)
% Actually, pnorm() provides the cumulative distribution function 
%   (CDF) for the normal distribution.
% -----------------------------------------------------------------------------