%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

timesteps = 100;
nrOfSimulations = 1;
fishingTimeout = 200; %which frequens (in steps of 1000) to paus fishing

InitializeSimulation;
InitializeFigure;
h = figure(1);
v = VideoWriter('findingnemo.mp4','MPEG-4');
v.FrameRate = 15;
v.Quality = 100;
open(v);
populations = zeros([3 timesteps]);
fishCatch = zeros([3 timesteps]); % [(per dt),(total so far),(total so far / #dt)]
for i = 1:timesteps
    %fprintf("%g\n",i)
    %pause(0.05)
    agents = UpdateAgentsPosition(agents,environment);
    [agents,environment,catchPerDt] = UpdateAgentsPopulation(agents,environment);
    fishCatch(1,i) = catchPerDt;
    agents = UpdateAgentsAngle(agents,environment,i,fishingTimeout);
    agents = UpdateAgentsVelocity(agents);
    RegisterPopulation;
    UpdateFigure;
    H=getframe(h);
    writeVideo(v,H); 
end
close(v)
