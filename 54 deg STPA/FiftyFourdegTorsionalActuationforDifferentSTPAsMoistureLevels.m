
clear all
clc
close all


% 54 Degrees 0%Moisture Sample 1 
      filename = '54 deg 0M Sample1  3 more cycles.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M0Sample1 = Data(1:end,1);
    dispVib54M0Sample1 = Data(1:end,2);
    timeCam54M0Sample1 = Data(1:1423,3);
    tempCam54M0Sample1 = Data(1:1423,4);
    
% 54 Degrees 0%Moisture Sample 2 
      filename = '54 deg 0M Sample2   try1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M0Sample2 = Data(1:end,1);
    dispVib54M0Sample2 = Data(1:end,2);
    timeCam54M0Sample2 = Data(1:2058,3);
    tempCam54M0Sample2 = Data(1:2058,4);
    
    % 54 Degrees 0%Moisture Sample 3 
      filename = '54 deg 0M Sample3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M0Sample3 = Data(1:end,1);
    dispVib54M0Sample3 = Data(1:end,2);
    timeCam54M0Sample3 = Data(1:2117,3);
    tempCam54M0Sample3 = Data(1:2117,4);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % 54 Degrees 4%Moisture Sample 1 
      filename = '54 deg 3.1M Sample1.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M4Sample1 = Data(1:end,1);
    dispVib54M4Sample1 = Data(1:end,2);
    timeCam54M4Sample1 = Data(1:2586,3);
    tempCam54M4Sample1 = Data(1:2586,4);
    
% 54 Degrees 4%Moisture Sample 2 
      filename = '54 deg 3.1M Sample2.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M4Sample2 = Data(1:end,1);
    dispVib54M4Sample2 = Data(1:end,2);
    timeCam54M4Sample2 = Data(1:2459,3);
    tempCam54M4Sample2 = Data(1:2459,4);
    
    % 54 Degrees 4%Moisture Sample 3 
      filename = '54 deg 3.1M Sample3.xlsx';
    sheet = 'Sheet1';
    Data = xlsread(filename, sheet,'A:D');
    
    timeVib54M4Sample3 = Data(1:end,1);
    dispVib54M4Sample3 = Data(1:end,2);
    timeCam54M4Sample3 = Data(1:2239,3);
    tempCam54M4Sample3 = Data(1:2239,4);  
    
    
  tempCam54M0Sample1_Interp =interp1(timeCam54M0Sample1,tempCam54M0Sample1,timeVib54M0Sample1);  
  tempCam54M0Sample2_Interp =interp1(timeCam54M0Sample2,tempCam54M0Sample2,timeVib54M0Sample2);  
  tempCam54M0Sample3_Interp =interp1(timeCam54M0Sample3,tempCam54M0Sample3,timeVib54M0Sample3);  
  tempCam54M4Sample1_Interp =interp1(timeCam54M4Sample1,tempCam54M4Sample1,timeVib54M4Sample1);  
  tempCam54M4Sample2_Interp =interp1(timeCam54M4Sample2,tempCam54M4Sample2,timeVib54M4Sample2);  
  tempCam54M4Sample3_Interp =interp1(timeCam54M4Sample3,tempCam54M4Sample3,timeVib54M4Sample3);
    
%Conversion to degrees and torque to N/mm
L0 = 17.5; %mm
D = 0.89; %mm
R = D/2; %mm

%Perimeter of the spool = 2*pi*3 mm = 18.85 mm 

Delta_theta_54M0Sample1 = (360*dispVib54M0Sample1/18.85)/2.2;
Delta_theta_54M0Sample2 = (360*dispVib54M0Sample2/18.85)/2;
Delta_theta_54M0Sample3 = (360*dispVib54M0Sample3/18.85)/2.2;
Delta_theta_54M4Sample1 = (360*dispVib54M4Sample1/18.85)/1.8;
Delta_theta_54M4Sample2 = (360*dispVib54M4Sample2/18.85)/2.1;
Delta_theta_54M4Sample3 = (360*dispVib54M4Sample3/18.85)/2;

set(groot, 'DefaultTextInterpreter', 'tex', ...
           'DefaultAxesTickLabelInterpreter', 'tex', ...
           'DefaultAxesFontName', 'tex', ...
           'DefaultLegendInterpreter', 'tex', ...
           'defaultFigureColor','w');





 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig5=figure; hold on; grid on; set(gca,'FontSize',20);
