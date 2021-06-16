clear all
clc
close all

filename = 'Axial Thermal Contraction 0 Percent Moissture Content.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_Dried_Vib = Data(1:end,1);
     Strain_Dried = Data(1:end,2)/16; %mm
     Time_Dried_Cam = Data(1:4236,3);
     Temp_Dried = Data(1:4236,4);
filename = 'Axial Thermal Contraction 3.6 Percent Moissture Content.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_3_6Per_Vib = Data(1:end,1);
     Strain_3_6Per = Data(1:end,2)/19.5; %mm
     Time_3_6Per_Cam = Data(1:4683,3);
     Temp_3_6Per = Data(1:4683,4);
filename = 'Axial Thermal Contraction 6 Percent Moissture Content.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_6Per_Vib = Data(1:end,1);
     Strain_6Per = Data(1:end,2)/15; %mm
     Time_6Per_Cam = Data(1:3840,3)+1.5;
     Temp_6Per = Data(1:3840,4);     
     
     
Temp_Dried_Interp =interp1(Time_Dried_Cam,Temp_Dried,Time_Dried_Vib);       
Temp_3_6Per_Interp = interp1(Time_3_6Per_Cam,Temp_3_6Per,Time_3_6Per_Vib); 
Temp_6Per_Interp = interp1(Time_6Per_Cam,Temp_6Per,Time_6Per_Vib);









set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');

       
fig1=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(Time_6Per_Vib(1:end),Strain_6Per(1:end)-Strain_6Per(1)...
    ,Time_6Per_Vib(1:end),Temp_6Per_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
title('Torsional displacement')
legend('Torque','Temperature','Location','Northwest')
grid on 
       
       
       
       
       
       
fig=figure('units','inch','position',[0,0,3.5,2.5]); hold on; grid on; set(gca,'FontSize',8);
 
% p_Moisture4days = polyfit(Temp_Moisture4days,Strain_Moisture4days,3);
% fit_Moisture4days = polyval(p_Moisture4days,Temp_Moisture4days);
% 
 p_Dried = polyfit(Temp_Dried_Interp(307807:325109),(Strain_Dried(307807:325109)-Strain_Dried(307807)),3);
 fit_Dried = polyval(p_Dried,Temp_Dried_Interp(307807:325109));
plot(Temp_Dried_Interp(307807:325109),fit_Dried*100,'LineWidth',2)

plot(Temp_Dried_Interp(307807:325109),(Strain_Dried(307807:325109)-Strain_Dried(307807))*100,'LineWidth',2)
plot(Temp_3_6Per_Interp(373426:392960),(Strain_3_6Per(373426:392960)-Strain_3_6Per(373426))*100,'LineWidth',2)
% plot(Temp_3_6Per_Interp(288235:end),(Strain_3_6Per(288235:end)-Strain_3_6Per(288235))*100,'LineWidth',2)
%  plot(Temp_6Per_Interp(395910:426546),(Strain_6Per(395910:426546)-Strain_6Per(395910))*100,'LineWidth',2)
%  plot(Temp_6Per_Interp(207505:235187),(Strain_6Per(207505:235187)-Strain_6Per(207505))*100,'LineWidth',2)
  plot(Temp_6Per_Interp(309045:327986),(Strain_6Per(309045:327986)-Strain_6Per(309045))*100,'LineWidth',2)

% 
plot(Temp_Moisture1days,Strain_Moisture1days,'LineWidth',2)
plot(Temp_Moisture4days,Strain_Moisture4days,'LineWidth',2)
plot(Temp_Moisture4days,fit_Moisture4days,':k','LineWidth',2)
plot(Temp_Dried,fit_Dried,'k','LineWidth',1)
plot(Temp_Moisture1days,fit_Moisture1days,'k','LineWidth',1)
plot(Temp_Moisture4days,fit_Moisture4days,'k','LineWidth',1)

ylim([-1.25 0.1])
xlim([20 90])


ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
legend('Sample 1 (M= 0$$\%$$)','Sample 2 (M= 3.61$$\%$$)',...
    'Sample 3 (M = 6.01$$\%$$)'); grid on  
