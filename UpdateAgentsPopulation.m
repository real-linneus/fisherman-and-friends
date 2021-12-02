function agents = UpdateAgentsPopulation(agents)
    
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]']));
    agentIndex = 1:length(agents);

    for j = agentIndex

        catchRadius = 0.2;
        growthRate = 1.0002;
        %Interaction
        if agents(j).type == "Fisherman"
            interactingParticles = distanceMatrix(j,:) < catchRadius;
            for k = agentIndex(agentIndex~=j)
                if interactingParticles(k)
                    if agents(k).type == "Fish"
                        agents(k).population = agents(k).population - 100;
                        fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
                    end
                end
            end
        elseif agents(j).type == "Fish"
            agents(j).population = ceil(growthRate * agents(j).population);
        end
        
    end
    
end