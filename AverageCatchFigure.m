figure(7)
clf
plot(averageCatch(1,:),'.r')
% title('Average catch per dt')
xlabel('Iterations')
ylabel('Average atch per iteration')

figure(8)
clf
plot(averageCatch(3,:),'-b','Linewidth',2)
% title('Average total catch / #dt')
xlabel('Iterations')
ylabel('Average accumulated catch / iteration number')

figure(9)
clf
plot(averageCatch(2,:),'-b')
% title('Average total catch')
xlabel('Iterations')
ylabel('Average accumulated catch')
