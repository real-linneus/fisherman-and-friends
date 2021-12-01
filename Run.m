%% Run program
clear all; close all; clc;

InitializeSimulation;
InitializeFigure;

for i = 1:500
    fprintf("%g\n",i)
%     pause(0.05)
    agents = UpdateAgentsPosition(agents,environment);
    agents = UpdateAgentsAngle(agents,environment);
    agents = UpdateAgentsVelocity(agents);
    UpdateFigure;
end

