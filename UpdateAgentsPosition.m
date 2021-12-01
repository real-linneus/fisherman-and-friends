function agents = UpdateAgentsPosition(agents,environment)
    
    half = environment.lakeSize/2;
    for j = 1:length(agents)
        agents(j).x = agents(j).x + agents(j).velocity.*cos(agents(j).angle).*environment.dt;
        agents(j).y = agents(j).y + agents(j).velocity.*sin(agents(j).angle).*environment.dt;
        
        if abs(agents(j).x) > half
            agents(j).x = sign(agents(j).x)*half;
        end
        if abs(agents(j).y) > half
            agents(j).y = sign(agents(j).y)*half;
        end
    end
    
%     agents([agents.x]<-environment.lakeSize/2).x = -environment.lakeSize/2;
%     agents([agents.x]>environment.lakeSize/2).x = environment.lakeSize/2;
%     agents([agents.y]<-environment.lakeSize/2).y = -environment.lakeSize/2;
%     agents([agents.y]>environment.lakeSize/2).y = environment.lakeSize/2;
    
end