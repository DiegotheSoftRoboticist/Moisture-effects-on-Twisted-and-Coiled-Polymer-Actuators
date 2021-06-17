clear all
clc
close all

filename = 'Axial Thermal Contraction 0 Percent Moissture Content.csv';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_Dried_Vib = Data(1:end,1);
     Strain_Dried = Data(1:end,2)/20; %mm
     Time_Dried_Cam = Data(1:end,1);
     Temp_Dried = Data(1:end,4);
filename = 'Axial Thermal Contraction 3.6 Percent Moissture Content.csv';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_3_6Per_Vib = Data(1:end,1);
     Strain_3_6Per = Data(1:end,2)/20; %mm
     Time_3_6Per_Cam = Data(1:end,1);
     Temp_3_6Per = Data(1:end,4);
filename = 'Axial Thermal Contraction 6 Percent Moissture Content.csv';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_6Per_Vib = Data(1:end,1);
     Strain_6Per = Data(1:end,2)/20; %mm
     Time_6Per_Cam = Data(1:end,1);
     Temp_6Per = Data(1:end,4);     
     
     
Temp_Dried_Interp =interp1(Time_Dried_Cam,Temp_Dried,Time_Dried_Vib);       
Temp_3_6Per = interp1(Time_3_6Per_Cam,Temp_3_6Per,Time_3_6Per_Vib); 
Temp_6Per = interp1(Time_6Per_Cam,Temp_6Per,Time_6Per_Vib);









    set(groot, 'DefaultTextInterpreter', 'LaTeX', ...
           'DefaultAxesTickLabelInterpreter', 'LaTeX', ...
           'DefaultAxesFontName', 'LaTeX', ...
           'DefaultLegendInterpreter', 'LaTeX', ...
           'defaultFigureColor','w');
       

       
fig1=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(Time_Dried_Vib(1:end),Strain_Dried(1:end)-Strain_Dried(1)...
    ,Time_Dried_Vib(1:end),Temp_Dried_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
title('Torsional displacement')
legend('Torque','Temperature','Location','Northwest')
grid on 
       
       
       
       
       
       
fig2=figure; hold on; grid on; set(gca,'FontSize',20);
 
p_Moisture4days = polyfit(Temp_Moisture4days,Strain_Moisture4days,3);
fit_Moisture4days = polyval(p_Moisture4days,Temp_Moisture4days);

p_Dried = polyfit(Temp_Dried,Strain_Dried,3);
fit_Dried = polyval(p_Dried,Temp_Dried);

plot(Temp_Dried,Strain_Dried,'LineWidth',2)
plot(Temp_Moisture1days,Strain_Moisture1days,'LineWidth',2)
plot(Temp_Moisture4days,Strain_Moisture4days,'LineWidth',2)
plot(Temp_Moisture4days,fit_Moisture4days,':k','LineWidth',2)
plot(Temp_Dried,fit_Dried,'k','LineWidth',1)
% plot(Temp_Moisture1days,fit_Moisture1days,'k','LineWidth',1)
% plot(Temp_Moisture4days,fit_Moisture4days,'k','LineWidth',1)

ylim([-1.1 0.1])
xlim([20 90])


ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
legend('Sample 1 (M= 0$$\%$$)','Sample 2 (M= 3.61$$\%$$)',...
    'Sample 3 (M = 6.01$$\%$$)'); grid on  
