disp('file: MonteCarlottestnu24.m')
% Monte Carlo simulation: Student-t(t; nu = 24)

n = 25;                 % sample size
nu = n - 1;             % degrees of freedom
mu = 0;                 % true mean
sigma = 1.5;            % true standard deviation (> 0)

rng(1953);               % seed for random number generators

M = 1e3;                 % number of Monte Carlo runs
sflag = 1;               % flag for histogram

tvalue = zeros(M,1);     % preallocate

for j = 1:M
    r = mu + sigma*randn(n,1);   % n random values from normal distribution
    rm = mean(r);                % sample mean
    rsd = std(r);                % sample standard deviation (default: N-1)
    tvalue(j) = (rm - mu) / (rsd / sqrt(n));
end

if sflag == 1
    mybreaks = round(sqrt(M));
    histogram(tvalue, mybreaks, 'FaceColor', 'blue');
    xlabel('t', 'FontSize', 14);
    ylabel('Frequency');
    set(gca, 'FontSize', 12);
    hold on
    xline(mu, 'k--', 'LineWidth', 1);   % vertical line at mu
    hold off
end
%  print('-dpng','MonteCarlo-t-hist260129.png')
% print('-depsc','MonteCarlo-t-hist260129.eps')