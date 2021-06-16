
clear all
clc
close all


% 75 Degrees 0%Moisture Sample 1 
      filename = '75 deg 0M Sample 1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M0Sample1 = Data(1:end,1);
    dispVib75M0Sample1 = Data(1:end,2);
    timeCam75M0Sample1 = Data(1:1813,3);
    tempCam75M0Sample1 = Data(1:1813,4);
    
% 75 Degrees 0%Moisture Sample 2 
      filename = '75 deg 0M Sample 2.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M0Sample2 = Data(1:end,1);
    dispVib75M0Sample2 = Data(1:end,2);
    timeCam75M0Sample2 = Data(1:1393,3);
    tempCam75M0Sample2 = Data(1:1393,4);
    
    % 75 Degrees 0%Moisture Sample 3 
      filename = '75 deg 0M Sample 3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M0Sample3 = Data(1:end,1);
    dispVib75M0Sample3 = Data(1:end,2);
    timeCam75M0Sample3 = Data(1:1891,3);
    tempCam75M0Sample3 = Data(1:1891,4);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % 75 Degrees 4%Moisture Sample 1 
      filename = '75 deg 3.1M Sample1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M4Sample1 = Data(1:end,1);
    dispVib75M4Sample1 = Data(1:end,2);
    timeCam75M4Sample1 = Data(1:3000,3);
    tempCam75M4Sample1 = Data(1:3000,4);
    
% 75 Degrees 4%Moisture Sample 2 
      filename = '75 deg 3.1M Sample2.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M4Sample2 = Data(1:end,1);
    dispVib75M4Sample2 = Data(1:end,2);
    timeCam75M4Sample2 = Data(1:1573,3);
    tempCam75M4Sample2 = Data(1:1573,4);
    
    % 75 Degrees 4%Moisture Sample 3 
      filename = '75 deg 3.1M Sample3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib75M4Sample3 = Data(1:end,1);
    dispVib75M4Sample3 = Data(1:end,2);
    timeCam75M4Sample3 = Data(1:2589,3);
    tempCam75M4Sample3 = Data(1:2589,4);   
    
    
  tempCam75M0Sample1_Interp =interp1(timeCam75M0Sample1,tempCam75M0Sample1,timeVib75M0Sample1);  
  tempCam75M0Sample2_Interp =interp1(timeCam75M0Sample2,tempCam75M0Sample2,timeVib75M0Sample2);  
  tempCam75M0Sample3_Interp =interp1(timeCam75M0Sample3,tempCam75M0Sample3,timeVib75M0Sample3);  
  tempCam75M4Sample1_Interp =interp1(timeCam75M4Sample1,tempCam75M4Sample1,timeVib75M4Sample1);  
  tempCam75M4Sample2_Interp =interp1(timeCam75M4Sample2,tempCam75M4Sample2,timeVib75M4Sample2);  
  tempCam75M4Sample3_Interp =interp1(timeCam75M4Sample3,tempCam75M4Sample3,timeVib75M4Sample3);
    
%Conversion to degrees and torque to N/mm
L0 = 17.5; %mm
D = 0.89; %mm
R = D/2; %mm

%Perimeter of the spool = 2*pi*3 mm = 18.85 mm 

Delta_theta_75M0Sample1 = (360*dispVib75M0Sample1/18.85)/2.1;
Delta_theta_75M0Sample2 = (360*dispVib75M0Sample2/18.85)/2.9;
Delta_theta_75M0Sample3 = (360*dispVib75M0Sample3/18.85)/2.2;
Delta_theta_75M4Sample1 = (360*dispVib75M4Sample1/18.85)/1.5;
Delta_theta_75M4Sample2 = (360*dispVib75M4Sample2/18.85)/1.8;
Delta_theta_75M4Sample3 = (360*dispVib75M4Sample3/18.85)/1.7;

set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');






 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig5=figure; hold on; grid on; set(gca,'FontSize',20);
