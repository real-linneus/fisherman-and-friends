function [agents,environment] = UpdateAgentsPopulation(agents,environment)
    
    radiusMatrix = meshgrid([agents.radius])+meshgrid([agents.radius])';
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]'])) - radiusMatrix;
    agentIndex = 1:length(agents);

    for j = agentIndex

        fishPerCatch = ceil(100*rand);
        minFishPopulation = 500;
        maxFishPopulation = agents(j).maxFishPopulation;
        catchRadius = 0.2;
        growthRate = 1.0001;
        fishermanStorage = 4000;
        
        %Interaction
        interactingParticles = distanceMatrix(j,:) < 0;%agents(j).interactionRadius;
        for k = agentIndex(and(agentIndex~=j,interactingParticles))
            if agents(j).type == "Fisherman"
                if agents(k).type == "Big Fish" 
                    agents(j).population = agents(j).population + fishPerCatch;
                    agents(k).population = agents(k).population - fishPerCatch;
                    fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
                    fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
                end
            elseif agents(j).type == "Big Fish"
                if agents(k).type == "Small Fish" 
                    agents(j).population = agents(j).population + fishPerCatch;
                    agents(k).population = agents(k).population - fishPerCatch;
                    fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
                    fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
                end
            end
        end
        if agents(j).type ~= "Fisherman"
            if agents(j).population <= maxFishPopulation-(growthRate-1)*agents(j).population
                agents(j).population = ceil(growthRate * agents(j).population);
            end
            agents(j).radius = sqrt(agents(j).population/agents(j).maxFishPopulation);
        end
%             agents(j).radius = sqrt(agents(j).population/maxFishPopulation);
%         if agents(j).type == "Fisherman"
%             interactingParticles = distanceMatrix(j,:) < catchRadius;
%             for k = agentIndex(agentIndex~=j)
%                 if interactingParticles(k)
%                     if agents(k).type == "Fish" 
%                         if agents(k).population >= minFishPopulation+fishPerCatch && agents(j).population <= fishermanStorage-fishPerCatch
%                             agents(k).population = agents(k).population - fishPerCatch;
%                             fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
%                             agents(j).population = agents(j).population + fishPerCatch;
%                             fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
%                         end
%                     end
%                 end
%             end
%         else
%             if agents(j).population <= maxFishPopulation-(growthRate-1)*agents(j).population
%                 agents(j).population = ceil(growthRate * agents(j).population);
%             end
%             agents(j).radius = sqrt(agents(j).population/maxFishPopulation);
%         end
        if agents(j).type ~= "Fisherman"
            agents(j).radius = sqrt(agents(j).population/agents(j).maxFishPopulation);
        end
    end
    if any([agents.population]<=0)
        delete(environment.scatter([agents.population]<=0));
        environment.scatter = environment.scatter([agents.population]>0);
        agents = agents([agents.population]>0);
    end
end