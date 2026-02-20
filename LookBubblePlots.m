disp('file: LookBubblePlots.m')

% Data source: Borcard et al. (2011)

x = [88,94,102,100,106,112,114,110,136,168,186,205,222,228,252,266,245,225,...
     206,189,187,192,192,179,145,91,65,49,27,8];

y = [7,14,18,28,39,51,61,76,100,112,130,145,167,182,190,209,203,200,...
     194,193,201,212,228,233,217,187,174,164,151,133];

NO3g = [0.20,0.20,0.22,0.21,0.52,0.15,0.15,0.41,0.82,0.75,1.60,0.50,0.52,1.23,...
        1.00,2.00,2.50,2.20,2.20,3.00,2.20,1.62,3.50,2.50,6.20,3.00,3.00,4.00,1.62,1.60];

% Convert from mg/L to µmol/L
% HNO3 molar mass = 63 g/mol
NO3 = NO3g * 1000 / 63;   % (µmol/L)

figure

%% --- Bubble size proportional to radius (like R version) ---
subplot(1,2,1)

% In MATLAB, scatter size is proportional to AREA, so we square to mimic
% R's cex scaling (which scales radius)
radiusScale = 5 * NO3 / max(NO3);
areaScale = (radiusScale).^2 * 20;   % 20 is a visual tuning factor

scatter(x, y, areaScale, 'MarkerFaceColor',[0.6 0.3 0], ...
        'MarkerEdgeColor','w')
hold on
plot(x, y, 'b-', 'LineWidth',1)

xlim([0 300])
ylim([0 300])
xlabel('x (km)', 'FontSize',14)
ylabel('y (km)', 'FontSize',14)
set(gca,'FontSize',12)

text(0,280,'$r = NO_3\ (\mu mol/L)$', ...
     'Interpreter','latex','Color',[0.6 0.3 0],'FontSize',13)

hold off

%% --- Bubble size proportional to sqrt(NO3) ---
subplot(1,2,2)

radiusScale2 = 5 * sqrt(NO3 / max(NO3));
areaScale2 = (radiusScale2).^2 * 20;

scatter(x, y, areaScale2, 'MarkerFaceColor',[0.6 0.3 0], ...
        'MarkerEdgeColor','w')
hold on
plot(x, y, 'b-', 'LineWidth',1)

xlim([0 300])
ylim([0 300])
xlabel('x (km)', 'FontSize',14)
ylabel('y (km)', 'FontSize',14)
set(gca,'FontSize',12)

text(0,280,'$r = \sqrt{NO_3\ (\mu mol/L)}$', ...
     'Interpreter','latex','Color',[0.6 0.3 0],'FontSize',13)

hold off
%  print('-dpng','BubblePlotRadiusAndArea260218ML.png')
% print('-depsc','BubblePlotRadiusAndArea260218ML.eps')
% ----------------------------------------------------------------
% Remarks:
% MATLAB's scatter uses marker AREA (not radius) for scaling.
% Therefore, to mimic R's cex (radius scaling), we square the radius factor.
% First subplot: radius proportional to NO3.
% Second subplot: radius proportional to sqrt(NO3).
% ----------------------------------------------------------------
% Remarks:
% Several panels in a single plot: setting the parameter mfrow to c(nr,nc) as, 
%   for example, by the command par(mfrow=c(1,2)) -> 1 row with two panels
%   (two columns) 
%   par(mfrow=c(2,1)) would produce two panels ontop of each other
%   par(mfrow=c(2,2)) would produce two times two panels
% In the left panel (1. plot) the symbol radius varies linearly with the 
%   nitrate concentration: cex=5*NO3/max(NO3).
% In the right panel (2. plot) the symbol area varies linearly with the 
%   nitrate concentration: cex=5*sqrt(NO3/max(NO3)).
% -----------------------------------------------------------------------------