
clear all
clc
close all


% 65 Degrees 0%Moisture Sample 1 
      filename = '65 deg 0M Sample 1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M0Sample1 = Data(1:end,1);
    dispVib65M0Sample1 = Data(1:end,2);
    timeCam65M0Sample1 = Data(1:2037,3);
    tempCam65M0Sample1 = Data(1:2037,4);
    
% 65 Degrees 0%Moisture Sample 2 
      filename = '65 deg 0M Sample 2.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M0Sample2 = Data(1:end,1);
    dispVib65M0Sample2 = Data(1:end,2);
    timeCam65M0Sample2 = Data(1:1864,3);
    tempCam65M0Sample2 = Data(1:1864,4);
    
% 65 Degrees 0%Moisture Sample 3 
      filename = '65 deg 0M Sample 3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M0Sample3 = Data(1:end,1);
    dispVib65M0Sample3 = Data(1:end,2);
    timeCam65M0Sample3 = Data(1:1986,3);
    tempCam65M0Sample3 = Data(1:1986,4);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % 65 Degrees 4%Moisture Sample 1 
      filename = '65 deg 3.1M Sample1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M4Sample1 = Data(1:end,1);
    dispVib65M4Sample1 = Data(1:end,2);
    timeCam65M4Sample1 = Data(1:2543,3);
    tempCam65M4Sample1 = Data(1:2543,4);
    
% 65 Degrees 4%Moisture Sample 2 
      filename = '65 deg 3.1M Sample2 no first cycle.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M4Sample2 = Data(1:end,1);
    dispVib65M4Sample2 = Data(1:end,2);
    timeCam65M4Sample2 = Data(1:2591,3);
    tempCam65M4Sample2 = Data(1:2591,4);
    
 % 65 Degrees 4%Moisture Sample 3 
      filename = '65 deg 3.1M Sample3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib65M4Sample3 = Data(1:end,1);
    dispVib65M4Sample3 = Data(1:end,2);
    timeCam65M4Sample3 = Data(1:2678,3);
    tempCam65M4Sample3 = Data(1:2678,4);  
    
    
  tempCam65M0Sample1_Interp =interp1(timeCam65M0Sample1,tempCam65M0Sample1,timeVib65M0Sample1);  
  tempCam65M0Sample2_Interp =interp1(timeCam65M0Sample2,tempCam65M0Sample2,timeVib65M0Sample2);  
  tempCam65M0Sample3_Interp =interp1(timeCam65M0Sample3,tempCam65M0Sample3,timeVib65M0Sample3);  
  tempCam65M4Sample1_Interp =interp1(timeCam65M4Sample1,tempCam65M4Sample1,timeVib65M4Sample1);  
  tempCam65M4Sample2_Interp =interp1(timeCam65M4Sample2,tempCam65M4Sample2,timeVib65M4Sample2);  
  tempCam65M4Sample3_Interp =interp1(timeCam65M4Sample3,tempCam65M4Sample3,timeVib65M4Sample3);
    
%Conversion to degrees and torque to N/mm
L0 = 17.5; %mm
D = 0.89; %mm
R = D/2; %mm

%Perimeter of the spool = 2*pi*3 mm = 18.85 mm 

Delta_theta_65M0Sample1 = (360*dispVib65M0Sample1/18.85)/2.2;
Delta_theta_65M0Sample2 = (360*dispVib65M0Sample2/18.85)/2.2;
Delta_theta_65M0Sample3 = (360*dispVib65M0Sample3/18.85)/2.2;
Delta_theta_65M4Sample1 = (360*dispVib65M4Sample1/18.85)/1.15;
Delta_theta_65M4Sample2 = (360*dispVib65M4Sample2/18.85)/2;
Delta_theta_65M4Sample3 = (360*dispVib65M4Sample3/18.85)/1.8;