p1a = plot(tempCam54M0Sample1_Interp(85097:99601),Delta_theta_54M0Sample1(85097:99601)-Delta_theta_54M0Sample1(85097),':','Color',[0.6350, 0.0780, 0.1840],'LineWidth',2.5)    
p1b = plot(tempCam54M4Sample1_Interp(274143:288592),Delta_theta_54M4Sample1(274143:288592)-Delta_theta_54M4Sample1(274143),'--','Color',[0.3010 0.7450 0.9330],'LineWidth',2.5)
   
p2a = plot(tempCam54M0Sample2_Interp(93500:108601),Delta_theta_54M0Sample2(93500:108601)-Delta_theta_54M0Sample2(93500),':','Color',[0.6350, 0.0780, 0.3],'LineWidth',2.5)    
p2b = plot(tempCam54M4Sample2_Interp(178935:193203),Delta_theta_54M4Sample2(178935:193203)-Delta_theta_54M4Sample2(178935),'--','Color',[0.3010 0.7450 0.5],'LineWidth',2.5)

p3a = plot(tempCam54M0Sample3_Interp(220805:230976),Delta_theta_54M0Sample3(220805:230976)-Delta_theta_54M0Sample3(220805),':','Color',[0.6350, 0.380, 0.3],'LineWidth',2.5)    
p3b = plot(tempCam54M4Sample3_Interp(165301:176142),Delta_theta_54M4Sample3(165301:176142)-Delta_theta_54M4Sample3(165301),'--','Color',[0.3010 0.950 0.5],'LineWidth',2.5)


 xlabel('Temperature, ($$^{\circ}C$$)')
 ylabel('Angular Displacement, ($$^{\circ}$$/cm)')
%  
%  title('STPA with a 75$$^{\circ}$$ Pitch Angle')
  legend([p1a p1b p2a p2b p3a p3b],'Sample 1 M(%) = 0'...
     ,'Sample 1 M(%) = 4',...
     'Sample 2 M(%) = 0','Sample 2 M(%) = 4','Sample 3 M(%) = 0','Sample 3 M(%) = 4')


fig1=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(timeVib54M0Sample3(1:end),Delta_theta_54M0Sample3(1:end)-dispVib54M0Sample2(1)...
    ,timeVib54M0Sample3(1:end),tempCam54M0Sample3_Interp(1:end)); hold on

xlabel(AX1(1),'$Time (s)$')
ylabel(AX1(1),'$$Torsional displacement$$')
ylabel(AX1(2),'Temperature ($$^{\circ}$$C)')
title('Torsional displacement')
legend('Torque','Temperature','Location','Northwest')
grid on 


fig2=figure; hold on; grid on; set(gca,'FontSize',20);


% subplot(1,1,1)

[AX1,H1,H2] = plotyy(timeVib54M4Sample3(1:end),Delta_theta_54M4Sample3(1:end)-dispVib54M4Sample3(1)...
    ,timeVib54M4Sample3(1:end),tempCam54M4Sample3_Interp(1:end)); hold on

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
title('Blocked torque for a 54 degrees PA TPA (Trial 1)')
legend('Torque','Temperature','Location','Northwest')
grid on 

TempAve = [25:5:80];


Delta_theta_54M0Sample1Stat = interp1(tempCam54M0Sample1_Interp(85097:99601),...
    Delta_theta_54M0Sample1(85097:99601)-Delta_theta_54M0Sample1(85097),TempAve);
Delta_theta_54M4Sample1Stat = interp1(tempCam54M4Sample1_Interp(274143:288592),...
    Delta_theta_54M4Sample1(274143:288592)-Delta_theta_54M4Sample1(274143),TempAve);

Delta_theta_54M0Sample2Stat = interp1(tempCam54M0Sample2_Interp(93500:108601),...
    Delta_theta_54M0Sample2(93500:108601)-Delta_theta_54M0Sample2(93500),TempAve);
Delta_theta_54M4Sample2Stat = interp1(tempCam54M4Sample2_Interp(178935:193203),...
    Delta_theta_54M4Sample2(178935:193203)-Delta_theta_54M4Sample2(178935),TempAve);

Delta_theta_54M0Sample3Stat = interp1(tempCam54M0Sample3_Interp(220805:230976),...
    Delta_theta_54M0Sample3(220805:230976)-Delta_theta_54M0Sample3(220805),TempAve);
