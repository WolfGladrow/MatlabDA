disp('file: MVCCexampleCovariance.m');
disp(datetime('now'));

x = [5.1, 4.8, 1.8, 4.5, 6.6, 2.2, 5.7, 5.7, 5.9, 9.7];
y = [7.8, 8.2, 3.5, 6.7, 8.9, 3.2, 8.7, 8.5, 7.2, 14.2];

xmean = mean(x);
fprintf('%.2f xmean\n', round(xmean,2));

ymean = mean(y);
fprintf('%.2f ymean\n', round(ymean,2));

c = cov(x,y);         % covariance matrix
cov_xy = c(1,2);      % extract covariance value
fprintf('%.2f covariance\n', round(cov_xy,2));

r = corr(x',y');      % correlation (column vectors required)
fprintf('%.4f correlation\n', round(r,4));

% Plot
figure;
plot(x,y,'b.','MarkerSize',15);
hold on;
xlim([0 10]);
ylim([0 15]);
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
set(gca,'LineWidth',1);

% Mean lines
xp1 = [xmean xmean]; 
yp1 = [-10 20];
xp2 = [-1 12]; 
yp2 = [ymean ymean];

plot(xp1, yp1, 'r');
plot(xp2, yp2, 'r');

% Text labels
text(6,12,'+','Color','red','FontSize',16);
text(4.4,12,'-','Color','red','FontSize',16);
text(6,3,'-','Color','red','FontSize',16);
text(4.4,3,'+','Color','red','FontSize',16);

hold off;
%  print('-dpng','CovExample260219ML.png')
% print('-depsc','CovExample260219ML.eps')
% Notes (from ChatGPT):
% cov(x,y) in MATLAB returns a 2×2 covariance matrix, so we extract the off-diagonal element.
% corr() requires column vectors (x', y').
% MATLAB uses fprintf instead of print.
% datetime('now') replaces date() from R.
% The plotting parameters are adapted to MATLAB syntax
% -----------------------------------------------------------------------------
% Results:
% "file: MVCCexampleCovariance.R"
% "Sun Dec 18 07:33:32 2022"
% "5.2"     "xmean"
% "7.69"    "ymean"
% "6.64"    "covariance"
% "0.9739"  "correlation"
% -----------------------------------------------------------------------------