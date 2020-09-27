% Process Fortran Outputs

clc;
clear all;
close all;

% Get list of directories to loop over when reading data
%wdir = "/home/jp/Documents/Work/PostDoc/Projects/Steve/1DWaves/RegularisedSerre/Data/RAW/Models/gSGNForcedLimAll/ConstantBeta/AnaSolDBLoop/theta1/08/";
%wdir = "/home/jp/Documents/Work/PostDoc/Projects/Steve/1DWaves/RegularisedSerre/Data/RAW/Models/SWWE/AnaSolDBLoop/theta1/07/"

wdir = "/home/jp/Documents/Work/PostDoc/Projects/Steve/1DWaves/RegularisedSerre/Data/RAW/Models/gSGNForcedLimAll/Validation/AnalyticSolutions/DBSWWE/"

scenbeg = -250;
scenend = 250;

kstart = 0;
ksep = 1;
kend = 7;
figure;
hold on;
for k = kstart:ksep:kend
    BetaNumStr = compose("%2.2d",k);
    expdir = strcat(wdir,BetaNumStr,'/');
    
    param = fileread(strcat(expdir ,'Params.dat' ));
    
    str1 = extractBetween(param,"dx","tstart");
    dx = str2double(str1 {1,1});

    str1 = extractBetween(param,"beta1","beta2");
    beta1 = str2double(str1 {1,1});

    str1 = extractAfter(param,"beta2 :");
    beta2 = str2double(str1 );
    
    linestart = -95;
    lineend = -60;
    linestarti = round(((linestart - scenbeg)/dx));
    lineendi = round(((lineend - scenbeg)/dx));
    linesep = 1;

   
    End = importdata(strcat(expdir,'End.dat' ));
    
    t = End(1,1);
    x = End(linestarti:linesep:lineendi,2);
    h = End(linestarti:linesep:lineendi,3);
    G = End(linestarti:linesep:lineendi,4);
    u = End(linestarti:linesep:lineendi,5);

    plot(x,h,'-','DisplayName',strcat('dx=',num2str(dx)));
    
end

EndA = importdata(strcat(expdir,'EndAna.dat' ));
tA = EndA(1,1);
xA = EndA(linestarti:linesep:lineendi,2);
hA = EndA(linestarti:linesep:lineendi,3);
GA = EndA(linestarti:linesep:lineendi,4);
uA = EndA(linestarti:linesep:lineendi,5);

plot(xA,hA,'--k','DisplayName','SWWE Dambreak Solution');

xlabel('x (m)');
ylabel('h (m)');

axis([-90 -70 1.452 1.47])
xticks([-90,-88, -86, -84, -82, -80,-78,-76,-74,-72,-70]);
yticks([1.452,1.454,1.456,1.458,1.460,1.462,1.464,1.466,1.468,1.47]);
legend('hide')
hold off

matlab2tikz('hRFBot.tex');