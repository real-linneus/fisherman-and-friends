function agents = UpdateAgentsPosition(agents,environment)
    
    half = environment.lakeSize/2;
    for j = 1:length(agents)

        if agents(j).type == "Fisherman" && agents(j).harborTimeout > 0
            agents(j).harborTimeout = agents(j).harborTimeout - 1;
            continue
        end

        agents(j).x = agents(j).x + agents(j).velocity.*cos(agents(j).angle).*environment.dt;
        agents(j).y = agents(j).y + agents(j).velocity.*sin(agents(j).angle).*environment.dt;
        
        if abs(agents(j).x)+agents(j).radius > half
            agents(j).x = sign(agents(j).x)*half - agents(j).radius*sign(agents(j).x);
        end
        if abs(agents(j).y)+agents(j).radius > half
            agents(j).y = sign(agents(j).y)*half - agents(j).radius*sign(agents(j).y);
        end
    end
    
end