disp('file: ProbLagrangeMultipliersLoadedDie.m')
disp(datetime('now'))

% Lagrange multipliers for loaded die: z-equation
mu = 3.8;

myFct1 = @(z) (1 - z.^7)./(1 - z) - 1 ...
    - z./mu .* (1 - 7*z.^6 + 6*z.^7) ./ (1 - z).^2;

zlower = 1.05;
zupper = 1.15;

za = zlower:0.001:zupper;

% Root finding (equivalent to uniroot)
zopt = fzero(myFct1, [zlower zupper]);

L2 = log(zopt);
L1 = 1 + log(mu/zopt * (1 - zopt)^2 / (1 - 7*zopt^6 + 6*zopt^7));

ja = 1:6;

pj  = exp(-1 + L1 + L2*ja);
pj0 = ones(1,6)/6;

% Test constraints
C1 = sum(pj);        % normalization
C2 = sum(ja .* pj);  % mean

sflag = 2;

if sflag == 1
    figure;
    plot(za, myFct1(za), 'b', 'LineWidth', 4);
    hold on;
    yline(0, 'g');
    xlabel('z');
    ylabel('f(z)');
    box on;
    hold off;
    %  print('-dpng','LoadedDieZeq260219ML.png')
    % print('-depsc','LoadedDieZeq260219ML.eps')
end

xp = [1 6];
yp = [pj(1) pj(6)];

if sflag == 2
    figure;
    plot(ja, pj0, '^k', 'LineWidth', 2, 'MarkerSize', 8);
    hold on;
    plot(xp, yp, 'g', 'LineWidth', 2);
    plot(ja, pj, 'ob', 'LineWidth', 2, 'MarkerSize', 6);
    ylim([0 0.25]);
    xlabel('j');
    ylabel('p_j');
    box on;
    hold off;
    %  print('-dpng','LoadedDiePj260219ML.png')
    % print('-depsc','LoadedDiePj260219ML.eps')
end

disp(' ---------------------------------------------------')
disp('Results:')

fprintf('z       =  %.4f\n', zopt);
fprintf('Lambda1 =  %.4f\n', L1);
fprintf('Lambda2 =  %.4f\n', L2);

fprintf('pj      =  ');
fprintf('%.4f  ', pj);
fprintf('\n');

fprintf('normalization = %.4f\n', C1);
fprintf('mean          = %.4f\n', C2);

% -------------------------------------------------
% "file: ProbLagrangeMultipliersLoadedDie.R"
% "Sun Dec 18 14:23:46 2022"
% " ---------------------------------------------------"
% "Results: "
% "z       =  " "1.1091"     
% "Lambda1 = " "-1.1697"   
% "Lambda2 =  " "0.1035"     
% "pj  = " "0.1267"   "0.1405"  "0.1558"  "0.1728"   "0.1917"  "0.2126"     
% "normalization       = " "1"                     
% "mean                = " "3.8"                   
% ----------------------------------------------------------------
% Remarks:
% myfct1 = function(z) {...}   create your own function; curly brackets not required when
%                                 only one term
% seq(x1,x2,dx)   generate a sequence of numbers from x1 to x2 with equidistant spacing dx
% uniroot(f,lower,upper)   searches the interval from lower to upper for a root (i.e., zero) 
%    of the function f
% uniroot(f,lower,upper)$root extracts only the variable 'root' from output of 
%    uniroot()
% ----------------------------------------------------------------