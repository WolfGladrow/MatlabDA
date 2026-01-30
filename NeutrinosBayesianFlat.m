% NeutrinosBayesianFlat.m
disp('file: NeutrinosBayesianFlat.m')
disp(datestr(now))

% neutrinos, Bayesian approach: flat prior -> gamma posterior
% (0) data:
k = 0:9;  % number of events (neutrinos in 10 s intervals)
frequencies = [1042,860,307,78,15,3,0,0,0,1]; % frequencies

% (1) calculate n and s from data:
n = sum(frequencies);
s = sum(k .* frequencies);

% (2) gamma PDF
alpha = s + 1; disp(alpha); disp('alpha')
beta = n; disp(beta); disp('beta')

dlambda = 0.001; 
lambda = 0.7:dlambda:0.9;

% MATLAB's gampdf uses shape and scale, where scale = 1/beta in R's parameterization
y = gampdf(lambda, alpha, 1/beta);
muEst = alpha / beta; disp(round(muEst,3)); disp('muEst')
varEst = alpha / beta^2; disp(round(varEst,5)); disp('varEst')
sdEst = sqrt(varEst); disp(round(sdEst,3)); disp('sdEst')

muEstr = round(muEst,3);
sdEstr = round(sdEst,3);

xp = [muEst - sdEst, muEst + sdEst];
yp = [5, 5];

% 95% credibility set/credibility interval (CRI):
p = 0.05;
xL = gaminv(p/2, alpha, 1/beta); disp(round(xL,3)); disp('xL')
xU = gaminv(1 - p/2, alpha, 1/beta); disp(round(xU,3)); disp('xU')

xp95 = [xL, xU];
yp95 = [0, 0];

figure;
plot(lambda, y, 'k-', 'LineWidth', 4)
xlabel('$$\lambda$$','Interpreter','Latex','FontSize',20)
ylabel('Density', 'FontSize', 15)
set(gca,'FontSize',12,'Box','on')
hold on
xline(muEst, 'k--', 'LineWidth', 1.5)
plot(xp, yp, 'k--') %, muEstr,'\pm', sdEstr], ...
plot(xp95, yp95, 'm-', 'LineWidth', 3) % ,'Interpreter', 'Latex'
text(0.8,20, ...
    ['$\hat{\lambda}$ = ',num2str(muEstr),'$\pm$',num2str(sdEstr)], ...
    'Interpreter','Latex','Color','k','FontSize',15)
% text(0.8, 20, sprintf('\\hat{\\lambda} = %.3f \\pm %.3f', 
% muEstr, sdEstr), 'Color', 'k', 'FontSize', 15)
% Warning: Error in state of SceneNode.
% String scalar or character vector must have valid interpreter syntax:
% \\hat{\\lambda} = 0.778 \\pm 0.018
text(muEst, 1, '95% CRI', 'Color', 'm', 'FontSize', 15)

hold off
%  print('-dpng','NeutrinosBayesian260129.png')
% print('-depsc','NeutrinosBayesian260129.eps')
% -----------------------------------------------------------------------------
% Results
% "file: NeutrinosBayesianFlat.R"
% "Sun Dec 18 09:41:21 2022"
% "1793"  "alpha"
% "2306" "beta"
% "0.778" "muEst"
% "0.00034" "varEst" 
% "0.018" "sdEst"
% "0.742" "xL"   
% "0.814" "xU"  
% -----------------------------------------------------------------------------