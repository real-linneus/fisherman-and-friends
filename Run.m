%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

timesteps = 10000;
InitializeSimulation;
InitializeFigure;

populations = zeros([3 timesteps]);

for i = 1:timesteps
    fprintf("%g\n",i)
% %     pause(0.05)
    agents = UpdateAgentsPosition(agents,environment);
    [agents,environment] = UpdateAgentsPopulation(agents,environment);
    agents = UpdateAgentsAngle(agents,environment);
    agents = UpdateAgentsVelocity(agents);
    RegisterPopulation;
%     UpdateFigure;
end
UpdateFigure
PopulationFigure;
