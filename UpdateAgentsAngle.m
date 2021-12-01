function agents = UpdateAgentsAngle(agents,environment)
    
    eta = environment.angularNoise;
    timestep = environment.dt;
    half = environment.lakeSize/2;
    for j = 1:length(agents)
        if abs(agents(j).x) == half
            agents(j).angle = pi - agents(j).angle;
        end
         if abs(agents(j).y) == half
            agents(j).angle = -agents(j).angle;
        end

        agents(j).angle = agents(j).angle + sqrt(2*eta)*timestep*randn;
    end
    
end