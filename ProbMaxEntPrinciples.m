disp('file: ProbMaxEntPrinciples.m')
% range of applicability of MaxEnt principles

p = 0:0.01:7;

x  = cos(p);
y  = sin(p) + 0.2*sin(2*p + 0.8);

xa = -0.14 + 0.27*cos(p);
ya = -0.5  + 0.27*sin(p);

f  = 1.8;
xb = f*0.3*cos(p);
yb = 0.1 + f*(0.3*sin(p) + 0.15*sin(2*p + 4) + 0.02*sin(3*p + 1));

xc = -0.3 + 0.2*cos(p);
yc = -0.4 + 0.2*sin(p) + 0.1*sin(2*p + 1);

% Plot
figure;
plot(x, y, 'b', 'LineWidth', 3);
hold on;

plot(xa, ya, 'k', 'LineWidth', 3);
plot(xb, -yb, 'r', 'LineWidth', 3);

axis off;   % removes axes and box similar to R settings

% ----- Text annotations -----

xt = -0.2;
text(xt+0.3, 0.75, 'Principle of', 'Color', 'b');
text(xt-0.1, 0.60, 'Maximum Relative Entropy', 'Color', 'b');
text(xt+0.1, 0.45, '(MaxRelEnt)', 'Color', 'b');

xt = -0.51;
text(xt,  0.18, 'Principle of', 'Color', 'r');
text(xt,  0.03, 'Maximum Entropy', 'Color', 'r');
text(xt, -0.12, '(MaxEnt)', 'Color', 'r');

xt = -0.365;
text(xt, -0.42, 'Principle of', 'Color', 'k');
text(xt, -0.55, 'Indifference', 'Color', 'k');

hold off;
%  print('-dpng','MEP260219ML.png')
% print('-depsc','MEP260219ML.eps')
% -------------------------------------------------