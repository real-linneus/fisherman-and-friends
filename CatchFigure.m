figure(4)
clf
plot(fishCatch(1,:),'.r')
title('Catch per dt')

figure(5)
clf
plot(fishCatch(3,:),'-b','Linewidth',2)
title('Total catch / #dt')

figure(6)
clf
plot(fishCatch(2,:),'-b')
title('Total catch')