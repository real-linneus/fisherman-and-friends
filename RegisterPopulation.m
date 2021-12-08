for j=1:length(agents)
    if agents(j).type == 'Fisherman'
        populations(1,i) = populations(1,i) + agents(j).population;
    elseif agents(j).type == 'Big Fish'
        populations(2,i) = populations(2,i) + agents(j).population;
    elseif agents(j).type == 'Small Fish'
        populations(3,i) = populations(3,i) + agents(j).population;
    end
end