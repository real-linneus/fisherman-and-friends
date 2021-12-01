function agents = UpdateAgentsAngle(agents,environment)
    
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]']));
    agentIndex = 1:length(agents);

    eta = environment.angularNoise;
    timestep = environment.dt;
    half = environment.lakeSize/2;
    for j = agentIndex
        %Bounce with walls
        if abs(agents(j).x) == half
            agents(j).angle = pi - agents(j).angle;
        end
        if abs(agents(j).y) == half
        agents(j).angle = -agents(j).angle;
        end

        %Interaction
        interactingParticles = distanceMatrix(j,:) < agents(j).interactionRadius;
        for k = agentIndex(agentIndex~=j)
            if interactingParticles(k)
                if agents(j).type == "Fisherman" 
                	agents(j).angle = atan2(agents(k).y-agents(j).y,agents(k).x-agents(j).x);
                else
                    agents(j).timestepsSinceHunted = 0;
                    agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
                end
            end
        end
        
        %Randomness
        agents(j).angle = agents(j).angle + sqrt(2*eta)*timestep*randn;
    end
    
end