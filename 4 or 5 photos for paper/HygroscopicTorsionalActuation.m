clear all
clc
close all

filename = 'Hygroscopic Torsional Actuation.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:C');
    
    %ABSORPTION ROOM TEMP.
     time = Data(1:end,1);
     theta = Data(1:end,2);
     moisturecontent = Data(1:end,3);
     


filename = 'Axial Actuation as a function of moisture absorption.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:E');
    
    %ABSORPTION ROOM TEMP.
     timeTCPA = Data(1:end,4);
     ContractionTCPA = 100*Data(1:end,3)/65;
     moisturecontentTCPA = Data(1:end,5);

close all
    set(groot, 'DefaultTextInterpreter', 'LaTeX', ...
           'DefaultAxesTickLabelInterpreter', 'LaTeX', ...
           'DefaultAxesFontName', 'LaTeX', ...
           'DefaultLegendInterpreter', 'LaTeX', ...
           'defaultFigureColor','w');
       
   
% fig1=figure; hold on; grid on; set(gca,'FontSize',20);
% 
% xxaxis up;
% H1 = plot(time,theta,'LineWidth', 2)
% ylabel('Angular displacement, $\theta$ ($^\circ$)')
% % ylim([-10 0])
% 
% xxaxis bottom;
% H2 = plot(time,moisturecontent,'LineWidth', 2)
% ylabel('M ($$\%$$) ')
% % ylim([-0.5 120])
% xlabel('time (h)')
% % xlim([0 47])



fig1=figure; hold on; grid on; set(gca,'FontSize',20);

line(time,theta,'LineWidth',2,'Color','r')
xlabel('Time ($$h$$)')
ylabel(' $\theta$ ($^\circ$)')

ax1 = gca; % current axes
ax1.XColor = 'r';
ax1.YColor = 'r';

hold on 
set(gca,'FontSize',20);

ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
line(moisturecontent,theta,'LineWidth',2,'Color','k')
xlim([0 3.3])

xlabel('M ($$\%$$)')
ylabel(' $\theta$ ($^\circ$)')



fig2=figure; hold on; grid on; set(gca,'FontSize',20);

line(timeTCPA,ContractionTCPA,'LineWidth',2,'Color','r')
xlabel('Time ($$h$$)')
ylabel('Actuation Strain, $\varepsilon$ ($\%$)')
set(gca,'XTick',(0:2:22.5))
ax1 = gca; % current axes
ax1.XColor = 'r';
ax1.YColor = 'r';

hold on 
set(gca,'FontSize',20);

ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
line(moisturecontentTCPA,ContractionTCPA,'LineWidth',2,'Color','k')
xlim([0 3.3])

xlabel('M ($$\%$$)')
ylabel('Actuation Strain, $\varepsilon$ ($\%$)')



