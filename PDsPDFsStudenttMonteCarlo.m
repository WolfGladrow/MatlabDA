disp('file: PDsPDFsStudenttMonteCarlo.m')
% Estimation of t distribution using Monte Carlo simulation

M = 1e5;                 % number of Monte Carlo runs
tvals = zeros(M,1);      % preallocate

n1 = 3; 
n2 = 2;                  % sample lengths
nu = n1 + n2 - 2;        % degrees of freedom

rng(1953);               % set seed for random number generator

for k = 1:M
    x1 = randn(n1,1);    % sample from standard normal
    x2 = randn(n2,1);
    
    x1mean = mean(x1);
    x2mean = mean(x2);
    
    SS1 = sum((x1 - x1mean).^2);   % sum of squares
    SS2 = sum((x2 - x2mean).^2);
    
    spsq = (SS1 + SS2) / nu;       % pooled variance
    ssqx1x2 = spsq/n1 + spsq/n2;
    
    tvals(k) = (x1mean - x2mean) / sqrt(ssqx1x2);
end

% Kernel density estimate (similar to R's density())
% ---------------- converted code modified by DWG (begin):
% restrict data to [-3.5 3.5]:
q = find(abs(tvals) <= 3.5);
tvalsr = tvals(q);
[f,xi] = ksdensity(tvalsr);
% ---------------- converted code modified by DWG (end)
% [f, xi] = ksdensity(tvals, 'Support', [-3.5 3.5]);
% [xi, f] = ksdensity(tvals, 'Support', [-3.5 3.5]);
% Error using matlab.internal.math.validateKDESupport (line 42)
% Data values must be between lower and upper 'Support' values.

% Plot Monte Carlo estimate
figure;
plot(xi, f, 'b', 'LineWidth', 2);
hold on;

% True t distribution and standard normal
xp = -4:0.01:4;
plot(xp, tpdf(xp, nu), 'k--', 'LineWidth', 3);
plot(xp, normpdf(xp,0,1), 'm-', 'LineWidth', 1);

% Formatting
xlim([-3 3]);
ylim([0 0.4]);
xlabel('t', 'FontSize', 14);
ylabel('Standard normal & t distribution', 'FontSize', 14);
set(gca, 'FontSize', 12);

legend({'MC estimate','t','normal'}, ...
       'Location','southoutside', ...
       'FontSize',12);

hold off;
%  print('-dpng','MonteCarloStudentDist260219ML.png')
% print('-depsc','MonteCarloStudentDist260219ML.eps')
% ------------------------------------------------------------------------