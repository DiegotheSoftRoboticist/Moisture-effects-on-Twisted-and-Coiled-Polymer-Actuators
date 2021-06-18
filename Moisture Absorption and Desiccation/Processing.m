clear all
clc
close all

filename = 'Mositure Absorption-Desiccation behavior of Drawn Nylon 6.6.xlsx';
    sheet1 = 'Sheet1';
    Sartorius = xlsread(filename, sheet1,'A:J');
    
    %ABSORPTION ROOM TEMP.
     timesec_absorption = Sartorius(1:end,1);
     mass_absorption = Sartorius(1:end,2);
     M_t_absorption = ((mass_absorption-mass_absorption(1))/mass_absorption(1))*100;
     
     timehours_absorption = timesec_absorption/3600;
     timedays_absorption = timehours_absorption/24;
      
     timehours1_absorption = timehours_absorption(1:88); %Plot from 1 to 70
     timehours2_absorption = timehours_absorption(70:end);
        M_t1_absorption = M_t_absorption(1:88); 
        M_t2_absorption = M_t_absorption(70:end);
        
   %DESICCATION ROOM TEMP.
   timesec_desiccation = Sartorius(1:end,5);
     mass_desiccation = Sartorius(1:end,6);
     M_t_desiccation = ((mass_desiccation-mass_absorption(1))/mass_absorption(1))*100;
     
     timehours_desiccation = timesec_desiccation/3600;
     timedays_desiccation = timehours_desiccation/24;
     
     timehours1_desiccation = timehours_desiccation(1:80);
     timehours2_desiccation = timehours_desiccation(80:end);
        M_t1_desiccation = M_t_desiccation(1:80);
        M_t2_desiccation = M_t_desiccation(80:end);
        
   %DESICCATION 70 deg C TEMP.
   timesec_desiccation_70 = Sartorius(1:end,7);
     mass_desiccation_70 = Sartorius(1:end,8);
     M_t_desiccation_70 = ((mass_desiccation_70-mass_absorption(1))/mass_absorption(1))*100;
     
     timehours_desiccation_70 = timesec_desiccation_70/3600;
     timedays_desiccation_70 = timehours_desiccation_70/24;
     
     timehours1_desiccation_70 = timehours_desiccation_70(1:121);
     timehours2_desiccation_70 = timehours_desiccation_70(121:end);
        M_t1_desiccation_70 = M_t_desiccation_70(1:121);
        M_t2_desiccation_70 = M_t_desiccation_70(121:end);
        
          %DESICCATION 110 deg C TEMP.
   timesec_desiccation_110 = Sartorius(1:end,9);
     mass_desiccation_110 = Sartorius(1:end,10);
     M_t_desiccation_110 = ((mass_desiccation_110-mass_absorption(1))/mass_absorption(1))*100;
     
     timehours_desiccation_110 = timesec_desiccation_110/3600;
     timedays_desiccation_110 = timehours_desiccation_110/24;
     
%      timehours1_desiccation_110 = timehours_desiccation_110(1:121);
%      timehours2_desiccation_110 = timehours_desiccation_110(121:end);
%         M_t1_desiccation_110 = M_t_desiccation_110(1:121);
%         M_t2_desiccation_110 = M_t_desiccation_110(121:end);
        
set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');


%Absorption Curve Fit
f1_absorption = @(b1_absorption,timehours1_absorption)...
     (b1_absorption(1)-b1_absorption(1)*exp(-b1_absorption(2)*timehours1_absorption));            % Objective Function
B1_absorption = fminsearch(@(b1_absorption) ...
    norm(M_t1_absorption - f1_absorption(b1_absorption,timehours1_absorption)), [2.73;0.2])                  % Estimate Parameters
f2_absorption = @(b2_absorption,timehours2_absorption)...
    (b2_absorption(1)-b2_absorption(2)*exp(-b2_absorption(3)*timehours2_absorption));  
B2_absorption= [6.5141;5.1597;0.0237];
B2_absorption = fminsearch(@(b2_absorption)...
    norm(M_t2_absorption - f2_absorption(b2_absorption,timehours2_absorption)), B2_absorption) 


%Desiccation at Room Temperature Curve Fit
f1_desiccation = @(b1_desiccation,timehours1_desiccation)...
     (-(b1_desiccation(1)-b1_desiccation(1)*exp(-b1_desiccation(2)*timehours1_desiccation)));            % Objective Function
B1_desiccation = fminsearch(@(b1_desiccation) ...
    norm(M_t1_desiccation - f1_absorption(b1_desiccation,timehours1_desiccation)), [1;1])                  % Estimate Parameters
f2 = @(b2_desiccation,timehours2_desiccation)...
    (b2_desiccation(1)-b2_desiccation(2)*exp(-b2_desiccation(3)*timehours2_desiccation));  
B2_desiccation= [1;1;1];
B2_desiccation = fminsearch(@(b2_desiccation)...
    norm(M_t2_desiccation - f2(b2_desiccation,timehours2_desiccation)), B2_desiccation) 


%%
% 
% <latex>
% \begin{tabular}{|c|c|} \hline
% $n$ & $n!$ \\ \hline
% 1 & 1 \\
% 2 & 2 \\
% 3 & 6 \\ \hline
% \end{tabular}
% </latex>
% 
fig=figure('units','inch','position',[0,0,7,2.5]); hold on; grid on; set(gca,'FontSize',8);
       

plot(timehours_absorption,M_t_absorption,'LineWidth',0.8)
plot(timehours_desiccation,M_t_desiccation,'LineWidth',0.8)
plot(timehours_desiccation_70,M_t_desiccation_70,'LineWidth',0.8)
% plot(timehours_desiccation_110,M_t_desiccation_110,'LineWidth',2)

% 
%  plot(timehours1_absorption(1:70),f1_absorption(B1_absorption,timehours1_absorption(1:70)),'LineWidth',1.2)
%  plot(timehours2_absorption,f2_absorption(B2_absorption,timehours2_absorption),'LineWidth',1.2)
% 
% 
% plot(timehours1_desiccation,f1_desiccation(B1_desiccation,timehours1_desiccation),'LineWidth',1.2)
% plot(timehours2_desiccation,f2_absorption(B2_desiccation,timehours2_desiccation),'LineWidth',1.2)

% xlim([0 12.5]);
% ylim([0 2.5]);

 xlabel('Time (hour)')
 ylabel('M (%) ')
 leg = legend('Moisture Absorption at 25°C'...
     ,'Desiccation at 25°C'...
     ,'Desiccation at 70°C'); grid on 
 
 
leg.ItemTokenSize = [11,20];
grid on 
set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'Moisture Absorption.png','-dpng','-r700'); 
