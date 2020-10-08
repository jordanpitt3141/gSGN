% Process Fortran Outputs

clc;
clear all;
close all;

% Get list of directories to loop over when reading data
wdir = "./Validation/Forced/Run/1sNoLim/"


OutEps = importdata(strcat(wdir, 'Norms.dat'));
dxseps = OutEps(:,1);
Normhseps = OutEps(:,2);
NormGseps = OutEps(:,3);
Normuseps = OutEps(:,4);

figure;
loglog(dxseps,Normhseps,'s b',dxseps,NormGseps,'o r',dxseps,Normuseps,'^ k',dxseps,0.1*dxseps.^2,'-',dxseps,0.1*dxseps.^1,'-')
grid off
legend('hide')
xlabel('\Delta x')
ylabel('L_2')
% axis([10^-4 10 10^-8 10^2]);
% xticks([10^-4,10^-3,10^-2,10^-1,10^0,10]);
% yticks([10^-8,10^-6,10^-4,10^-2,1,10^2]);
% matlab2tikz('NormResults.tex');



