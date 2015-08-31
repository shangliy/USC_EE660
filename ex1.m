% a simple curve fitting script
x = [0:0.5:10]';
y = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 + normrnd(0, 0.3, size(x));
figure(1)
plot(x,y,'o')
hold on;

m = size (x,1);

X = [ones(m,1),x,x.^2,x.^3];
w = inv(X'*X)*X'*y;
prediction = X*w;

plot(x,prediction)
hold off;


x = [0:0.5:10]';
y = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 ;
figure(2)
plot(x,y,'o')
hold on;

m = size (x,1);

X = [ones(m,1),x,x.^2,x.^3];
w = inv(X'*X)*X'*y;
prediction = X*w;

plot(x,prediction)
hold off;