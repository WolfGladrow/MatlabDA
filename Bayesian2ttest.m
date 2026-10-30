% ---------------------------------------------------------------
fprintf('file: ttest2Baysian.m\n');
fprintf('purpose = Bayesian 2-sample t-test (10/2026)\n');
fprintf('optional: compare with Null Hypothesis Significance Test (NHST)\n');
fprintf('Bayesian t test based on Rouder et al. (2009)\n');
fprintf('updates:\n');
fprintf('30.10. 2026 Dieter.Wolf-Gladrow@awi.de\n');
% --------------------------------------------------------------
clear;                         % Remove items from workspace, freeing up system memory
clc;                           % clear command window
version                        % MATLAB version
datetime('now')                % date
fprintf('---------------------------------------------------\n');
fprintf('Data (2 samples): \n');
fprintf('---------------------------------------------------\n');
% The data (random samples from normal distributions) have been
% generated in R. In order to obtain identical results in MATLAB
% these data are used.
qflag = 1; 
fprintf('qflag:'); disp(qflag);
if (qflag == 4) 
fprintf('Put (read in) your data here and set qflag to 4\n');
% n1=length(x1); n2=length(x2);
% fprintf('x1:\n'); disp(x1);
% fprintf('x2:\n'); disp(x2);
% deltaEstHedges = abs(mean(x1)-mean(x2))/ ...
%     sqrt(((n1-1)*var(x1)+(n2-1)*var(x2))/(n1+n2-2));
% fprintf('deltaEstHedges'); disp(round(deltaEstHedges,4));
end
if (qflag == 3) 
fprintf('For qflag == 3 data are random numbers from\n');
fprintf('two normal distributions with (mu1=0,sigma=1) \n');
fprintf('and (mu2=1.25,sigma2=1), respectively. \n');
    mu1 = 0; sigma1 = 1;         % true mean & standard deviation
    mu2 = 1.25; sigma2 = sigma1; % true mean & standard deviation
    x1 = [0.0219,-0.9043,0.4132,0.1866,0.2308, ...
        0.2357,1.4837,1.0995,-0.0047,-1.4212];   
    x2 = [1.1174,1.4148,1.1745,-1.0807,0.7268, ...
        -0.2678,2.0418,1.8202,3.7550];
    n1=length(x1); n2=length(x2);
    fprintf('x1:\n'); disp(x1);
    fprintf('x2:\n'); disp(x2);
    delta = abs(mu1-mu2)/max(sigma1,sigma2);
    deltaEstHedges = abs(mean(x1)-mean(x2))/ ...
        sqrt(((n1-1)*var(x1)+(n2-1)*var(x2))/(n1+n2-2));
    fprintf('effect size'); disp(round(delta,4));
    fprintf('deltaEstHedges'); disp(round(deltaEstHedges,4));
end
if (qflag == 2) 
fprintf('For qflag == 2 data are random numbers from\n');
fprintf('two normal distributions with (mu1=0,sigma=1) \n');
fprintf('and (mu2=1.5,sigma=2), respectively. \n');
mu1 = 0; sigma1 = 1;        % true mean & standard deviation
mu2 = 1.5; sigma2 = sigma1; % true mean & standard deviation
x1 = [0.26,0.2016,0.4736,0.4941,-0.3688, ...
      0.2365,0.6201,0.2098,-1.4904,-1.6032];   
x2 = [2.1542,1.3909,0.8515,2.2964,1.8177, ...
      1.7305,-0.0229,1.3014,-0.567];
n1=length(x1); n2=length(x2);
fprintf('x1:\n'); disp(x1);
fprintf('x2:\n'); disp(x2);
delta = abs(mu1-mu2)/max(sigma1,sigma2);
deltaEstHedges = abs(mean(x1)-mean(x2))/ ...
sqrt(((n1-1)*var(x1)+(n2-1)*var(x2))/(n1+n2-2));
fprintf('effect size'); disp(round(delta,4));
fprintf('deltaEstHedges'); disp(round(deltaEstHedges,4));
end
if (qflag == 1) 
fprintf('For qflag == 1 all data are random numbers from \n');
fprintf('the normal distribution with mu=0 and sigma = 1 \n');
mu1 = 0; sigma1 = 1;        % true mean & standard deviation
mu2 = mu1; sigma2 = sigma1; % true mean & standard deviation
x1 = [0.0219,-0.9043,0.4132,0.1866,0.2308, ...
    0.2357,1.4837,1.0995,-0.0047,-1.4212];
x2 = [-0.1326,0.1648,-0.0755,-2.3307,-0.5232, ...
    -1.5178,0.7918,0.5702,2.505];
fprintf('x1:\n'); disp(x1);
fprintf('x2:\n'); disp(x2);
n1=length(x1); n2=length(x2);
fprintf('x1:\n'); disp(x1);
fprintf('x2:\n'); disp(x2);
delta = abs(mu1-mu2)/max(sigma1,sigma2);
deltaEstHedges = abs(mean(x1)-mean(x2))/ ...
    sqrt(((n1-1)*var(x1)+(n2-1)*var(x2))/(n1+n2-2));
