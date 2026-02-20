disp('file: ProbVenn.m')
% generalized sum rule: Venn diagram

p = 0:0.01:7;

x = cos(p);
y = sin(p) + 0.2*sin(2*p + 0.8);

% A:
xb = -0.3 + 0.3*cos(p);
yb = -0.3 + 0.3*sin(p) + 0.15*sin(2*p + 4) + 0.02*sin(3*p + 1);

% subset C with overlap to B
xc = -0.3 + 0.2*cos(p);
yc = -0.4 + 0.2*sin(p) + 0.1*sin(2*p + 1);

% Plot
figure;
plot(xc, yc, 'm', 'LineWidth', 4);   % magenta curve
hold on;
plot(xb, yb, 'b', 'LineWidth', 4);   % blue curve

% Axis settings to match R version
xlim([-0.6 0]);
ylim([-0.7 0.15]);
axis off;        % removes axes and box (similar to bty='n', xaxt='n', yaxt='n')

% Labels
text(-0.3, -0.6, 'B', 'Color', 'm', 'FontSize', 14);
text(-0.4, -0.1, 'A', 'Color', 'b', 'FontSize', 14);
text(-0.35, -0.4, 'A \cap B', 'Color', 'k', 'FontSize', 14);

hold off;
%  print('-dpng','Venn260219ML.png')
% print('-depsc','Venn260219ML.eps')
% -------------------------------------------------