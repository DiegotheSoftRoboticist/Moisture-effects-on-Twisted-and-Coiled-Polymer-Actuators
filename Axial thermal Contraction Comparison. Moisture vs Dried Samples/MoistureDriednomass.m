clear all
clc
close all

filename = 'AxialThermalContraction for Dried and Moisture Samples.csv';
    sheet1 = 'AxialThermalContraction for Dri';
    Data = xlsread(filename, sheet1,'A:F');
    
    %ABSORPTION ROOM TEMP.
     Temp_Dried = Data(1:90,1);
     Strain_Dried = Data(1:90,2);
     
     Temp_Moisture4days = Data(1:80,3);
     Strain_Moisture4days = Data(1:80,4);
     
    Temp_Moisture1days = Data(1:70,5);
     Strain_Moisture1days = Data(1:70,6);
close all
    set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');


fig=figure('units','inch','position',[0,0,3.5,2.5]); hold on; grid on; set(gca,'FontSize',8);

% p_Dried = polyfit(Temp_Dried,Strain_Dried,3);
% fit_Dried = polyval(p_Dried,Temp_Dried);
% 
% p_Moisture1days = polyfit(Temp_Moisture1days,Strain_Moisture1days,3);
% fit_Moisture1days = polyval(p_Moisture1days,Temp_Moisture1days);
% 
p_Moisture4days = polyfit(Temp_Moisture4days,Strain_Moisture4days,3);
fit_Moisture4days = polyval(p_Moisture4days,Temp_Moisture4days);

p_Dried = polyfit(Temp_Dried,Strain_Dried,3);
fit_Dried = polyval(p_Dried,Temp_Dried);

plot(Temp_Dried,Strain_Dried,'LineWidth',0.75)
plot(Temp_Moisture1days,Strain_Moisture1days,'LineWidth',0.75)
plot(Temp_Moisture4days,Strain_Moisture4days,'LineWidth',0.75)
% plot(Temp_Moisture4days,fit_Moisture4days,':k','LineWidth',2)
% plot(Temp_Dried,fit_Dried,'k','LineWidth',1)
% plot(Temp_Moisture1days,fit_Moisture1days,'k','LineWidth',1)
% plot(Temp_Moisture4days,fit_Moisture4days,'k','LineWidth',1)

ylim([-1.1 0.1])
xlim([20 90])


xlabel('Temperature (\circC)')
ylabel('Axial Thermal Strain, ɛ^t_{11} (%)')
leg = legend('Sample 1 (M= 0%)','Sample 2 (M= 3.61%)',...
    'Sample 3 (M = 6.01%)','Location','southwest'); grid on  

 leg.ItemTokenSize = [11,20];
grid on 
set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'Axial thermal contraction as a function of moisture.png','-dpng','-r700'); 
 grid on 
%ACTUATION


%Conversion to degrees and torque to N/mm
L0 = 17.5; %mm
D = 0.89; %mm
R = D/2; %mm


%ANALYTICAL FREE TORSION 

% Thermal strains:

T = (23:1:95);
T0 = 23;

TE22 = (10^(-6)*(1.1*(T.^2 - T0.^2) + 48.2*(T - T0))); % new newest
TE11_Dried = (-1.381821459177231e-08*(T.^3-T0.^3)+1.637840088145505e-06*(T.^2-T0.^2)-0.006463801668161e-02*(T-T0)); % 
TE11_Moisture4days = (4.700912698825566e-09*(T.^3 - T0.^3) -3.114350732039047e-06*(T.^2 -T0.^2) + 0.014105297842074e-02*(T - T0)); % 
% TE11_Dried = (-2.811993987928945e-08*(T.^3-T0.^3) + 3.345051826452319e-06*(T.^2-T0.^2) -1.337544800607228e-04*(T-T0)); % Least Squares Regretion Method
% TE11_Dried =10^(-6)*(-0.0091*T.^3 + 0.9536*T.^2 - 32.05*T - (-0.0091*T0.^3 + 0.9536*T0.^2 - 32.05*T0));


Phi0 = 2*L0/(D*tan((90-36)*pi/180));

r1 = 1*R; %Radial position
r0_5 = 0.5*R;
r0_01 = 0.01*R;

x1 = r1*Phi0/L0;
x0_5 = r0_5*Phi0/L0;
x0_01 = r0_01*Phi0/L0;


dPhi_avgDried = 2*L0^2/(Phi0*R^2)*(TE11_Dried-TE22)*log((Phi0*R/L0)^2 + 1)*R/L0;
dPhi_avgMoisture4days = 2*L0^2/(Phi0*R^2)*(TE11_Moisture4days-TE22)*log((Phi0*R/L0)^2 + 1)*R/L0;

% set(groot, 'DefaultTextInterpreter', 'LaTeX', ...
%            'DefaultAxesTickLabelInterpreter', 'LaTeX', ...
%            'DefaultAxesFontName', 'LaTeX', ...
%            'DefaultLegendInterpreter', 'LaTeX', ...
%            'defaultFigureColor','w');
% 
% fig1=figure; hold on; grid on; set(gca,'FontSize',20);
% 
% 
%  plot(T,dPhi_avgDried,'k','LineWidth',1) 
%  plot(T,dPhi_avgMoisture4days,'.k','LineWidth',3.5)
% %  xlim([0 80])
% %  ylim([-0.025 0.005])
%  xlabel('Temperature ($$^{\circ}C$$)')
%  ylabel('Change in Twist, $$\Delta\Phi$$')
%  
% %  title('STPA with a 75$$^{\circ}$$ Pitch Angle')
%   legend('$$\varepsilon^t_{11}$$(M = 0$$\%$$) $\&$ $$\varepsilon^t_{22}$$(M = 0$$\%$$)',...
% '$$\varepsilon^t_{11}$$(M = 6.01$$\%$$) $\&$ $$\varepsilon^t_{22}$$(M = 0$$\%$$)')
% 
% 
% 
% 
% 
