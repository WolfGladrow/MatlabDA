disp('file: NeutrinosMeanPoissonLog.m')
disp(datestr(now))

% neutrinos: calculate sample mean and compare relative frequencies with Poisson probabilities
k = 0:9; % number of events (neutrinos in 10 s intervals)
frequencies = [1042,860,307,78,15,3,0,0,0,1]; % frequencies
lambdaEst = sum(k .* frequencies) / sum(frequencies); % estimate of mean rate = E[k]
disp([round(lambdaEst,3), NaN]) % NaN placeholder for string 'lambdaEst'
disp('lambdaEst')

rf = frequencies / sum(frequencies); % relative frequencies
lambdaEst2 = sum(k .* rf); 
disp([round(lambdaEst2,3), NaN])
disp('lambdaEst2')

lambdaEst3 = sum(((k - lambdaEst2).^2) .* rf);
disp([round(lambdaEst3,3), NaN])
disp('lambdaEst3')

pPredict = poisspdf(k, lambdaEst); % probabilities based on estimated lambda
q = rf ./ pPredict;

sflag = 3;
if sflag == 3
    % log-y plot
    figure;
    % Plot relative frequencies with log scale on y-axis
    semilogy(k, rf, 'k.', 'MarkerSize', 6)
    hold on
    semilogy(k, pPredict, 'm^', 'MarkerSize', 6, 'LineWidth', 1.5)
    xlabel('Number of events, k', 'FontSize', 12)
    ylabel('Probability, relative frequency', 'FontSize', 12)
    ylim([1e-7 1])
    title('')
    % Add text with estimated lambda
    lambdar = round(lambdaEst,3);
    text(5.6, 0.2, ['\lambdâ = ', num2str(lambdar)], 'Color', 'magenta', 'FontSize', 14)
    hold off
end
%  print('-dpng','NeutrinosLog260129.png')
% print('-depsc','NeutrinosLog260129.eps')
% ----------------------------------------------------------------
% Remarks:
% Switch to logarithmic scale for the y-axis by adding log='y' 
% as parameter in plot().
%
% Warnings occur because frequencies for k = 6, 7, 8 are zero 
% and thus their logarithms are -infinity. No need to react 
% because these values are omitted from logarithmic plot
% ----------------------------------------------------------------