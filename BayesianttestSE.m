disp('file: BayesianttestSE.m')

% plot data & mu0, SE, 1-sample-t-test 
x = [1.5, 0.3, 1.8, -1.4, 0.8, 3.0, -0.3, 0.2, -0.4, 1.9, 0.0, 0.3, -1.0, ...
     1.2, 3.8, 0.5, -0.8, 2.0, 1.1, 1.2, -0.4, 2.7, 0.5, -1.4, 1.1];

T0 = 0;   % hypothesized temperature of null hypothesis H0

xmean = mean(x);
disp([num2str(round(xmean,2)) ' sample mean (deg.C)'])

n = length(x);
disp([num2str(n) ' sample size n'])

sx = std(x, 1);            % population SD (use std(x,0) for sample SD)
s_sample = std(x, 0);      % sample SD (matches R sd(x))
SE = s_sample / sqrt(n);

disp([num2str(round(s_sample,2)) ' sd(x) (deg.C)'])
disp([num2str(round(var(x,0),2)) ' var(x) (deg.C)^2'])
disp([num2str(round(SE,4)) ' standard error of the mean (deg.C)'])

dis = (xmean - T0) / SE;
disp([num2str(round(dis,2)) ' t = (xmean-mu0)/SE'])

tvalue = (xmean - T0) / SE;
disp([num2str(round(tvalue,3)) ' tvalue (pedestrian)'])

% one-sample t-test
[~,~,~,stats] = ttest(x, T0);
tobs = stats.tstat;
disp([num2str(round(tobs,3)) ' tvalue = tobs (t-test)'])

% Plot
figure
plot(x,'o','LineWidth',1.5,'Color','b')
xlabel('Data #')
ylabel('Temperature (°C)')
set(gca,'FontSize',12)
hold on

yline(xmean,'b-','LineWidth',1.5)
yline(xmean + SE,'r--','LineWidth',1.5)
yline(xmean - SE,'r--','LineWidth',1.5)
yline(T0,'k:','LineWidth',1.5)

hold off
%  print('-dpng','EqualMeansDataSE260130.png')
% print('-depsc','EqualMeansDataSE260130.eps')
% --------------------------------------
% file: BayesianttestSE.m
% 0.73 sample mean (deg.C)
% 25 sample size n
% 1.34 sd(x) (deg.C)
% 1.8 var(x) (deg.C)^2
% 0.2684 standard error of the mean (deg.C)
% 2.71 t = (xmean-mu0)/SE
% 2.713 tvalue (pedestrian)
% 2.713 tvalue = tobs (t-test)
