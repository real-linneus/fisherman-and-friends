figure(6)
clf
hold on
plot(averageCatch(1,:),'.r')
plot(averageCatch(3,:),'-b','Linewidth',2)
legend('Average catch per dt','Average total catch / #dt')
title('Average catch')

figure(7)
clf
hold on
plot(averageCatch(2,:),'-b')
title('Average total catch')