fprintf('effect size'); disp(round(delta,4));
fprintf('deltaEstHedges'); disp(round(deltaEstHedges,4));
end
% --------------------------------------------------------------------------------------------------
pflag = 1;
if (pflag == 1)
fprintf('---------------------------------------------------\n');
fprintf('For pflag == 1 perform the two NHST tests: 1. t-test, 2. Welch t-test:')
fprintf('Null hypothesis H0: mean population values are equal (mu1 = mu2)\n');
fprintf('---------------------------------------------------\n');
alpha = 0.05; % chosen level of significance
[h, p, ci, stats] = ttest2(x1, x2, 'Vartype', 'equal', 'Alpha', alpha);
fprintf('\nTwo-sample t-test results:\n');
fprintf('t-statistic = %.4f\n', stats.tstat);
fprintf('Degrees of freedom = %.4f\n', stats.df);
fprintf('p-value (observed level of significance) = %.6f\n', p);
fprintf('95%% confidence interval for mu1 - mu2:\n');
fprintf('[%.4f, %.4f]\n', ci(1), ci(2));
if p < alpha
    fprintf('%.4f: H0: mu1=mu2 rejected\n', p);
else
    fprintf('%.4f: H0: mu1=mu2 not rejected\n', round(p, 4));
end
fprintf('---------------------------------------------------\n');
fprintf('Welch t-test:')
[h, p, ci, stats] = ttest2(x1, x2, 'Vartype', 'unequal', 'Alpha', alpha);
fprintf('\nTwo-sample Welch t-test results:\n');
fprintf('t-statistic = %.4f\n', stats.tstat);
fprintf('Degrees of freedom = %.4f\n', stats.df);
fprintf('p-value (observed level of significance) = %.6f\n', p);
fprintf('95%% confidence interval for mu1 - mu2:\n');
fprintf('[%.4f, %.4f]\n', ci(1), ci(2));
if p < alpha
    fprintf('%.4f: H0: mu1=mu2 rejected\n', p);
else
    fprintf('%.4f: H0: mu1=mu2 not rejected\n', round(p, 4));
end
fprintf('---------------------------------------------------\n');
end
% ----------------------------------------------------------------------------------------------------------------
fprintf('---------------------------------------------------\n');
fprintf('---------------------------------------------------\n');
fprintf('---------------------------------------------------\n');
fprintf('Bayesian t-test:\n');
fprintf('Null hypothesis H0: mean values are equal (mu1 = mu2)\n');
fprintf('Alternative hypothesis H1: mean values are different (unequal)\n');
% fprintf('\n');
% fprintf('---------------------------------------------------\n');
fprintf('Bayesian t-test:\n');
fprintf('Null hypothesis H0: mean values are equal (mu1 = mu2)\n');
fprintf('Alternative hypothesis H1: mean values are different\n');
% Calculate the Bayes factor BF10 = evidence for H1 relative to H0.
rscale = 1;
BF10 = jzsBayesFactor(x1,x2,rscale);
fprintf('Bayes factor BF10 = %.6f\n', BF10);
fprintf('Bayes factor BF01 = %.6f\n', 1 / BF10);
if BF10 > 10
    fprintf(['Strong evidence against H0 / ', ...
        'strong evidence for H1\n']);
elseif BF10 >= 3.16
    fprintf(['Substantial evidence against H0 / ', ...
        'substantial evidence for H1\n']);
elseif BF10 > 1
    fprintf(['Slight evidence against H0 / ', ...
        'slight evidence for H1\n']);
elseif BF10 >= 0.316
    fprintf(['Slight evidence against H1 / ', ...
        'slight evidence for H0\n']);
elseif BF10 > 0.1
    fprintf(['Substantial evidence against H1 / ', ...
        'substantial evidence for H0\n']);
else
    fprintf(['Strong evidence against H1 / ', ...
        'strong evidence for H0\n']);
end
%% Local function: Bayes factor for two independent samples
function BF10 = jzsBayesFactor(x,y,rscale)
x = x(:); y = y(:);
n1 = numel(x); n2 = numel(y); % Number of array elements
% Pooled within-group standard deviation
s1 = var(x, 0); s2 = var(y, 0);
sp = sqrt(((n1-1)*s1+(n2-1)*s2)/(n1 + n2 - 2));
% Observed pooled-variance t-statistic
t = (mean(x)-mean(y))/(sp*sqrt(1/n1 + 1/n2)); % test statistics t (same as for NHST t-test!)
df = n1 + n2 - 2; % degrees of freedom 
% Effective sample size for the standardized mean difference
nEff = 1 / (1/n1 + 1/n2);
fprintf('nEff %.6f\n', nEff);
fprintf('df %.6f\n', df);
fprintf('t %.6f\n', t);
logIntegrand = @(g) ...
         -0.5 .*log(1 + nEff .*g) - ((df + 1)/2) .*log(1 + t.^2./(df.*(1+nEff.*g))) ...
    - (1/2)*log(2*pi.*rscale)- (3/2).*log(g) - 1./ (2*g);
integrand = @(g) exp(logIntegrand(g));
q = integral(integrand, 0, Inf,'RelTol', 1e-8, 'AbsTol', 1e-12);
% fprintf('q = %.6f\n', q);
BF10 = q/(1+t^2/df)^(-(df+1)/2);
% fprintf('Bayes factor BF10 = %.6f\n', BF10);
end