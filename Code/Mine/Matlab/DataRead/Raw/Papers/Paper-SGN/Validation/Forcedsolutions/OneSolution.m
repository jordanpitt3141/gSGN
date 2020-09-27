% Process Fortran Outputs

clc;
clear all;
close all;

% Get list of directories to loop over when reading data
wdir = "/home/jp/Documents/Work/PostDoc/Projects/Steve/1DWaves/RegularisedSerre/gSGN/Code/Mine/Fortran/ExperimentCollections/OtherComputers/Validation/ForcedSolution/Experiment/Results/Validation/ForcedSolutions/test/06/";


End = importdata(strcat(wdir,'End.dat' ));
Init = importdata(strcat(wdir,'Init.dat' ));

t = End(:,1);
x = End(:,2);
h = End(:,3);
hA = End(:,4);
G = End(:,5);
GA = End(:,6);
u = End(:,7);
uA = End(:,8);


figure;
subplot(1,2,1);
plot(x,h,'-b',x,hA,'--k');
xlabel('x (m)');
ylabel('h (m)');

subplot(1,2,2);
plot(x,h - hA,'-r');
xlabel('x (m)');
ylabel('h - hA (m)');

figure;
subplot(1,2,1);
plot(x,u,'-b',x,uA,'--k');
xlabel('x (m)');
ylabel('u (m/s)');

subplot(1,2,2);
plot(x,u - uA,'-r');
xlabel('x (m)');
ylabel('u - uA (m/s)');



figure;
subplot(1,2,1);
plot(x,G,'-b',x,GA,'--k');
xlabel('x (m)');
ylabel('G (m/s)');

subplot(1,2,2);
plot(x,G - GA,'-r');
xlabel('x (m)');
ylabel('G - GA (m)');