display('file: NeutrinosData.m')
k = 0:9; % number of events (neutrinos in 10 s intervals)
frequencies = [1042, 860, 307, 78, 15, 3, 0, 0, 0, 1];
figure;
plot(k, frequencies, 'ko', 'LineWidth', 4, 'MarkerSize', 6);
xlabel('Number of events', 'FontSize', 15);
ylabel('Frequency', 'FontSize', 15);
set(gca, 'FontSize', 12, 'YDir', 'normal');
%  print('-dpng','Neutrinos260129.png')
% print('-depsc','Neutrinos260129.eps')