figure(4)
clf
hold on
plot(fishCatch(1,:),'.r')
plot(fishCatch(3,:),'-b','Linewidth',2)
legend('Catch per dt','Total catch / #dt')
title('Catch')

figure(5)
clf
hold on
plot(fishCatch(2,:),'-b')
title('Total catch')