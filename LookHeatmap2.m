% file: LookHeatmap.m
% Anscombe's quartet (1973)

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

% Create colormap similar to R heat.colors and reverse it
hc = hot(nc);
hci = flipud(hc);

% Labels for rows and columns
labels = compose("V%d",1:11);

% Plot using MATLAB heatmap()
figure
h = heatmap(labels, labels, cm);

% Formatting
h.Colormap = hci;
h.ColorLimits = [-1 1];   % correlation range
h.CellLabelFormat = '%.2f';
title('Correlation Heatmap (Anscombe Matrix)')
%  print('-dpng','HeatmapAnscombe260218ML2.png')
% print('-depsc','HeatmapAnscombe260218ML2.eps')
% Note:
% heatmap() automatically adds a colorbar.
% To save as PNG (300 dpi):
% exportgraphics(gcf,'HeatmapAnscombe220221.png','Resolution',300)
