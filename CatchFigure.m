figure(4)
clf
hold on
plot(fishCatch(1,:),'-.r')
plot(fishCatch(2,:),'-b')
plot(fishCatch(3,:),'--g')
legend('Catch per dt','Total catch','Total catch per #dt')