%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

timesteps = 200000;
nrOfSimulations = 1;

averagePopulations = zeros([3 timesteps]);
averageCatch = zeros([3 timesteps]); % [(per dt),(total so far),(total so far / #dt)]
for j = 1:nrOfSimulations
    InitializeSimulation;
    InitializeFigure;
    populations = zeros([3 timesteps]);
    fishCatch = zeros([3 timesteps]); % [(per dt),(total so far),(total so far / #dt)]
    for i = 1:timesteps
        %fprintf("%g\n",i)
        %pause(0.05)
        agents = UpdateAgentsPosition(agents,environment);
        [agents,environment,catchPerDt] = UpdateAgentsPopulation(agents,environment);
        fishCatch(1,i) = catchPerDt;
        agents = UpdateAgentsAngle(agents,environment);
        agents = UpdateAgentsVelocity(agents);
        RegisterPopulation;
%         UpdateFigure;
    end
    
    fishCatch(2,1) = fishCatch(1,1);
    fishCatch(3,1) = fishCatch(1,1);
    for i = 2:timesteps
        fishCatch(2,i) = fishCatch(2,i-1) + fishCatch(1,i);
        fishCatch(3,i) = fishCatch(2,i)/i;
    end
    
    averagePopulations = averagePopulations + populations;
    averageCatch = averageCatch + fishCatch;
    %UpdateFigure
    PopulationFigure;
    CatchFigure
end
averagePopulations = averagePopulations./nrOfSimulations;
averageCatch = averageCatch./nrOfSimulations;
AveragePopulationFigure;
AverageCatchFigure;
