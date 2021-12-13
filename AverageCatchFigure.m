figure(7)
clf
plot(averageCatch(1,:),'.r')
title('Average catch per dt')

figure(8)
clf
plot(averageCatch(3,:),'-b','Linewidth',2)
title('Average total catch / #dt')

figure(9)
clf
plot(averageCatch(2,:),'-b')
title('Average total catch')