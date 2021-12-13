figure(2)
clf
hold on
plot(populations(1,:),'-.r')
plot(populations(2,:),'-b')
plot(populations(3,:),'--g')
legend('Fisherman (load of fish)','Big Fish','Small Fish')
title('Populations')