function agents = UpdateAgentsAngle(agents,environment)
    
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]']));
    agentIndex = 1:length(agents);

    eta = environment.angularNoise;
    timestep = environment.dt;
    half = environment.lakeSize/2;
    for j = agentIndex
        %Bounce with walls
        if abs(agents(j).x)+agents(j).radius >= half
            agents(j).angle = pi - agents(j).angle;
        end
        if abs(agents(j).y)+agents(j).radius >= half
            agents(j).angle = -agents(j).angle;
        end
        
        %Randomness
        agents(j).angle = agents(j).angle + sqrt(2*eta)*timestep*randn;

        %Interaction
        interactingParticles = distanceMatrix(j,:) < (agents(j).radius+agents(j).interactionRadius);
        for k = agentIndex(and(agentIndex~=j,interactingParticles))
            if agents(j).type == "Fisherman"
                if agents(k).type == "Big Fish"
                    agents(j).angle = atan2(agents(k).y-agents(j).y,agents(k).x-agents(j).x);
                    break;
                end
            elseif agents(j).type == "Big Fish"
                if agents(k).type == "Fisherman"
                    agents(j).timestepsSinceHunted = 0;
                    agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
                    break;
                elseif agents(k).type == "Big Fish"
                    agents(j).timestepsSinceHunted = 30;
                    agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
                    continue;
                elseif agents(k).type == "Small Fish"
                    agents(j).angle = atan2(agents(k).y-agents(j).y,agents(k).x-agents(j).x);
                end
            elseif agents(j).type == "Small Fish"
                if agents(k).type == "Big Fish"
                    agents(j).timestepsSinceHunted = 0;
                    agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
                    break;
                elseif agents(k).type == "Small Fish"
                    agents(j).timestepsSinceHunted = 30;
                    agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
                end
            end
%             if interactingParticles(k)
%                 if agents(j).type == "Fisherman"
%                     if agents(k).type ~= "Fisherman"
%                         agents(j).angle = atan2(agents(k).y-agents(j).y,agents(k).x-agents(j).x);
%                     end
%                 else
%                     if agents(k).type == "Fisherman"
%                         agents(j).timestepsSinceHunted = 0;
%                     else
%                         agents(j).timestepsSinceHunted = 30;
%                     end
%                     agents(j).angle = atan2(agents(j).y-agents(k).y,agents(j).x-agents(k).x);
%                 end
%             end
        end
        
    end
    
end