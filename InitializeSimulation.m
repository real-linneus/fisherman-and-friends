% Should initialize all entities and there properties as well as the
% evironment that they "live" in.

environment = struct;
environment.lakeSize = 10;
environment.t = 0;
environment.dt = 1;




agents = struct;
agents(1).name = "Fish 1";
agents(1).type = "Fish";
agents(1).x = 0;
agents(1).y = 0;
agents(1).angle = 0;
agents(1).velocity = 1;
agents(1).poulation = 1000;
agents(1).interactionRadius = 1;
agents(1).radius = sqrt(agents(1).poulation);
agents(1).plotColor = 1;


