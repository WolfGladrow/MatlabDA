disp('file: PDsPDFsStudenttNormal.m')
% t distributions & standard normal PDF

% t range
t = -3:0.01:3;

% PDFs
N   = normpdf(t, 0, 1);   % standard normal
t3  = tpdf(t, 3);
t5  = tpdf(t, 5);
t10 = tpdf(t, 10);

% Create figure
figure;
plot(t, t3, 'b-.', 'LineWidth', 3); 
hold on;
plot(t, t5, 'r--', 'LineWidth', 2);
plot(t, t10, 'k:', 'LineWidth', 2);
plot(t, N, 'm-', 'LineWidth', 3);

% Axes formatting
xlim([-3 3]);
ylim([0 0.45]);
xlabel('t', 'FontSize', 14);
ylabel('Density', 'FontSize', 14);
set(gca, 'FontSize', 12);

% Text annotations (LaTeX formatting)
xt = 0;
text(xt, 0.2,  '$\nu = 10$', 'Color', 'k', 'FontSize', 14, 'Interpreter', 'latex');
text(xt, 0.15, '$\nu = 5$',  'Color', 'r', 'FontSize', 14, 'Interpreter', 'latex');
text(xt, 0.1,  '$\nu = 3$',  'Color', 'b', 'FontSize', 14, 'Interpreter', 'latex');
text(0, 0.425, 'standard normal distribution', ...
     'Color', 'm', 'FontSize', 14);

hold off;
%  print('-dpng','tDistNormalBook260219ML.png')
% print('-depsc','tDistNormalBook260219ML.eps')
% ------------------------------------------------------------------------