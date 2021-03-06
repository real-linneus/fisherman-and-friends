%% Run program
clear all; close all; clc;
% set(0,'defaultFigureWindowStyle','docked')

timesteps = 100000;
nrOfSimulations = 1;
fishingTimeout = 300; %which frequens (in steps of 1000) to paus fishing

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
        catchPerDt = 0;
        if i > 5000
             [agents,environment,catchPerDt] = UpdateAgentsPopulation(agents,environment);
        end
        fishCatch(1,i) = catchPerDt;
        agents = UpdateAgentsAngle(agents,environment,i,fishingTimeout);
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
% AveragePopulationFigure;
% AverageCatchFigure;
