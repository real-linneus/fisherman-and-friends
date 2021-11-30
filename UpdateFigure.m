for i = 1:length(agents)
    environment.scatter(i).XData = agents(i).x;
    environment.scatter(i).YData = agents(i).y;
    environment.scatter(i).SizeData = agents(i).radius;
end
environment.quiver.XData = [agents.x];
environment.quiver.YData = [agents.y];
environment.quiver.UData = [agents.velocity].*cos([agents.angle]);
environment.quiver.VData = [agents.velocity].*sin([agents.angle]);
environment.quiver.VData(abs(environment.quiver.VData) < 1e-8) = 0;
drawnow;