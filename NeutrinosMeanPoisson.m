fprintf('file: NeutrinosMeanPoisson.m');
disp(datestr(now));

% neutrinos: calculate sample mean and compare relative frequencies with Poisson probabilities
k = 0:9; % number of events (neutrinos in 10 s intervals)
frequencies = [1042,860,307,78,15,3,0,0,0,1]; % frequencies
lambdaEst = sum(k .* frequencies) / sum(frequencies); % estimate of mean rate = E[k]
% disp([round(lambdaEst,3), NaN]); % NaN placeholder for string 'lambdaEst'
disp([round(lambdaEst,3), lambdaEst]);
rf = frequencies / sum(frequencies); % relative frequencies
lambdaEst2 = sum(k .* rf); 
% disp([round(lambdaEst2,3), NaN]); % NaN placeholder for string 'lambdaEst2'
disp([round(lambdaEst2,3), lambdaEst2]); 
lambdaEst3 = sum(((k - lambdaEst2).^2) .* rf); 
% disp([round(lambdaEst3,3), NaN]); % NaN placeholder for string 'lambdaEst3'
disp([round(lambdaEst3,3), lambdaEst3]);
pPredict = poisspdf(k, lambdaEst); % probabilities based on estimated lambda
q = rf ./ pPredict;
sflag = 2;
if sflag == 2
    figure;
    plot(k, rf, 'k.', 'MarkerSize', 12);
    hold on;
    plot(k, pPredict, 'm^', 'MarkerSize', 8, 'LineWidth', 2);
    xlabel('Number of events, k', 'FontSize', 12);
    ylabel('Probability, relative frequency', 'FontSize', 12);
    title('');
    lambdar = round(lambdaEst, 3);
    text(5.6, 0.2, ['\lambdâ = ', num2str(lambdar)], 'Color', 'magenta', 'FontSize', 14, 'HorizontalAlignment', 'left');
    hold off;
end
%  print('-dpng','NeutrinosP260129.png')
% print('-depsc','NeutrinosP260129.eps')