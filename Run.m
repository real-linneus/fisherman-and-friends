%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

InitializeSimulation;
InitializeFigure;

for i = 1:300
    fprintf("%g\n",i)
%     pause(0.05)
    agents = UpdateAgentsPosition(agents,environment);
    agents = UpdateAgentsPopulation(agents,environment);
    agents = UpdateAgentsAngle(agents,environment);
    agents = UpdateAgentsVelocity(agents);
    UpdateFigure;
end
UpdateFigure
