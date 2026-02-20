disp('file: MaxEntExpPD.m')
% MaxEnt: discrete exponential probability distribution

mu = 2.5;
j  = 0:50;

pj = 1/(1+mu) * (mu/(1+mu)).^j;

% Plot
figure;
plot(j, pj, 'ob', 'LineWidth', 2, 'MarkerSize', 6); % blue points
xlim([0 20]);
xlabel('j');
ylabel('p_j');   % equivalent of expression(p[j])
box on;

% Add mu annotation
text(8, 0.2, ['\mu = ', num2str(mu)], 'Color', 'b', 'FontSize', 14);

%  print('-dpng','ExpDisMu2p5X260219ML.png')
% print('-depsc','ExpDisMu2p5X260219ML.eps')
% -------------------------------------------------
% Notes on Translation
% seq(0,50) → 0:50
% .^ is used for elementwise power in MATLAB (^ is matrix power)
% plot(...,'o') with 'b' replaces type='p', col='blue'
% cex in R is replaced with 'MarkerSize' in MATLAB
% ylab=expression(p[j]) → 'p_j' label
% bquote(~mu == .(mu)) → simple text with '\mu = value'
% xlim matches R xlim=c(0,20)