% Should initialize all entities and there properties as well as the
% evironment that they "live" in.

environment = struct;
environment.lakeSize = 10;
environment.t = 0;
environment.dt = 0.05;
environment.angularNoise = 2;

agents = struct;

agents(1).name = "Fisherman 1";
agents(1).type = "Fisherman";
agents(1).x = 3;
agents(1).y = 3;
agents(1).angle = -2*pi/3;
agents(1).velocity = 1;
agents(1).minVel = 1;
agents(1).maxVel = 1;
agents(1).timestepsSinceHunted = inf;
agents(1).population = 1;
agents(1).interactionRadius = 1;
agents(1).radius = 0.2;
agents(1).plotColor = 1;

agents(2).name = "Fisherman 2";
agents(2).type = "Fisherman";
agents(2).x = 4;
agents(2).y = -4;
agents(2).angle = -2*pi/3;
agents(2).velocity = 1;
agents(2).minVel = 1;
agents(2).maxVel = 1;
agents(2).timestepsSinceHunted = inf;
agents(2).population = 1;
agents(2).interactionRadius = 1;
agents(2).radius = 0.2;
agents(2).plotColor = 2;


agents(3).name = "Big Fish 1";
agents(3).type = "Big Fish";
agents(3).maxFishPopulation = 5000;
agents(3).x = -3;
agents(3).y = -2;
agents(3).angle = 0;
agents(3).velocity = 0.5;
agents(3).minVel = 0.5;
agents(3).maxVel = 4;
agents(3).timestepsSinceHunted = inf;
agents(3).population = 1000;
agents(3).interactionRadius = -0.2;
agents(3).radius = sqrt(agents(3).population/agents(3).maxFishPopulation);
agents(3).plotColor = 3;

agents(4).name = "Big Fish 2";
agents(4).type = "Big Fish";
agents(4).maxFishPopulation = 5000;
agents(4).x = 3;
agents(4).y = 2;
agents(4).angle = 2*pi/3;
agents(4).velocity = 0.5;
agents(4).minVel = 0.5;
agents(4).maxVel = 3;
agents(4).timestepsSinceHunted = inf;
agents(4).population = 5000;
agents(4).interactionRadius = -0.2;
agents(4).radius = sqrt(agents(4).population/agents(4).maxFishPopulation);
agents(4).plotColor = 4;

agents(5).name = "Small Fish 1";
agents(5).type = "Small Fish";
agents(5).maxFishPopulation = 5000;
agents(5).x = -3;
agents(5).y = 2;
agents(5).angle = 2*pi/3;
agents(5).velocity = 0.5;
agents(5).minVel = 0.5;
agents(5).maxVel = 3;
agents(5).timestepsSinceHunted = inf;
agents(5).population = 5000;
agents(5).interactionRadius = -0.2;
agents(5).radius = sqrt(agents(5).population/agents(5).maxFishPopulation/2);
agents(5).plotColor = 5;

agents(6).name = "Small Fish 2";
agents(6).type = "Small Fish";
agents(6).maxFishPopulation = 5000;
agents(6).x = 0;
agents(6).y = 2;
agents(6).angle = 2*pi/3;
agents(6).velocity = 0.5;
agents(6).minVel = 0.5;
agents(6).maxVel = 3;
agents(6).timestepsSinceHunted = inf;
agents(6).population = 5000;
agents(6).interactionRadius = -0.2;
agents(6).radius = sqrt(agents(6).population/agents(6).maxFishPopulation/2);
agents(6).plotColor = 6;

% agents(5).name = "Fish 3";
% agents(5).type = "Fish";
% agents(5).x = -2;
% agents(5).y = -4;
% agents(5).angle = pi;
% agents(5).velocity = 0.5;
% agents(5).minVel = 0.5;
% agents(5).maxVel = 4;
% agents(5).timestepsSinceHunted = inf;
% agents(5).population = 5000;
% agents(5).interactionRadius = 0.2;
% agents(5).radius = sqrt(agents(5).population);
% agents(5).plotColor = 5;
% 
% 
% 
% agents(6).name = "Fish 4";
% agents(6).type = "Fish";
% agents(6).x = -3;
% agents(6).y = -4;
% agents(6).angle = 0;
% agents(6).velocity = 0.5;
% agents(6).minVel = 0.5;
% agents(6).maxVel = 4;
% agents(6).timestepsSinceHunted = inf;
% agents(6).population = 5000;
% agents(6).interactionRadius = 0.2;
% agents(6).radius = sqrt(agents(6).population);
% agents(6).plotColor = 6;