Delta_theta_54M4Sample3Stat = interp1(tempCam54M4Sample3_Interp(165301:176142),...
    Delta_theta_54M4Sample3(165301:176142)-Delta_theta_54M4Sample3(165301),TempAve);



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
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
fig=figure('units','inch','position',[0,0,3,2.5]); hold on; grid on; set(gca,'FontSize',8);
p1a = plot(TempAve,Delta_theta_54M0Sample1Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
p1b = plot(TempAve,Delta_theta_54M4Sample1Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)
   
 p2a = plot(TempAve,Delta_theta_54M0Sample2Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
 p2b = plot(TempAve,Delta_theta_54M4Sample2Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)

p3a = plot(TempAve,Delta_theta_54M0Sample3Stat,':','Color',[0.6350, 0.380, 0.3],'LineWidth',1)    
p3b = plot(TempAve,Delta_theta_54M4Sample3Stat,'--','Color',[0.3010 0.7450 0.9330],'LineWidth',1)
xlim([30 80.5])
 ylim([-31 2])

xlabel('Temperature (\circC)')
 ylabel('Angular Displacement (\circ/cm)')
 leg = legend([p1a p1b],'Three STPAs at M = 0%'...
     ,'Three STPAs at M = 4%','location','southeast')
leg.ItemTokenSize = [11,20];
grid on 

set(gca,'GridColor',[0.1 0.2 0.9]) % a bluish color 
print(gcf,'54deg Actuation.png','-dpng','-r700'); 
 grid on 


 n = 1;
for i = 1:length(Delta_theta_54M0Sample3Stat)
    Delta_theta_54M0_calulate = [Delta_theta_54M0Sample1Stat(i),Delta_theta_54M0Sample2Stat(i),Delta_theta_54M0Sample3Stat(i)];
   Delta_theta_54M0_mean(n) = mean(Delta_theta_54M0_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_54M0_mean(i) = Delta_theta_54M0_mean(n);
   SEM_Delta_theta_54M0(n) = std(Delta_theta_54M0_calulate)/sqrt(length(Delta_theta_54M0_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_54M0 = tinv([0.025 0.975], length(Delta_theta_54M0_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_54M0 = bsxfun(@times, SEM_Delta_theta_54M0, CI95_Delta_theta_54M0(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’


 n = 1;
for i = 1:length(Delta_theta_54M4Sample3Stat)
    Delta_theta_54M4_calulate = [Delta_theta_54M4Sample1Stat(i),Delta_theta_54M4Sample2Stat(i),Delta_theta_54M4Sample3Stat(i)];
   Delta_theta_54M4_mean(n) = mean(Delta_theta_54M4_calulate) % Mean Of All Experiments At Each Value Of ‘x’
   Delta_theta_54M4_mean(i) = Delta_theta_54M4_mean(n);
   SEM_Delta_theta_54M4(n) = std(Delta_theta_54M4_calulate)/sqrt(length(Delta_theta_54M4_calulate)); % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
   n = n+1;
end
CI95_Delta_theta_54M4 = tinv([0.025 0.975], length(Delta_theta_54M4_calulate)-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95_Delta_theta_54M4 = bsxfun(@times, SEM_Delta_theta_54M4, CI95_Delta_theta_54M4(:)); % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’

figmean =figure; hold on; grid on; set(gca,'FontSize',20);
 
%  plot(p100_2,Strain100_mean,'r','Linewidth',1.5);hold on; plot(p100_2, yCI95+Strain100_mean)
 a = errorbar(TempAve,Delta_theta_54M0_mean(1:12),yCI95_Delta_theta_54M0(2,(1:12)),'-.','LineWidth',1.5,'Color',[0.6350, 0.380, 0.3])
 b = errorbar(TempAve,Delta_theta_54M4_mean(1:12),yCI95_Delta_theta_54M4(2,(1:12)),':','LineWidth',1.5,'Color',[0,0.7,0.9])


 xlim([25 85])
 ylim([-35 2])
 
 legend([a b],'36$$^{\circ}$$ STPA at M = 0$$\%$$','36$$^{\circ}$$ STPA at M = 4$$\%$$')

xlabel('Temperature ($$^{\circ}C$$)')
 ylabel('Angular Displacement  ($$^{\circ}$$/cm)')
 
 grid on 