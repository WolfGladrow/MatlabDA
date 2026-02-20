disp('file: MVCCcorSpearmanPearson.m')
% correlation coefficients: Spearman (monotonic) versus Pearson (linear)

rng(1953);                     % set seed (equivalent to set.seed)
Vmax = 5;
K = 0.04;

x = 0:0.01:30;
L = length(x);

y = Vmax .* x ./ (x + K) + 0.01 .* randn(1, L);

% Correlations
cp = corr(x', y', 'Type', 'Pearson');
fprintf('%.2f Pearson correlation\n', cp);

cs = corr(x', y', 'Type', 'Spearman');
fprintf('%.2f Spearman correlation\n', cs);

ck = corr(x', y', 'Type', 'Kendall');
fprintf('%.2f Kendall correlation\n', ck);

% Plot
figure;
plot(x, y, '.', 'Color', 'b', 'MarkerSize', 6);
xlabel('x');
ylabel('y');
set(gca, 'LineWidth', 1);
box on;

% Annotations (LaTeX formatting)
text(10, 2, '$r_{Pearson} = 0.29$', ...
    'Interpreter', 'latex', 'Color', 'b');

text(10, 3, '$\tau_{Kendall} = 0.55$', ...
    'Interpreter', 'latex', 'Color', 'b');

text(10, 4, '$\rho_{Spearman} = 0.72$', ...
    'Interpreter', 'latex', 'Color', 'b');
%  print('-dpng','SpearmanCorrelation260219ML.png')
% print('-depsc','SpearmanCorrelation260219ML.eps')
% -------------------------------------------------
% Notes on Differences from R
% rng(1953) replaces set.seed(1953)
% randn replaces rnorm
% corr(...,'Type',...) replaces cor(..., method=...)
% MATLAB requires column vectors for corr, hence x' and y'
% LaTeX formatting uses 'Interpreter','latex'
% MATLAB does not need an external package like latex2exp