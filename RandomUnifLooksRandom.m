disp('file: RandomUnifLooksRandom.m')
rng(1953);  % set seed for reproducibility

Nsim = 1e4;       % number of random numbers
x = rand(1, Nsim);  % uniform random numbers in [0,1]

% Adjacent pairs (like x1=x[-Nsim], x2=x[-1] in R)
x1 = x(1:end-1);  % all except last
x2 = x(2:end);    % all except first

% Plot setup: 1x3 subplot
figure;

% 1) Histogram
subplot(1,3,1);
histogram(x, 'FaceColor', 'b');
xlabel('Value');
ylabel('Frequency');
title('Histogram of x');

% 2) Scatterplot of adjacent pairs
subplot(1,3,2);
plot(x1, x2, '.', 'Color', 'b');
xlabel('x_1');
ylabel('x_2');
title('Adjacent pairs scatterplot');

% 3) Autocorrelation
% autocorr requires Econometrics Toolbox.
% subplot(1,3,3);
% autocorr(x, 'NumLags', 50);  % similar to R acf
% title('Autocorrelation of x');

% ------------------------
% Example explanation with small sample
Nsim_small = 6;
xs = rand(1, Nsim_small);
x1s = xs(1:end-1);  % all except last
x2s = xs(2:end);    % all except first

disp('xs = '); disp(xs)
disp('x1s = '); disp(x1s)
disp('x2s = '); disp(x2s)
%  print('-dpng','runif260219ML.png')
% print('-depsc','runif260219ML.eps')
% -------------------------------------------------