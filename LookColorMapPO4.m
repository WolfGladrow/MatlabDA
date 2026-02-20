disp('file: LookColorMapPO4.m')

% Data source: NOAA World Ocean Atlas (WOA)
% NetCDF file: phosphate_annual_1deg.nc

% Read NetCDF variables
info = ncinfo('phosphate_annual_1deg.nc');

phosphate_lon = ncread('phosphate_annual_1deg.nc','lon');   % eastern longitude
phosphate_lat = ncread('phosphate_annual_1deg.nc','lat');   % latitude
phosphate_con = ncread('phosphate_annual_1deg.nc','p_an');  % PO4 annual mean

% Extract surface layer (depth index = 1)
B = phosphate_con(:,:,1);

% In some NetCDF files, dimensions are (lon,lat,depth).
% If the plot appears rotated, use:
% B = permute(phosphate_con(:,:,1), [2 1]);

Bmax = max(B(:),[],'omitnan');   % maximum surface concentration

% Define color breaks
brk = 0:0.05:2.3;
% L = length(brk) - 1; % DWG 2/2026 not requested

figure

% Plot using imagesc (MATLAB equivalent of image.plot)
imagesc(phosphate_lon, phosphate_lat, B')
set(gca,'YDir','normal')   % correct vertical orientation
% colormap(rainbow(L)) % Unrecognized function or variable 'rainbow'
colormap jet % DWG 2/2026
caxis([min(brk) max(brk)])
colorbar

xlabel('Eastern longitude','FontSize',14)
ylabel('Latitude','FontSize',14)
title('$[PO_4]\ (\mu mol\ L^{-1})$', ...
      'Interpreter','latex','FontSize',14)

set(gca,'FontSize',12)

% ---------------------------------------------------
% Results:
fprintf('max(PO4,surface) = %.2f (mumol/L)\n', round(Bmax,2));

% ---------------------------------------------------
% Remarks:
% ncread() is MATLAB's equivalent of R's ncvar_get().
% imagesc() + colorbar replaces image.plot() from the fields package.
% B' is used because MATLAB and R store matrices differently.
% colormap(rainbow(L)) mimics R's rainbow color scale.
% ---------------------------------------------------
