disp('file: NormalPDFprobabilities.m')

dx = 0.01;
x = -4:dx:4;

% Standard normal PDF
y = normpdf(x, 0, 1);

% ---- Area 1: from x1 to x2 ----
x1 = -4; x2 = 0;
xn1 = x1:dx:x2;
yn1 = normpdf(xn1, 0, 1);

% Polygon coordinates for shading
xf1 = [x2, x1, xn1];
yf1 = [0, 0, yn1];

% ---- Area 2: from x3 to x4 ----
x3 = 1; x4 = 2;
xn2 = x3:dx:x4;
yn2 = normpdf(xn2, 0, 1);

xf2 = [x4, x3, xn2];
yf2 = [0, 0, yn2];

% ---- Probability by integration ----
P2 = integral(@(t) normpdf(t,0,1), x3, x4);
P2r = round(P2,4);

% ---- Plot ----
figure;
plot(x, y, 'k', 'LineWidth', 2);  % PDF line
hold on;

% Shaded areas
fill(xf1, yf1, 'b');       % blue area P1
fill(xf2, yf2, 'm');       % magenta area P2

plot(x, y, 'k', 'LineWidth', 2);  % redraw PDF on top

xlim([-3 3]);
xlabel('x');
ylabel('Normal PDF');
box on;

% Text annotations
text(-3, 0.25, 'P_1 = 1/2', 'Color', 'b', 'FontSize', 14);
text(1.2, 0.25, ['P_2 = ', num2str(P2r)], 'Color', 'm', 'FontSize', 14);

hold off;

% ---- Alternative: direct probability using CDF ----
P2a = normcdf(x4) - normcdf(x3);
disp(['P2 by CDF: ', num2str(P2a)]);
%  print('-dpng','NormalPDFprobabilities260219ML.png')
% print('-depsc','NormalPDFprobabilities260219ML.eps')
% -----------------------------------------------------------------------------
% Remarks:
% Here, the aim was to show that probabilities can be calculated by integration
%   over probability densities.
% The R routine pnorm() provides such integrals in fast way and, for example,
%   the probability for x3 = 1 <= x <= x4 = 2 can be calculated as follows:
%   pnorm(x4) - pnorm(x3)
% Actually, pnorm() provides the cumulative distribution function (CDF) for the
%   normal distribution.
% -----------------------------------------------------------------------------
% Notes on MATLAB Translation
% dnorm(x) → normpdf(x,0,1)
% pnorm(x) → normcdf(x,0,1)
% integrate(dnorm, a, b)$value → integral(@(t) normpdf(t,0,1), a, b)
% polygon(xf,yf,col='color') → fill(xf, yf, 'color')
% R text() with TeX → MATLAB text() (simple string, or 
% Interpreter','latex' for LaTeX)
% This reproduces the standard normal PDF with two shaded 
% probability areas and computes P2
%  both by numeric integration and using the CDF.
% -------------------------------------------------