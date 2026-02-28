% file: ProbBernoulliDie600nDnormal.m

disp('file: ProbBernoulliDie600nDnormal.m')
disp(datetime('now'))

p = 1/6;
n = 600;

karr = 0:n;
parr = binopdf(karr, n, p);   % Binomial probabilities

% Normal/Gaussian envelope
muB  = n * p;
sdB  = sqrt(n * p * (1 - p));
fprintf('sdB = %.2f\n', round(sdB,2))

varB = n * p * (1 - p);
fprintf('varB = %.2f\n', round(varB,2))

k1 = 81;
k2 = 121;

x = k1:0.1:k2;
y = normpdf(x, muB, sdB);

% To save as PNG (uncomment if needed)
% print('BernoulliDie600nDnormal260228.png','-dpng','-r300')

figure
plot(karr(k1:k2), parr(k1:k2), 'b.', 'LineWidth', 1.5)
hold on
plot(x, y, 'k--', 'LineWidth', 1.2)
hold off

xlabel('k', 'FontSize', 14)
ylabel('B(k; n=600, p=1/6)', 'FontSize', 14)
set(gca, 'YLim', [0 max(parr)])
set(gca, 'FontSize', 12)
box on