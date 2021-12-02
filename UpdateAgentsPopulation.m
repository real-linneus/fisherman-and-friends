function agents = UpdateAgentsPopulation(agents)
    
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]']));
    agentIndex = 1:length(agents);

    for j = agentIndex

        fishPerCatch = ceil(100*rand);
        minFishPopulation = 500;
        maxFishPopulation = 500e3;
        catchRadius = 0.2;
        growthRate = 1.0001;
        fishermanStorage = 4000;
        
        %Interaction
        if agents(j).type == "Fisherman"
            interactingParticles = distanceMatrix(j,:) < catchRadius;
            for k = agentIndex(agentIndex~=j)
                if interactingParticles(k)
                    if agents(k).type == "Fish" 
                        if agents(k).population >= minFishPopulation+fishPerCatch && agents(j).population <= fishermanStorage-fishPerCatch
                            agents(k).population = agents(k).population - fishPerCatch;
                            fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
                            agents(j).population = agents(j).population + fishPerCatch;
                            fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
                        end
                    end
                end
            end
        elseif agents(j).type == "Fish" && agents(j).population <= maxFishPopulation-(growthRate-1)*agents(j).population
            agents(j).population = ceil(growthRate * agents(j).population);
        end
        
    end
    
end