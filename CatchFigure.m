figure(4)
clf
plot(fishCatch(1,:),'.r')
% title('Catch per dt')
xlabel('Iterations')
ylabel('Catch per iteration')

figure(5)
clf
plot(movmean(fishCatch(1,:),[5000 0]),'-b')
% title('Total catch / #dt')
xlabel('Iterations')
ylabel('Moving average catch per iteration')

figure(6)
clf
plot(fishCatch(2,:),'-b')
% title('Total catch')
xlabel('Iterations')
ylabel('Accumulated catch')