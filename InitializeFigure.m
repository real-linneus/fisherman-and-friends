figure(1); hold on;
axis square
axis(environment.lakeSize*[-1/2, 1/2,-1/2, 1/2])
for i = 1:length(agents)
    environment.scatter(i) = scatter(agents(i).x,agents(i).y,agents(i).radius,agents(i).plotColor,'filled','DisplayName',agents(i).name);
end
environment.quiver = quiver([agents.x],[agents.y],[agents.velocity].*cos([agents.angle]),[agents.velocity].*sin([agents.angle]),'r','LineWidth',1);
legend(environment.scatter)