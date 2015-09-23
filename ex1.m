% a simple curve fitting script
close all;
clear

% Generate sample points 
x = [0:0.5:10]';
y = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 + normrnd(0, 0.3, size(x));
figure(1)
plot(x,y,'o')
hold on;
% 

x = [0:0.5:10]';
y = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 + normrnd(0, 0.3, size(x));
figure(2)
plot(x,y,'o')
hold on;
m = size (x,1);
X = [ones(m,1),x,x.^2,x.^3];
w = inv(X'*X)*X'*y;  % pseudo-inverse to get w
x_new = [0:0.1:10]';
m = size (x_new,1);
X = [ones(m,1),x_new,x_new.^2,x_new.^3];
prediction = X*w;

plot(x_new,prediction)  %plot new curve
hold off;

<<<<<<< HEAD
% Calculate sample points
a = 3.25;
y_325 = w(4) * a.^3 + w(3) * a.^2 + w(2)*a + w(1)
=======
d= 10;

>>>>>>> origin/master

a = 9.75;
y_975 = w(4) * a.^3 + w(3) * a.^2 + w(2)*a + w(1)


x = [0:0.5:10]';
y2 = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 ;
figure(3);
plot(x,y2,'o')
hold on;
X = [ones(m,1),x_new,x_new.^2,x_new.^3];
prediction = X*w;
plot(x_new,prediction)
hold off

