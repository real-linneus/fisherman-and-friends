figure(7)
clf
plot(averageCatch(1,:),'.r')
% title('Average catch per dt')
xlabel('Iterations')
ylabel('Average atch per iteration')

figure(8)
clf
plot(movmean(averageCatch(1,:),[5000 0]),'-b')
% title('Total catch / #dt')
xlabel('Iterations')
ylabel('Average moving average catch per iteration')

figure(9)
clf
plot(averageCatch(2,:),'-b')
% title('Average total catch')
xlabel('Iterations')
ylabel('Average accumulated catch')
