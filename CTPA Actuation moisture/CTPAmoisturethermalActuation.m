clear all
clc
close all

filename = 'CTPA sample 1 0M content.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_Dried_Vib1 = Data(1:end,1);
     Strain_Dried1 = Data(1:end,2)/16.5; %mm
     Time_Dried_Cam1 = Data(1:2351,3)+.2;
     Temp_Dried1 = Data(1:2351,4);
filename = 'CTPA sample 2 0M content.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_Dried_Vib2 = Data(1:end,1);
     Strain_Dried2 = Data(1:end,2)/15; %mm
     Time_Dried_Cam2 = Data(1:2108,3);
     Temp_Dried2 = Data(1:2108,4);
     
 filename = 'CPTA 2.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_4_Vib1 = Data(1:end,1);
     Strain_41 = Data(1:end,2)/16.5; %mm
     Time_4_Cam1 = Data(1:2020,3)+0.1;
     Temp_41 = Data(1:2020,4);
filename = 'CPTA 3.xlsx';
    sheet1 = 'Sheet1';
    Data = xlsread(filename, sheet1,'A:F');    
     Time_4_Vib2 = Data(1:end,1);
     Strain_42 = Data(1:end,2)/15; %mm
     Time_4_Cam2 = Data(1:2194,3)+0.2;
     Temp_42 = Data(1:2194,4);
     
Temp_Dried_Interp1 =interp1(Time_Dried_Cam1,Temp_Dried1,Time_Dried_Vib1);       
Temp_Dried_Interp2 = interp1(Time_Dried_Cam2,Temp_Dried2,Time_Dried_Vib2);    

Temp_4_Interp1 =interp1(Time_4_Cam1,Temp_41,Time_4_Vib1);       
Temp_4_Interp2 = interp1(Time_4_Cam2,Temp_42,Time_4_Vib2);







    set(groot, 'DefaultTextInterpreter', 'LaTeX', ...
           'DefaultAxesTickLabelInterpreter', 'LaTeX', ...
           'DefaultAxesFontName', 'LaTeX', ...
           'DefaultLegendInterpreter', 'LaTeX', ...
           'defaultFigureColor','w');
       

       
fig1=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(Time_4_Vib2(1:end),Strain_42(1:end)-Strain_42(1)...
    ,Time_4_Vib2(1:end),Temp_4_Interp2(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
title('Torsional displacement')
legend('Torque','Temperature','Location','Northwest')
grid on 
       
       
     
       
       
       
fig2=figure; hold on; grid on; set(gca,'FontSize',20);
plot(Temp_Dried_Interp1(185277:191929),(Strain_Dried1(185277:191929)-Strain_Dried1(185277))*100,'LineWidth',2)
plot(Temp_Dried_Interp2(126655:133301),(Strain_Dried2(126655:133301)-Strain_Dried2(126655))*100,'LineWidth',2)
plot(Temp_4_Interp1(210976:216100),(Strain_41(210976:216100)-Strain_41(210976))*100,'LineWidth',2)
plot(Temp_4_Interp2(176766:181323),(Strain_42(176766:181323)-Strain_42(176766))*100,'LineWidth',2)
% plot(Temp_4_Interp2(236645:240295),(Strain_42(236645:240295)-Strain_42(236645))*100,'LineWidth',2)



ylim([-15 0.1])
xlim([20 110])


ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
ylabel('Actuation Strain, $$\varepsilon\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
legend('Sample 1 (M= 0$$\%$$)','Sample 2 (M= 0$$\%$$)',...
    'Sample 3 (M = 6.01$$\%$$)'); grid on  



TempAve = [25:3:100];


Strain_Dried1Final = interp1(Temp_Dried_Interp1(185277:191929),...
    (Strain_Dried1(185277:191929)-Strain_Dried1(185277)),TempAve);
Strain_Dried1Fina2 = interp1(Temp_Dried_Interp2(126655:133301),...
    (Strain_Dried2(126655:133301)-Strain_Dried2(126655)),TempAve); 

Strain_41Final = interp1(Temp_4_Interp1(210976:216100),...
    (Strain_41(210976:216100)-Strain_41(210976)),TempAve);
Strain_41Fina2 = interp1(Temp_4_Interp2(176766:181323),...
    (Strain_42(176766:181323)-Strain_42(176766)),TempAve);

fig2=figure; hold on; grid on; set(gca,'FontSize',20);
p1=plot(TempAve,Strain_Dried1Final*100,':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)
plot(TempAve,Strain_Dried1Fina2*100,':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)
p2=plot(TempAve,Strain_41Final*100,'--','Color',[0.3010, 0.7450, 0.933],'LineWidth',2.5)
plot(TempAve,Strain_41Fina2*100,'--','Color',[0.3010, 0.7450, 0.933],'LineWidth',2.5)
% p2b = plot(TempAve,Delta_theta_75M4Sample2Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)


ylim([-15 0.1])
xlim([25 105])


ylabel('Axial Thermal Strain, $$\varepsilon^t_{11}\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
ylabel('Actuation Strain, $$\varepsilon\hspace{1.5mm}(\%)$$')
xlabel('Temperature ($$^{\circ}$$C)')
legend([p1 p2],'Two TCPAs at M= 0$$\%$$','Two TCPAs at M= 4$$\%$$'); grid on  




