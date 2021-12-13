function [agents,environment,catchPerDt] = UpdateAgentsPopulation(agents,environment)
    
    radiusMatrix = meshgrid([agents.radius])+meshgrid([agents.radius])';
    distanceMatrix = squareform(pdist([[agents.x]',[agents.y]'])) - radiusMatrix;
    agentIndex = 1:length(agents);
    
    catchPerDt = 0;
    
    for j = agentIndex

%         fishPerCatch = ceil(100*rand);
        fishFirmPerCatch = 2;
        fishPercentagePerCatch = 0.01;
        minFishPopulation = 500;
        maxFishPopulation = agents(j).maxFishPopulation;
        catchRadius = 0.2;
        % growthRate = 1.0001;
        growthRate = 1.0005;
        fishermanStorage = 4000;
        
        %Interaction
        interactingParticles = distanceMatrix(j,:) < 0;%agents(j).interactionRadius;
        for k = agentIndex(and(agentIndex~=j,interactingParticles))
            if agents(j).type == "Fisherman"
                if agents(k).type == "Big Fish" 
%                     agents(j).population = agents(j).population + fishPerCatch;
%                     agents(k).population = agents(k).population - fishPerCatch;
                    agents(j).population = round(agents(j).population+agents(k).population*fishPercentagePerCatch+fishFirmPerCatch);
                    agents(k).population = round(agents(k).population*(1-fishPercentagePerCatch)-fishFirmPerCatch);
                    catchPerDt = catchPerDt + round(agents(k).population*fishPercentagePerCatch+fishFirmPerCatch);
%                     fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
%                     fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
                end
            elseif agents(j).type == "Big Fish"
                if agents(k).type == "Small Fish" 
% %                     agents(j).population = round(agents(j).population + fishPerCatch*0.3);
% %                     agents(k).population = agents(k).population - fishPerCatch;
%                     agents(j).population = round(agents(j).population+(agents(k).population*fishPercentagePerCatch+fishFirmPerCatch)*0.25);
%                     agents(k).population = round(agents(k).population*(1-fishPercentagePerCatch)-fishFirmPerCatch);
                    
                    testParameter = 10;
                    kills = round(min(agents(k).population,testParameter*agents(j).population)*fishPercentagePerCatch+fishFirmPerCatch);
                    agents(j).population = round(agents(j).population+round(kills*0.25));
                    agents(k).population = round(agents(k).population-kills);
%                     fprintf("%s's population reduced to %d \n",agents(k).name,agents(k).population)
%                     fprintf("%s's population increased to %d \n",agents(j).name,agents(j).population)
                end
            end
        end
%         % NEDAN BESKRIVER SPONTAN TILLVÄXT FÖR ALLA FISKAR
%         if agents(j).type ~= "Fisherman"            
        % NEDAN BESKRIVER SPONTAN TILLVÄXT FÖR ENBART SMÅ FISKAR
        if agents(j).type == "Small Fish"
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

        if agents(j).type == "Fisherman" && abs(agents(j).x) < 1 && agents(j).y < -4
            agents(j).population = 1;
        end
    end
    if any([agents.population]<=0)
        delete(environment.scatter([agents.population]<=0));
        environment.scatter = environment.scatter([agents.population]>0);
        agents = agents([agents.population]>0);
    end
    
end