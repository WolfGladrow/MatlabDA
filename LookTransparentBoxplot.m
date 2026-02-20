disp('file: LookTransparentBoxplot.m')

% data:
x1 = [-0.68644, -0.82379, -0.98416, -2.02230, -0.43507, -0.76655, ...
       1.22178, 0.09767, -0.93391, -1.23458, 0.09188, 0.56736, ...
      -0.55276, -0.07969, 0.11767, 2.07541, 1.76443, 0.60249, ...
      -1.29916, -0.30322, -0.77935, -0.97190, 0.84580, 0.28698, ...
       1.15160, 0.35533, 0.32936, 1.68584, 0.18260, 1.93600];

n = length(x1);
x1(n+1) = 5;   % add an 'outlier'

figure
boxplot(x1, 'Colors', 'k', 'Symbol', 'o')  % basic boxplot
h = findobj(gca,'Tag','Box');
patch(get(h,'XData'), get(h,'YData'), 'yellow', ...
      'FaceAlpha', 0.3);   % light/transparent box

xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14)
set(gca,'FontSize',12)

L = length(x1);

rng(1953);  % set seed for reproducibility
jitter = 1 - 0.05 + (2*0.05).*rand(L,1);   % uniform in [0.95, 1.05]

hold on
scatter(jitter, x1, 15, 'blue', 'filled')  % jittered data points
hold off
%  print('-dpng','TransparentBoxplot260218ML.png')
% print('-depsc','TransparentBoxplot260218ML.eps')
% ----------------------------------------------------------------
% Remarks:
% Use a light color and FaceAlpha to make the box transparent.
% Add small horizontal noise ("jitter") to avoid overlap of similar points.
% rng(1953) sets the random seed for reproducible results.
% rand(L,1) generates L uniform random numbers in (0,1).
% ----------------------------------------------------------------