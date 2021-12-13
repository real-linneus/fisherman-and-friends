figure(5)
clf
hold on
plot(averageCatch(1,:),'-.r')
plot(averageCatch(2,:),'-b')
plot(averageCatch(3,:),'--g')
legend('Catch per dt','Total catch','Total catch per #dt')