% file: LookHeatmap.m
% Anscombe's quartet (1973):

data1 = [ ...
10.0,8.04,10.0,9.14,10.0,7.46,8.0,6.58,...
8.0,6.95,8.0,8.14,8.0,6.77,8.0,5.76,...
13.0,7.58,13.0,8.74,13.0,12.74,8.0,7.71,...
9.0,8.81,9.0,8.77,9.0,7.11,8.0,8.84,...
11.0,8.33,11.0,9.26,11.0,7.81,8.0,8.47,...
14.0,9.96,14.0,8.10,14.0,8.84,8.0,7.04,...
6.0,7.24,6.0,6.13,6.0,6.08,8.0,5.25,...
4.0,4.26,4.0,3.10,4.0,5.39,19.0,12.50,...
12.0,10.84,12.0,9.13,12.0,8.15,8.0,5.56,...
7.0,4.82,7.0,7.26,7.0,6.42,8.0,7.91,...
5.0,5.68,5.0,4.74,5.0,5.73,8.0,6.89];

% Create matrix (8 rows, 11 columns)
M1 = reshape(data1, 8, 11);

% Correlation matrix
cm = corrcoef(M1);

% Number of colors
nc = 12;

% Heat color map (similar to R heat.colors)
hc = hot(nc);

% Reverse order (dark red for high positive correlations)
hci = flipud(hc);

% Plot heatmap
figure
imagesc(cm)
axis square
colormap(hci)
colorbar
caxis([-1 1])   % correlation range
set(gca,'YDir','normal')  % match R orientation

title('Correlation Heatmap (Anscombe Matrix)')

% Optional: annotate +1 and -1 similar to R
annotation('textbox',[0.92 0.88 0.05 0.05],'String','+1.0',...
    'EdgeColor','none','Color','black');

annotation('textbox',[0.92 0.12 0.05 0.05],'String','-1.0',...
    'EdgeColor','none','Color','black');

% To save as PNG (similar to R png()):
% print('HeatmapAnscombe220221','-dpng','-r300')

% Notes on Differences from R
% matrix(..., nrow=8, ncol=11) → reshape(data1,8,11)
% cor() → corrcoef()
% heat.colors() → hot()
% rev() → flipud()
% heatmap() → imagesc() (simpler and more controllable in MATLAB)
% colorbar.plot() → built-in colorbar
% If you'd like, I can also provide a version using MATLAB's newer heatmap() function instead of imagesc()