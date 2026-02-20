disp('file: MVCCexampleCovAnscombe.m');

% Anscombe's quartet (1973)
data1 = [10.0,8.04,10.0,9.14,10.0,7.46,8.0,6.58,...
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

M1 = reshape(data1, 8, 11);   % 8 rows, 11 columns

x1=M1(1,:); y1=M1(2,:);
x2=M1(3,:); y2=M1(4,:);
x3=M1(5,:); y3=M1(6,:);
x4=M1(7,:); y4=M1(8,:);

xp0 = [1 21];

figure;
tiledlayout(2,2);

datasets = {x1,y1; x2,y2; x3,y3; x4,y4};

for i = 1:4
    nexttile;
    x = datasets{i,1};
    y = datasets{i,2};
    
    plot(x,y,'b.','MarkerSize',15);
    hold on;
    xlim([2 20]);
    ylim([2 14]);
    
    xlabel(['$x_' num2str(i) '$'],'Interpreter','latex','FontSize',14);
    ylabel(['$y_' num2str(i) '$'],'Interpreter','latex','FontSize',14);
    
    % Linear regression (equivalent to lm in R)
    p = polyfit(x,y,1);        % p(1)=slope, p(2)=intercept
    yp0 = polyval(p,xp0);
    plot(xp0, yp0, 'k');       % regression line
    
    % Means
    xmean = mean(x);
    ymean = mean(y);
    
    plot([xmean xmean],[0 20],'r');   % vertical mean line
    plot([-1 22],[ymean ymean],'r');  % horizontal mean line
    
    % Quadrant signs
    text(11,12,'+','Color','red','FontSize',12);
    text(7.4,12,'-','Color','red','FontSize',14);
    text(11,3,'-','Color','red','FontSize',14);
    text(7,3,'+','Color','red','FontSize',12);
    
    hold off;
end
%  print('-dpng','AnscombeQuartet260219ML.png')
% print('-depsc','AnscombeQuartet260219ML.eps')
% Remarks(ChatGPT): Key MATLAB equivalents:
% matrix() → reshape()
% lm(y~x) → polyfit(x,y,1)
% lines() → plot()
% par(mfrow=c(2,2)) → tiledlayout(2,2)
% TeX() → 'Interpreter','latex'
% This reproduces the 2×2 Anscombe quartet 
% layout with regression and mean reference lines.