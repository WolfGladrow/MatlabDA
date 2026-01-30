disp('file: NHSTttestRejectionRegion.m')
disp(datestr(now))

% plot data & mu0, SE, 1-sample-t-test 
x = [1.5, 0.3, 1.8, -1.4, 0.8, 3.0, -0.3, 0.2, -0.4, 1.9, 0.0, 0.3, -1.0, ...
     1.2, 3.8, 0.5, -0.8, 2.0, 1.1, 1.2, -0.4, 2.7, 0.5, -1.4, 1.1];

T0 = 0;   % hypothesized temperature of null hypothesis H0

xmean = mean(x);
disp([num2str(round(xmean,2)) ' sample mean (deg.C)'])

n = length(x);
disp([num2str(n) ' sample size n'])

s = std(x,0);                 % sample SD (matches R sd)
SE = s / sqrt(n);

disp([num2str(round(s,2)) ' s = sd(x) (deg.C)'])
disp([num2str(round(var(x,0),2)) ' s = var(x) (deg.C)^2'])
disp([num2str(round(SE,4)) ' standard error of the mean (deg.C)'])

dis = (xmean - T0) / SE;
disp([num2str(round(dis,2)) ' t = (xmean-mu0)/SE'])

tvalue = (xmean - T0) / SE;
disp([num2str(round(tvalue,3)) ' tvalue (pedestrian)'])

[~,~,~,stats] = ttest(x,T0);
tobs = stats.tstat;
disp([num2str(round(tobs,3)) ' tvalue = tobs (t-test)'])

% -------------------------------------------------------------------------
% Rejection region
nu = n - 1;
tarr = -4:0.01:4;
ftarr = tpdf(tarr, nu);

alpha = 0.05;
tc = tinv(1 - alpha/2, nu);
tcr = round(tc,3);

% -------------------------------------------------------------------------
% Plot
figure
plot(tarr, ftarr, 'k', 'LineWidth', 3)
xlim([-3.5 3.5])
ylim([0 0.42])
xlabel('t')
ylabel('')
set(gca,'FontSize',12)
hold on

ylabel('Student-t(t; $\nu$ = 24)', ...
      'Interpreter','Latex','FontSize',16)

% Right tail
x1 = tc; 
x2 = max(tarr);
dx = (x2 - x1)/50;
xn = x1:dx:x2;
yn = tpdf(xn, nu);
fill([x2 x1 xn], [0 0 yn], 'r', 'EdgeColor','none')

% Left tail
x1 = min(tarr); 
x2 = -tc;
dx = (x2 - x1)/50;
xn = x1:dx:x2;
yn = tpdf(xn, nu);
fill([x2 x1 xn], [0 0 yn], 'r', 'EdgeColor','none')

xline(tc,'r--','LineWidth',1.5)
xline(-tc,'r--','LineWidth',1.5)

text(-2.7,0.1,'0.025','Color','r','FontSize',14)
text( 2.7,0.1,'0.025','Color','r','FontSize',14)

text(tc-0.4,0.35,'$t_c$','Interpreter','Latex','Color','r','FontSize',16)
text(-tc,0.35,'$-t_c$','Interpreter','Latex','Color','r','FontSize',16)

text(0,0.10,['$t_c$ = ',num2str(tcr)], ...
     'Interpreter','Latex','Color','r','FontSize',16)
text(0,0.05, ['$\alpha = $', num2str(alpha)], ...
     'Interpreter','latex','Color','r','FontSize',16, ...
     'HorizontalAlignment','center')
hold off
%  print('-dpng','EqualMeansRejectionRegion260130.png')
% print('-depsc','EqualMeansRejectionRegion260130.eps')
% ------------------------------------
% file: NHSTttestRejectionRegion.m
% 30-Jan-2026 14:51:22
% 0.73 sample mean (deg.C)
% 25 sample size n
% 1.34 s = sd(x) (deg.C)
% 1.8 s = var(x) (deg.C)^2
% 0.2684 standard error of the mean (deg.C)
% 2.71 t = (xmean-mu0)/SE
% 2.713 tvalue (pedestrian)
% 2.713 tvalue = tobs (t-test)