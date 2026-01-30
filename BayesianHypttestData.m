disp('file: BayesianHypttestData.m')
% Converted from R using ChatGPT as follows:
% 1. Login to ChatGPT
% 2. Prompt ChatGPT to 
% " translate to MATLAB code XXX " with 
%    XXX the R code lines
% plot data & mean for Bayesian-t-test and t-test
x = [1.5, 0.3, 1.8, -1.4, 0.8, 3.0, -0.3, 0.2, -0.4, 1.9, 0.0, 0.3, -1.0, ...
     1.2, 3.8, 0.5, -0.8, 2.0, 1.1, 1.2, -0.4, 2.7, 0.5, -1.4, 1.1];

Thyp = 0;  % hypothesized temperature of null hypothesis H0

figure;
plot(x, 'o', ...
     'LineWidth', 4, ...
     'Color', 'blue', ...
     'MarkerSize', 6);
xlabel('Data #', 'FontSize', 15);
ylabel('Temperature (°C)', 'FontSize', 15);
set(gca, 'FontSize', 12);

hold on;
yline(Thyp, '--k', 'LineWidth', 1);  % horizontal reference line
hold off;
%  print('-dpng','EqualMeansData260129.png')
% print('-depsc','EqualMeansData260129.eps')