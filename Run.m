%% Run program
clear all; close all; clc;

InitializeSimulation;
InitializeFigure;

for i = 1:10
    fprintf("%g\n",i)
    pause(0.5)
    agents = UpdateAgentsPosition(agents,environment);
    UpdateFigure;
end

