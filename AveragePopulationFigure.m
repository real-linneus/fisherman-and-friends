figure(3)
clf
hold on
% plot(averagePopulations(1,:),'-.r')
plot(averagePopulations(2,:),'-b')
plot(averagePopulations(3,:),'--g')
% legend('Fisherman (load of fish)','Big Fish','Small Fish')
legend('Large fish species','Small fish species')
% title('Average populations')
xlabel('Iterations')
ylabel('Average populations size')