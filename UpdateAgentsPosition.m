function agents = UpdateAgentsPosition(agents,environment)
    
    [agents.x] = [agents.velocity].*cos([agents.angle]).*[environment.dt];
    [agents.y] = [agents.velocity].*sin([agents.angle]).*[environment.dt];
    
%     agents([agents.x]<-environment.lakeSize/2).x = -environment.lakeSize/2;
%     agents([agents.x]>environment.lakeSize/2).x = environment.lakeSize/2;
%     agents([agents.y]<-environment.lakeSize/2).y = -environment.lakeSize/2;
%     agents([agents.y]>environment.lakeSize/2).y = environment.lakeSize/2;
    
    half = environment.lakeSize/2;
    for j = 1:length(agents)
        if abs(agents(j).x) > half
            agents(j).x = sgn(agents(j).x)*half;
        end
        if abs(agents(j).y) > half
            agents(j).y = sgn(agents(j).y)*half;
        end
    end
    
end