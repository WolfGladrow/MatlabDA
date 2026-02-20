disp('file: MVCCexampleCovSanudo.m');
disp(datetime('now'));
% Sanudo-Wilhelmy et al. (2006)

x = [0.28,0.37,0.45,0.84,0.76,0.46,0.58,1,0.66,1.08,0.95];   % [PO4] (µmol/L)
y = [66.8,75.3,70.6,15.2,27.6,27.3,37,45.1,32.2,57.8,24.5]; % B12 (pmol/L)

% Covariance
C = cov(x,y);              % 2x2 covariance matrix
cov_xy = C(1,2);
fprintf('%.2f covariance(x,y)\n', round(cov_xy,2));

% Correlation
R = corrcoef(x,y);         % correlation matrix
r = R(1,2);
fprintf('%.2f correlation(x,y)\n', round(r,2));
fprintf('%.4f r Pearson correlation coefficient\n', round(r,4));

% Plot
figure;
plot(x,y,'b.','MarkerSize',15);
ylim([0 80]);
set(gca,'LineWidth',1);

% Axis labels with LaTeX formatting
xlabel('$[ PO_4 ]\, (\mu mol\, L^{-1})$', ...
       'Interpreter','latex','FontSize',14);

ylabel('$Vitamin\, B_{12}\, (pmol\, L^{-1})$', ...
       'Interpreter','latex','FontSize',14);

% Display correlation value on plot
text(1,70,['r = ' num2str(round(r,2))], ...
     'FontSize',14,'Color','black');
%  print('-dpng','Sanudo06a260219ML.png')
% print('-depsc','Sanudo06a260219ML.eps')