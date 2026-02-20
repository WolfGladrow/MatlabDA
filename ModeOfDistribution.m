disp('file: ModeOfDistribution.m')
disp(datetime('now'))

%% 1 = Distributions: uni- and bi-modal
disp('1 = distributions: uni-, bi-modal (2024)')
disp(' ---------------------------------------------------')
disp('Discrete, unimodal:')
disp(' ---------------------------------------------------')

% Parameters
n = 11; p1 = 0.2; p2 = 0.7;
k = 0:n;

% Discrete, unimodal: binomial
ybinom = binopdf(k, n, p1);

% Print separator
disp(' ---------------------------------------------------')
disp('Discrete, bimodal:')
disp(' ---------------------------------------------------')

% Another binomial
ybinomB = binopdf(k, n, p2);

% Mixture (bimodal)
ybinomC = ybinom*2/3 + ybinomB/3;

% Statistics for unimodal
meanB = n*p1;
medianB = binoinv(0.5,n,p1);        % median
medianB1 = floor(n*p1);
medianB2 = ceil(n*p1);
[~, idx] = max(ybinom);
modeB = k(idx);                      % mode
modeB1 = floor((n+1)*p1);
modeB2 = ceil((n+1)*p1)-1;

%% Continuous, unimodal: F-distribution F(x,15,3)
disp(' ---------------------------------------------------')
disp('Continuous, unimodal: F(x,15,3)')
disp(' ---------------------------------------------------')

x = 0.01:0.01:6;
nu1 = 15; nu2 = 3;

y = fpdf(x, nu1, nu2);

modeF   = ((nu1-2)/nu1)*(nu2/(nu2+2));
meanF   = nu2/(nu2-2);
medianF = finv(0.5, nu1, nu2);

disp([round(modeF,4), nan, nan, nan, ' modeF'])
disp([round(meanF,4), nan, nan, nan, ' meanF'])
disp([round(medianF,4), nan, nan, nan, ' medianF'])

%% Continuous, bimodal: mixture with normal
yB = normpdf(x,3,0.7);
yC = y*2/3 + yB/3;

%% Plotting: 2x2 panels
figure;

% 1) Discrete unimodal
subplot(2,2,1);
plot(k, ybinom, 'ob', 'LineWidth', 2, 'MarkerSize',6);
hold on;
xline(modeB,'m--','LineWidth',2);
xline(meanB,'k:','LineWidth',2);
xlabel('k'); ylabel('Probability');
title('Discrete Unimodal');
box on; hold off;

% 2) Discrete bimodal
subplot(2,2,2);
plot(k, ybinomC, 'ob', 'LineWidth', 2, 'MarkerSize',6);
xlabel('k'); ylabel('Probability');
title('Discrete Bimodal');
box on;

% 3) Continuous unimodal (F-distribution)
subplot(2,2,3);
plot(x, y, 'b', 'LineWidth', 2); hold on;
xline(modeF,'m--','LineWidth',2);
xline(meanF,'k:','LineWidth',2);
xline(medianF,'g-.','LineWidth',2);
xlabel('x'); ylabel('Density');
title('Continuous Unimodal (F)');
box on; hold off;

% 4) Continuous bimodal
subplot(2,2,4);
plot(x, yC, 'b', 'LineWidth', 2);
xlabel('x'); ylabel('Density');
title('Continuous Bimodal (Mixture)');
box on;
%  print('-dpng','ModeBimodal260219ML.png')
% print('-depsc','ModeBimodal260219ML.eps')
% -----------------------------------------------------------------------------