figure(1); hold on;
set(gca,'Units','points')
axis square
axis(environment.lakeSize*[-1/2, 1/2,-1/2, 1/2])
scaleFactor = get(gca,'Position');
scaleFactor = scaleFactor(4)/environment.lakeSize;
for i = 1:length(agents)
    s = (2*scaleFactor*agents(i).radius)^2;
    environment.scatter(i) = scatter(agents(i).x,agents(i).y,s,agents(i).plotColor,'filled','DisplayName',agents(i).name);
end
environment.quiver = quiver([agents.x],[agents.y],[agents.velocity].*cos([agents.angle]),[agents.velocity].*sin([agents.angle]),'r','LineWidth',1,'AutoScale','off');
legend(environment.scatter)