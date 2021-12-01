%% Run program
clear all; close all; clc;

InitializeSimulation;
InitializeFigure;

for i = 1:200
    fprintf("%g\n",i)
%     pause(0.05)
    agents = UpdateAgentsPosition(agents,environment);
    agents = UpdateAgentsAngle(agents,environment);
    UpdateFigure;
end