p1a = plot(tempCam75M0Sample1_Interp(122401:135352),Delta_theta_75M0Sample1(122401:135352)-Delta_theta_75M0Sample1(122401),':','Color',[0.6350, 0.0780, 0.1840],'LineWidth',2.5)    
% p1b = plot(tempCam75M4Sample1_Interp(312584:323700),Delta_theta_75M4Sample1(312584:323700)-Delta_theta_75M4Sample1(312584),'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)
p1b = plot(tempCam75M4Sample1_Interp(162688:181182),Delta_theta_75M4Sample1(162688:181182)-Delta_theta_75M4Sample1(162688),'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)
   
p2a = plot(tempCam75M0Sample2_Interp(121360:132127),Delta_theta_75M0Sample2(121360:132127)-Delta_theta_75M0Sample2(121360),':','Color',[0.6350, 0.0780, 0.3],'LineWidth',2.5)    
p2b = plot(tempCam75M4Sample2_Interp(148302:162347),Delta_theta_75M4Sample2(148302:162347)-Delta_theta_75M4Sample2(148302),'--','Color',[0.3010 0.7450 0.5],'LineWidth',2.5)

p3a = plot(tempCam75M0Sample3_Interp(88480:99085),Delta_theta_75M0Sample3(88480:99085)-Delta_theta_75M0Sample3(88480),':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)    
p3b = plot(tempCam75M4Sample3_Interp(187671:202438),Delta_theta_75M4Sample3(187671:202438)-Delta_theta_75M4Sample3(187671),'--','Color',[0.3010 0.950 0.5],'LineWidth',2.5)


 xlabel('Temperature, ($$^{\circ}C$$)')
 ylabel('Angular Displacement, ($$^{\circ}$$/cm)')
%  
%  title('STPA with a 75$$^{\circ}$$ Pitch Angle')
  legend([p1a p1b p2a p2b p3a p3b],'Sample 1 M(%) = 0'...
     ,'Sample 1 M(%) = 4',...
     'Sample 2 M(%) = 0','Sample 2 M(%) = 4','Sample 3 M(%) = 0','Sample 3 M(%) = 4')


fig1=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(timeVib75M0Sample3(1:end),Delta_theta_75M0Sample3(1:end)-dispVib75M0Sample3(1)...
    ,timeVib75M0Sample3(1:end),tempCam75M0Sample3_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
title('Torsional displacement')
legend('Torque','Temperature','Location','Northwest')
grid on 


fig2=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(timeVib75M4Sample1(1:end),Delta_theta_75M4Sample1(1:end)-dispVib75M4Sample1(1)...
    ,timeVib75M4Sample1(1:end),tempCam75M4Sample1_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
% 
% % ylim(AX1(1),[-50 150])
%  ylim(AX1(2),[20 120])
% % AX1(1).YTick = [0:5:50];
%  AX1(2).YTick = [0:20:120];
% % AX1(1).XLim = [0 1500];
% % AX1(2).XLim = [0 1500];
title('Blocked torque for a 75 degrees PA TPA (Trial 1)')
legend('Torque','Temperature','Location','Northwest')
grid on 

TempAve = [25:5:75];


Delta_theta_75M0Sample1Stat = interp1(tempCam75M0Sample1_Interp(122401:135352),...
    Delta_theta_75M0Sample1(122401:135352)-Delta_theta_75M0Sample1(122401),TempAve);
Delta_theta_75M4Sample1Stat = interp1(tempCam75M4Sample1_Interp(312584:323700),...
    Delta_theta_75M4Sample1(312584:323700)-Delta_theta_75M4Sample1(312584),TempAve);

Delta_theta_75M0Sample2Stat = interp1(tempCam75M0Sample2_Interp(121360:132127),...
    Delta_theta_75M0Sample2(121360:132127)-Delta_theta_75M0Sample2(121360),TempAve);
Delta_theta_75M4Sample2Stat = interp1(tempCam75M4Sample2_Interp(148302:162347),...
    Delta_theta_75M4Sample2(148302:162347)-Delta_theta_75M4Sample2(148302),TempAve);

Delta_theta_75M0Sample3Stat = interp1(tempCam75M0Sample3_Interp(88480:99085),...
    Delta_theta_75M0Sample3(88480:99085)-Delta_theta_75M0Sample3(88480),TempAve);
Delta_theta_75M4Sample3Stat = interp1(tempCam75M4Sample3_Interp(187671:202438),...
    Delta_theta_75M4Sample3(187671:202438)-Delta_theta_75M4Sample3(187671),TempAve);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig=figure('units','inch','position',[0,0,3,2.5]); hold on; grid on; set(gca,'FontSize',8);
p1a = plot(TempAve,Delta_theta_75M0Sample1Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
%   p1b = plot(TempAve,Delta_theta_75M4Sample1Stat-Delta_theta_75M4Sample1Stat(2),'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)
   
p2a = plot(TempAve,Delta_theta_75M0Sample2Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
p2b = plot(TempAve,Delta_theta_75M4Sample2Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)

% p3a = plot(TempAve,Delta_theta_75M0Sample3Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)    
 p3b = plot(TempAve,Delta_theta_75M4Sample3Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)

 xlim([30 80])
  ylim([-30.5 2])

xlabel('Temperature (\circC)')
 ylabel('Angular Displacement (\circ/cm)')
leg = legend([p1a p2b],'Two STPAs at M = 0%'...
     ,'Two STPAs at M = 4%','location','southeast')
 
 leg.ItemTokenSize = [11,20];
grid on 
set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'75deg Actuation.png','-dpng','-r700'); 
 grid on 

 n = 1;
for i = 1:length(Delta_theta_75M0Sample3Stat)
    Delta_theta_75M0_calulate = [Delta_theta_75M0Sample1Stat(i),Delta_theta_75M0Sample2Stat(i)];
   Delta_theta_75M0_mean(n) = mean(Delta_theta_75M0_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_75M0_mean(i) = Delta_theta_75M0_mean(n);
   SEM_Delta_theta_75M0(n) = std(Delta_theta_75M0_calulate)/sqrt(length(Delta_theta_75M0_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_75M0 = tinv([0.025 0.975], length(Delta_theta_75M0_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_75M0 = bsxfun(@times, SEM_Delta_theta_75M0, CI95_Delta_theta_75M0(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’


 n = 1;
for i = 1:length(Delta_theta_75M4Sample3Stat)
    Delta_theta_75M4_calulate = [Delta_theta_75M4Sample2Stat(i),Delta_theta_75M4Sample2Stat(i),Delta_theta_75M4Sample3Stat(i)];
   Delta_theta_75M4_mean(n) = mean(Delta_theta_75M4_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_75M4_mean(i) = Delta_theta_75M4_mean(n);
   SEM_Delta_theta_75M4(n) = std(Delta_theta_75M4_calulate)/sqrt(length(Delta_theta_75M4_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_75M4 = tinv([0.025 0.975], length(Delta_theta_75M4_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_75M4 = bsxfun(@times, SEM_Delta_theta_75M4, CI95_Delta_theta_75M4(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’

figmean =figure; hold on; grid on; 
 
%  plot(p100_2,Strain100_mean,'r','Linewidth',1.5);hold on; plot(p100_2, yCI95+Strain100_mean)
 a = errorbar(TempAve,Delta_theta_75M0_mean(1:10),yCI95_Delta_theta_75M0(2,(1:10)),'-.','LineWidth',1.5,'Color',[0 0.4470 0.7410])
 b = errorbar(TempAve,Delta_theta_75M4_mean(1:10),yCI95_Delta_theta_75M4(2,(1:10)),':','LineWidth',1.5,'Color',[0,0.7,0.9])


 xlim([25 85])
 ylim([-10 2])
 
 legend([a b],'75 deg STPA at M = 0%','75 deg STPA at M = 4%')

xlabel('Temperature, ($$^{\circ}C$$)')
 ylabel('Angular Displacement  ($$^{\circ}$$/cm)')
 
 grid on 