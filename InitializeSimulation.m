% Should initialize all entities and there properties as well as the
% evironment that they "live" in.

environment = struct;
environment.lakeSize = 10;
environment.t = 0;
environment.dt = 0.05;
environment.angularNoise = 0.8; 



agents = struct;
agents(1).name = "Fish 1";
agents(1).type = "Fish";
agents(1).x = -3;
agents(1).y = -2;
agents(1).angle = 0;
agents(1).velocity = 0.5;
agents(1).minVel = 0.5;
agents(1).maxVel = 4;
agents(1).timestepsSinceHunted = inf;
agents(1).poulation = 1000;
agents(1).interactionRadius = 0.2;
agents(1).radius = sqrt(agents(1).poulation);
agents(1).plotColor = 1;

agents(2).name = "Fish 3";
agents(2).type = "Fish";
agents(2).x = 3;
agents(2).y = 2;
agents(2).angle = 2*pi/3;
agents(2).velocity = 0.5;
agents(2).minVel = 0.5;
agents(2).maxVel = 4;
agents(2).timestepsSinceHunted = inf;
agents(2).poulation = 5000;
agents(2).interactionRadius = 0.2;
agents(2).radius = sqrt(agents(2).poulation);
agents(2).plotColor = 2;

agents(3).name = "Fish 2";
agents(3).type = "Fish";
agents(3).x = -2;
agents(3).y = -4;
agents(3).angle = pi/3;
agents(3).velocity = 0.5;
agents(3).minVel = 0.5;
agents(3).maxVel = 4;
agents(3).timestepsSinceHunted = inf;
agents(3).poulation = 5000;
agents(3).interactionRadius = 0.2;
agents(3).radius = sqrt(agents(3).poulation);
agents(3).plotColor = 3;


agents(4).name = "Fisherman 1";
agents(4).type = "Fisherman";
agents(4).x = 3;
agents(4).y = 3;
agents(4).angle = -2*pi/3;
agents(4).velocity = 1;
agents(4).minVel = 1;
agents(4).maxVel = 1;
agents(4).timestepsSinceHunted = inf;
agents(4).poulation = 20000;
agents(4).interactionRadius = 1;
agents(4).radius = sqrt(agents(4).poulation);
agents(4).plotColor = 4;

