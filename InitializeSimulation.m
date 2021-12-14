% Should initialize all entities and there properties as well as the
% evironment that they "live" in.

environment = struct;

environment.lakeSize = 10;
environment.t = 0;
environment.dt = 0.05;
environment.angularNoise = 2;
environment.delay = 10;

numberOfFihsermen = 2;
numberOfBigFish = 4;
numberOfSmallFish = 8;

agents = struct;

agents(1).name = "Fisherman 1";
agents(1).type = "Fisherman";
agents(1).maxFishPopulation = 300;
% agents(1).x = 0;
% agents(1).y = -environment.lakeSize/2;
agents(1).x = (rand-0.5)*environment.lakeSize;
agents(1).y = (rand-0.5)*environment.lakeSize;
agents(1).angle = pi/2;
agents(1).velocity = 1;
agents(1).minVel = 1;
agents(1).maxVel = 1;
agents(1).timestepsSinceHunted = inf;
agents(1).population = 1;
agents(1).interactionRadius = 1;
agents(1).radius = 0.2;
agents(1).plotColor = 1;
agents(1).harborTimeout = 0;

for i = 2:numberOfFihsermen
    newAgentIndex = length(agents)+1;
    agents(newAgentIndex).name = "Fisherman " + num2str(i);
    agents(newAgentIndex).type = "Fisherman";
    agents(newAgentIndex).maxFishPopulation = 300;
%     agents(newAgentIndex).x = 0;
%     agents(newAgentIndex).y = -environment.lakeSize/2;
    agents(newAgentIndex).x = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).y = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).angle = pi/2;
    agents(newAgentIndex).velocity = 1;
    agents(newAgentIndex).minVel = 1;
    agents(newAgentIndex).maxVel = 1;
    agents(newAgentIndex).timestepsSinceHunted = inf;
    agents(newAgentIndex).population = 1;
    agents(newAgentIndex).interactionRadius = 1;
    agents(newAgentIndex).radius = 0.2;
    agents(newAgentIndex).plotColor = 1;
    agents(newAgentIndex).harborTimeout = 0;
end

for i = 1:numberOfBigFish
    newAgentIndex = length(agents)+1;
    agents(newAgentIndex).name = "Big Fish " + num2str(i);
    agents(newAgentIndex).type = "Big Fish";
    agents(newAgentIndex).maxFishPopulation = 5000;
    agents(newAgentIndex).x = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).y = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).angle = 0;
    agents(newAgentIndex).velocity = 0.5;
    agents(newAgentIndex).minVel = 0.5;
    agents(newAgentIndex).maxVel = 4;
    agents(newAgentIndex).timestepsSinceHunted = inf;
    agents(newAgentIndex).population = 1500;
    agents(newAgentIndex).interactionRadius = -0.2;
    agents(newAgentIndex).radius = sqrt(agents(newAgentIndex).population/agents(newAgentIndex).maxFishPopulation);
%     agents(newAgentIndex).plotColor = 0.6;
    agents(newAgentIndex).plotColor = 0.2;
    agents(newAgentIndex).harborTimeout = 0;
end

for i = 1:numberOfSmallFish
    newAgentIndex = length(agents)+1;
    agents(newAgentIndex).name = "Small Fish " + num2str(i);
    agents(newAgentIndex).type = "Small Fish";
    agents(newAgentIndex).maxFishPopulation = 5000;
    agents(newAgentIndex).x = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).y = (rand-0.5)*environment.lakeSize;
    agents(newAgentIndex).angle = 0;
    agents(newAgentIndex).velocity = 0.5;
    agents(newAgentIndex).minVel = 0.5;
    agents(newAgentIndex).maxVel = 4;
    agents(newAgentIndex).timestepsSinceHunted = inf;
    agents(newAgentIndex).population = 3000;
    agents(newAgentIndex).interactionRadius = -0.4;
    agents(newAgentIndex).radius = sqrt(agents(newAgentIndex).population/agents(newAgentIndex).maxFishPopulation);
%     agents(newAgentIndex).plotColor = 0.2;
    agents(newAgentIndex).plotColor = 0.6;
    agents(newAgentIndex).harborTimeout = 0;
end