set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig=figure('units','inch','position',[0,0,3,2.5]); hold on; grid on; set(gca,'FontSize',8);p1a = plot(tempCam65M0Sample1_Interp(206338:223000),Delta_theta_65M0Sample1(206338:223000)-Delta_theta_65M0Sample1(206338),':','Color',[0.6350, 0.0780, 0.1840],'LineWidth',2.5)    
 p1b = plot(tempCam65M4Sample1_Interp(97901:115245),Delta_theta_65M4Sample1(97901:115245)-Delta_theta_65M4Sample1(97901),'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)
   
p2a = plot(tempCam65M0Sample2_Interp(130161:144000),Delta_theta_65M0Sample2(130161:144000)-Delta_theta_65M0Sample2(130161),':','Color',[0.6350, 0.0780, 0.3],'LineWidth',2.5)    
p2b = plot(tempCam65M4Sample2_Interp(183770:198277),Delta_theta_65M4Sample2(183770:198277)-Delta_theta_65M4Sample2(183770),'--','Color',[0.3010 0.7450 0.5],'LineWidth',2.5)

p3a = plot(tempCam65M0Sample3_Interp(136201:151229),Delta_theta_65M0Sample3(136201:151229)-Delta_theta_65M0Sample3(136201),':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)    
p3b = plot(tempCam65M4Sample3_Interp(269767:284701),Delta_theta_65M4Sample3(269767:284701)-Delta_theta_65M4Sample3(269767),'--','Color',[0.3010 0.950 0.5],'LineWidth',2.5)


 xlabel('Temperature, ($$^{\circ}C$$)')
 ylabel('Angular Displacement, ($$^{\circ}$$/cm)')
%  
%  title('STPA with a 75$$^{\circ}$$ Pitch Angle')
  legend([p1a p2a p2b p3a p3b],'Sample 1 M(%) = 0'...
     ,...
     'Sample 2 M(%) = 0','Sample 2 M(%) = 4','Sample 3 M(%) = 0','Sample 3 M(%) = 4')


fig1=figure; hold on; grid on; set(gca,'FontSize',20);
[AX1,H1,H2] = plotyy(timeVib65M4Sample3(1:end),Delta_theta_65M4Sample3(1:end)-Delta_theta_65M4Sample3(1)...
    ,timeVib65M4Sample3(1:end),tempCam65M4Sample3_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
% title('Torsional displacement')
% legend('Torque','Temperature','Location','Northwest')
grid on 

fig2=figure; hold on; grid on; set(gca,'FontSize',20);
[AX1,H1,H2] = plotyy(timeVib65M4Sample1(1:end),Delta_theta_65M4Sample1(1:end)-Delta_theta_65M4Sample1(1)...
    ,timeVib65M4Sample1(1:end),tempCam65M4Sample1_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
% title('Blocked torque for a 65 degrees PA TPA (Trial 1)')
% legend('Torque','Temperature','Location','Northwest')
grid on 

TempAve = [25:5:80];


Delta_theta_65M0Sample1Stat = interp1(tempCam65M0Sample1_Interp(206338:223000),...
    Delta_theta_65M0Sample1(206338:223000)-Delta_theta_65M0Sample1(206338),TempAve);
 Delta_theta_65M4Sample1Stat = interp1(tempCam65M4Sample1_Interp(97901:115245),...
     Delta_theta_65M4Sample1(97901:115245)-Delta_theta_65M4Sample1(97901),TempAve);
  Delta_theta_65M4Sample1Stat = [NaN   -0.2034    0.0322   -0.5907   -2.508...
      -3.6169   -6.9168   -9.6455  -11.9033  -13.6787  -15.1011 NaN]
Delta_theta_65M0Sample2Stat = interp1(tempCam65M0Sample2_Interp(130161:144000),...
    Delta_theta_65M0Sample2(130161:144000)-Delta_theta_65M0Sample2(130161),TempAve);
Delta_theta_65M4Sample2Stat = interp1(tempCam65M4Sample2_Interp(183770:198277),...
    Delta_theta_65M4Sample2(183770:198277)-Delta_theta_65M4Sample2(183770),TempAve);

Delta_theta_65M0Sample3Stat = interp1(tempCam65M0Sample3_Interp(136201:151229),...
    Delta_theta_65M0Sample3(136201:151229)-Delta_theta_65M0Sample3(136201),TempAve);
Delta_theta_65M4Sample3Stat = interp1(tempCam65M4Sample3_Interp(269767:284701),...
    Delta_theta_65M4Sample3(269767:284701)-Delta_theta_65M4Sample3(269767),TempAve);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig=figure('units','inch','position',[0,0,3,2.5]); hold on; grid on; set(gca,'FontSize',8);

% p1a = plot(tempCam65M0Sample1_Interp(206338:223000),Delta_theta_65M0Sample1(206338:223000)-Delta_theta_65M0Sample1(206338),':','Color',[0.6350, 0.0780, 0.1840],'LineWidth',2.5)    
p1a = plot(TempAve,Delta_theta_65M0Sample1Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
 p1b = plot(TempAve,Delta_theta_65M4Sample1Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)
   
p2a = plot(TempAve,Delta_theta_65M0Sample2Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
p2b = plot(TempAve,Delta_theta_65M4Sample2Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)

p3a = plot(TempAve,Delta_theta_65M0Sample3Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
p3b = plot(TempAve,Delta_theta_65M4Sample3Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)
xlim([30 81.5])
 ylim([-30.5 2])
 
 
xlabel('Temperature (\circC)')
 ylabel('Angular Displacement (\circ/cm)')
 leg = legend([p1a p1b],'Three STPAs at M = 0%'...
     ,'Three STPAs at M = 4%','location','southeast')
leg.ItemTokenSize = [11,20];
grid on 
set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'65deg Actuation.png','-dpng','-r700'); 
 grid on 
 
 
 
 n = 1;
for i = 1:length(Delta_theta_65M0Sample3Stat)
    Delta_theta_65M0_calulate = [Delta_theta_65M0Sample1Stat(i),Delta_theta_65M0Sample2Stat(i),Delta_theta_65M0Sample3Stat(i)];
   Delta_theta_65M0_mean(n) = mean(Delta_theta_65M0_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_65M0_mean(i) = Delta_theta_65M0_mean(n);
   SEM_Delta_theta_65M0(n) = std(Delta_theta_65M0_calulate)/sqrt(length(Delta_theta_65M0_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_65M0 = tinv([0.025 0.975], length(Delta_theta_65M0_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_65M0 = bsxfun(@times, SEM_Delta_theta_65M0, CI95_Delta_theta_65M0(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’


 n = 1;
for i = 1:length(Delta_theta_65M4Sample3Stat)
    Delta_theta_65M4_calulate = [Delta_theta_65M4Sample1Stat(i),Delta_theta_65M4Sample2Stat(i),Delta_theta_65M4Sample3Stat(i)];
   Delta_theta_65M4_mean(n) = mean(Delta_theta_65M4_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_65M4_mean(i) = Delta_theta_65M4_mean(n);
   SEM_Delta_theta_65M4(n) = std(Delta_theta_65M4_calulate)/sqrt(length(Delta_theta_65M4_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_65M4 = tinv([0.025 0.975], length(Delta_theta_65M4_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_65M4 = bsxfun(@times, SEM_Delta_theta_65M4, CI95_Delta_theta_65M4(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’

figmean =figure; hold on; grid on; set(gca,'FontSize',20);
 
%  plot(p100_2,Strain100_mean,'r','Linewidth',1.5);hold on; plot(p100_2, yCI95+Strain100_mean)
 a = errorbar(TempAve,Delta_theta_65M0_mean(1:12),yCI95_Delta_theta_65M0(2,(1:12)),'-.','LineWidth',1.5,'Color',[0.6350, 0.380, 0.3])
 b = errorbar(TempAve,Delta_theta_65M4_mean(1:12),yCI95_Delta_theta_65M4(2,(1:12)),':','LineWidth',1.5,'Color',[0,0.7,0.9])


 xlim([25 85])
 ylim([-22 2])
 
 legend([a b],'25$$^{\circ}$$ STPA at M = 0$$\%$$','25$$^{\circ}$$ STPA at M = 4$$\%$$')

xlabel('Temperature ($$^{\circ}C$$)')
 ylabel('Angular Displacement  ($$^{\circ}$$/cm)')
 
 grid on 