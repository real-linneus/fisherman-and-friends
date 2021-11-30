% Should initialize all entities and there properties as well as the
% evironment that they "live" in.

environment = struct;
environment.lakeSize = 10;
environment.t = 0;
environment.dt = 1;




agents = struct;
agents(1).name = "Fish 1";
agents(1).type = "Fish";
agents(1).x = -3;
agents(1).y = -2;
agents(1).angle = 0;
agents(1).velocity = 1;
agents(1).poulation = 1000;
agents(1).interactionRadius = 1;
agents(1).radius = sqrt(agents(1).poulation);
agents(1).plotColor = 1;

agents(2).name = "Fish 2";
agents(2).type = "Fish";
agents(2).x = 3;
agents(2).y = 2;
agents(2).angle = pi;
agents(2).velocity = 1;
agents(2).poulation = 5000;
agents(2).interactionRadius = 1;
agents(2).radius = sqrt(agents(1).poulation);
agents(2).plotColor = 2;

