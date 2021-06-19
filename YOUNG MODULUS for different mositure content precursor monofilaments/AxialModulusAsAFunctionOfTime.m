


clear
clc
close all


 E_moisture = [4,1.6,0.7]
 time_days = [0,1,4]
 ThermalStrain = [-0.1089,-0.43,-0.875]
 timefits = (0:0.2:4);


p_TEMoisture = polyfit(time_days,ThermalStrain,1);
fit_TEMoisture = polyval(p_TEMoisture,timefits);


fit_EMoisture = 0.7+3.3*(exp(-1.3*timefits));

t = (0:1:10)
prueva = 2.983*(1-(exp(-0.173*t)));
set(groot, 'DefaultTextInterpreter', 'LaTeX', ...
           'DefaultAxesTickLabelInterpreter', 'LaTeX', ...
           'DefaultAxesFontName', 'LaTeX', ...
           'DefaultLegendInterpreter', 'LaTeX', ...
           'defaultFigureColor','w');



% plot(timehours1_absorption(1:70),f1_absorption(B1_absorption,timehours1_absorption(1:70)),'LineWidth',1.2)

fig1=figure; hold on; grid on; set(gca,'FontSize',20);

yyaxis right;
H1 = plot(time_days,E_moisture,':','LineWidth',1.5); %plot(time4003(1:(end)),-Strain400_filt3(1:(end)),':','Linewidth',1.5)
plot(timefits,fit_EMoisture,'LineWidth',0.8)
ylabel('Axial Modulus, $$E_{1}\hspace{1.5mm}$$(GPa)')
% set(gca,'ycolor',[0.2,0,0.9])

yyaxis left;
H2 =  plot(time_days,ThermalStrain,':','Linewidth',1.5);% plot(time4003(1:(end)),p400_filt3(1:(end)),':','Linewidth',1.5)

plot(timefits,fit_TEMoisture,'LineWidth',0.8)

ylabel('Axial Thermal Strain, $$\varepsilon^T_{11}$$ $$(^\%)$$')

xlabel('Time (days)')
% xlim([0 20])

% title('400 grams')
 legend('$E_1$','$E_1$ Exponantial fit','$$\varepsilon^T_{11}$$ ',...
     '$$\varepsilon^T_{11}$$ Linear fit','Location','Northwest')
grid on 