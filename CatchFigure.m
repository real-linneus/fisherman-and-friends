figure(4)
clf
plot(fishCatch(1,:),'.r')
% title('Catch per dt')
xlabel('Iterations')
ylabel('Catch per iteration')

figure(5)
clf
plot(fishCatch(3,:),'-b','Linewidth',2)
% title('Total catch / #dt')
xlabel('Iterations')
ylabel('Accumulated catch / iteration number')

figure(6)
clf
plot(fishCatch(2,:),'-b')
% title('Total catch')
xlabel('Iterations')
ylabel('Accumulated catch')