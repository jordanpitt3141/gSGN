% Process Fortran Outputs

clc;
clear all;
close all;

% Get list of directories to loop over when reading data

expwdir = '/home/jp/Documents/Work/PostDoc/Projects/Steve/1DWaves/RegularisedSerre/Data/RAW/Models/gSGNForcedLimhG/VaryBeta/Reg2/SmoothDB/alpha0p1/timeseries/06/';

figure;

linesep = 10;
u2 = 1.30584;
h2 = 1.45384;
ga = 9.81;


endfile = strcat(expwdir, 'EndVals.dat' );
endanafile = strcat(expwdir, 'EndAnaVals.dat' );
paramfile = strcat(expwdir, 'Params.dat' );

xhGuend = importdata(endfile);
xhGuendana = importdata(endanafile);
param = fileread(paramfile);

beta1 = extractBetween(param,"beta1 : ","beta2");
beta1val = str2double(beta1{1,1});
beta2 = extractAfter(param,"beta2 :");
beta2val = str2double(beta2);

endtime = extractBetween(param,"time :","dt");
endtimeval = str2double(endtime);

x1 = xhGuend(:,1);
h1 = xhGuend(:,2);
u1 = xhGuend(:,4);

hl = 2;
Regionhl1lb = (- sqrt(ga*hl)*sqrt(beta2val/ (2.0/3.0 + beta1val)))*endtimeval
Regionhl2lb = (- sqrt(ga*hl))*endtimeval

Region1lb = -250;
Region1ub = (u2 - sqrt(ga*h2)*sqrt(beta2val/ (2.0/3.0 + beta1val)))*endtimeval;
Region2ub = (u2 - sqrt(ga*h2))*endtimeval;
Region3ub = (u2)*endtimeval;
Region4ub = (u2 + sqrt(ga*h2))*endtimeval;
Region5ub = (u2 + sqrt(ga*h2)*sqrt(beta2val/ (2.0/3.0 + beta1val)))*endtimeval;
Region6ub = 250;

ymin = 0.5
ymax = 2.5
x2 = [[Region1lb Region1lb],fliplr([Region1ub Region1ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'b','facealpha',.1,'LineStyle','--');
hold on

x2 = [[Region1ub Region1ub],fliplr([Region2ub Region2ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'r','facealpha',.1,'LineStyle','none');

x2 = [[Region2ub Region2ub],fliplr([Region3ub Region3ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'g','facealpha',.1,'LineStyle','--');

x2 = [[Region3ub Region3ub],fliplr([Region4ub Region4ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'g','facealpha',.1,'LineStyle','none');

x2 = [[Region4ub Region4ub],fliplr([Region5ub Region5ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'r','facealpha',.1,'LineStyle','--');

x2 = [[Region5ub Region5ub],fliplr([Region6ub Region6ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'b','facealpha',.1,'LineStyle','none');

plot([Regionhl1lb Regionhl1lb], [-3 3], '--r');
plot([Regionhl2lb Regionhl2lb], [-3 3], '--g');

plot(x1(1:linesep:end),h1(1:linesep:end),'-b','DisplayName',strcat("\beta_1 = ",num2str(beta1val,2), "  \beta_2 = ",num2str(beta2val,2)));

hold off;

legend('hide');
xlabel('x (m)');
ylabel('h (m)');
axis([-250 250 ymin ymax]);
xticks([-250,-125,0,125,250]);
yticks([0.5,1,1.5,2,2.5]);

figstr = strcat('RegionhPlotBetaReg2.tex')
% matlab2tikz(figstr);

% clc;
% close all;

figure;
ymin = -3
ymax = 3
x2 = [[Region1lb Region1lb],fliplr([Region1ub Region1ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'b','facealpha',.1,'LineStyle','--');
hold on

x2 = [[Region1ub Region1ub],fliplr([Region2ub Region2ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'r','facealpha',.1,'LineStyle','none');

x2 = [[Region2ub Region2ub],fliplr([Region3ub Region3ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'g','facealpha',.1,'LineStyle','--');

x2 = [[Region3ub Region3ub],fliplr([Region4ub Region4ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'g','facealpha',.1,'LineStyle','none');

x2 = [[Region4ub Region4ub],fliplr([Region5ub Region5ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'r','facealpha',.1,'LineStyle','--');

x2 = [[Region5ub Region5ub],fliplr([Region6ub Region6ub])];
inBetween = [[ymin ymax], fliplr([ymin ymax])];
fill(x2, inBetween, 'b','facealpha',.1,'LineStyle','none');

plot(x1(1:linesep:end),u1(1:linesep:end),'-b','DisplayName',strcat("\beta_1 = ",num2str(beta1val,2), "  \beta_2 = ",num2str(beta2val,2)));

hold off;

legend('hide');
xlabel('x (m)');
ylabel('u (m/s)');
axis([-250 250 ymin ymax]);
xticks([-250,-125,0,125,250]);
yticks([-3,-2,-1,0,1,2,3]);

figstr = strcat('RegionuPlotBetaReg2.tex')
% matlab2tikz(figstr);









