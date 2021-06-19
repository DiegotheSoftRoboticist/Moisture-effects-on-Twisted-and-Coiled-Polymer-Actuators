 
clear
clc
close all


 % Retrieve Data
    filename = 'Last Cycle..xlsx';
    sheet = 'Sheet1';
    sample = xlsread(filename, sheet,'A:E');
    
    
Disp_Dried = sample(1:end,1); %microms
Force_Dried = sample(1:end,2); %Newtons

Disp_1Day = sample(1:end,3);
Force_1Day = sample(1:end,4);

Disp_4Day = sample(1:end,5);
Force_4Day = sample(1:end,6);
  

Area = ((0.89^2)*pi)/4; %Cross Section Area in mm^2

Stress_Dried = Force_Dried/Area; %MPa
Stress_1Day = Force_1Day/Area; %MPa
Stress_4Day = Force_4Day /Area; %MPa

Stress_Dried = -(Stress_Dried-Stress_Dried(1))
Stress_1Day = -(Stress_1Day-Stress_1Day(1))
Stress_4Day = -(Stress_4Day-Stress_4Day(1))

Strain_Dried = 100*(Disp_Dried(1)-Disp_Dried)/Disp_Dried(1);
Strain_1Day = 100*(Disp_1Day(1)-Disp_1Day)/Disp_1Day(1);
Strain_4Day = 100*(Disp_4Day(1)-Disp_4Day)/Disp_4Day(1);

p_Dried = polyfit(Strain_Dried,Stress_Dried,1);
fit_Dried = polyval(p_Dried,Strain_Dried);

p_1Day = polyfit(Strain_1Day,Stress_1Day,1);
fit_1Day = polyval(p_1Day,Strain_1Day);

p_4Day = polyfit(Strain_4Day,Stress_4Day,1);
fit_4Day = polyval(p_4Day,Strain_4Day);

set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');


fig=figure('units','inch','position',[0,0,3.5,2.5]); hold on; grid on; set(gca,'FontSize',8);
 
plot(-Strain_Dried,Stress_Dried,'Linewidth',0.75)

plot(-Strain_1Day,Stress_1Day,'Linewidth',0.75)

plot(-Strain_4Day,Stress_4Day,'Linewidth',0.75)

plot(-Strain_Dried,fit_Dried,'k','Linewidth',.5)
plot(-Strain_1Day,fit_1Day,'k','Linewidth',.5)
plot(-Strain_4Day,fit_4Day,'k','Linewidth',.5)

 
 legend('Strain_Dried','Strain_1Day','Strain_4Day')
xlim([0 0.8])

ylim([0 32])

ylabel('Stress, \sigma_{11} (MPa)')
xlabel('Axial Strain, ɛ_{11} (%)')

leg =legend('Sample 1 (M= 0%)','Sample 2 (M= 3.61%)',...
    'Sample 3 (M = 6.01%)','Linear fit','Location','northwest'); grid on  
 leg.ItemTokenSize = [11,20];
grid on 
set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'Axial modulus as a function of moisture.png','-dpng','-r700'); 
 grid on 






