%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

timesteps = 10000;
nrOfSimulations = 5;
InitializeSimulation;
InitializeFigure;

averagePopulations = zeros([3 timesteps]);
for j = 1:nrOfSimulations
    populations = zeros([3 timesteps]);
    for i = 1:timesteps
        %fprintf("%g\n",i)
        %pause(0.05)
        agents = UpdateAgentsPosition(agents,environment);
        [agents,environment] = UpdateAgentsPopulation(agents,environment);
        agents = UpdateAgentsAngle(agents,environment);
        agents = UpdateAgentsVelocity(agents);
        RegisterPopulation;
    %     UpdateFigure;
    end
    
    averagePopulations = averagePopulations + populations;
    %UpdateFigure
    PopulationFigure;
end
averagePopulations = averagePopulations./nrOfSimulations;
AvaragePopulationFigure;
