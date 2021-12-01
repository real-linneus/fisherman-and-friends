function agents = UpdateAgentsVelocity(agents)
    
    for j = 1:length(agents) 
        agents(j).velocity = agents(j).minVel - ...
            (agents(j).minVel + agents(j).maxVel)*exp(-agents(j).timestepsSinceHunted);
        agents(j).timestepsSinceHunted = agents(j).timestepsSinceHunted + 1;
    end
    
end