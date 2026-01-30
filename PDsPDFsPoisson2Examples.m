fprintf('file: PDsPDFsPoisson2Examples.m');
fprintf('converted from PDsPDFsPoisson2Examples.R\n');
fprintf('using https://www.codeconvert.ai/r-to-matlab-converter')
lambda1 = 0.55;
lambda2 = 3.72;
k = 0:10;

p1 = poisspdf(k, lambda1);
p2 = poisspdf(k, lambda2);

figure;
hold on;
plot(k, p1, 'ko', 'LineWidth', 4, 'MarkerSize', 6);
plot(k, p2, 'm^', 'LineWidth', 4, 'MarkerSize', 6);

xlabel('k', 'FontSize', 15);
ylabel('Poisson probability distributions', 'FontSize', 15);
set(gca, 'YDir', 'normal', 'FontSize', 12);

text(3, 0.5, sprintf('\\lambda_1 = %.2f', lambda1), 'Color', 'k', 'FontSize', 15, 'HorizontalAlignment', 'left');
text(3, 0.4, sprintf('\\lambda_2 = %.2f', lambda2), 'Color', 'm', 'FontSize', 15, 'HorizontalAlignment', 'left');

hold off;