disp('file: MonteCarlottestnu24d.m')
% Monte Carlo simulation: Student-t(t; nu=24); density estimation
n     = 25;        % sample size
nu    = n - 1;     % degrees of freedom
mu    = 0;         % true mean
sigma = 1.5;       % true standard deviation
rng(1953);         % seed for random number generator
M     = 1e5;       % number of Monte Carlo runs
sflag = 2;
tvalue = zeros(M,1);
for j = 1:M
    r   = mu + sigma .* randn(n,1);   % normal random sample
    rm  = mean(r);                    % sample mean
    rsd = std(r,0);                   % sample SD (matches R sd)
    tvalue(j) = (rm - mu) / (rsd / sqrt(n));
end
% -------------------------------------------------------------------------
% Density estimate
if sflag == 2
    % Kernel density estimate (MATLAB equivalent of density())
    [f, xi] = ksdensity(tvalue); %,'Support', [-4 4]);
    % 'Support', [-4 4] causes error message, and actually, is
    % not necessary 
    figure
    plot(xi, f, 'k', 'LineWidth', 4)
    hold on

    % Theoretical Student-t density
    xp = -4:0.01:4;
    yp = tpdf(xp, nu);
    plot(xp, yp, 'm--', 'LineWidth', 2)

    xlabel('x')
    ylabel('Density')
    set(gca,'FontSize',12)
    xlim([-4 4])

    text(-2.5, 0.35, ['$\nu = ' num2str(nu) '$'], ...
         'Interpreter','latex','FontSize',16)

    legend({'Monte Carlo','Student-t'}, ...
           'Location','south', ...
           'FontSize',14)

    hold off
end
%  print('-dpng','MonteCarlo-t-density260129.png')
% print('-depsc','MonteCarlo-t-density260129.eps')