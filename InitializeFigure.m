figure(1); hold on;
for i = 1:length(agents)
    environment.scatter = scatter(0,0,1);
    environment.quiver = quiver(0,0,0,0);
end