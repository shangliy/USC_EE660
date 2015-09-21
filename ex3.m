% HW4 Problem 2

%% Data generation
clear all;
rx = -10:0.5:10;
ry = -10:0.5:10;

[w1, w2] = meshgrid(rx,ry);
[m, n] = size(w1);
w = [reshape(w1,1,m*n); reshape(w2,1,m*n)];

x1 = [0.5;0.3]; y1 = 0.2;
x2 = [1.5;2]; y2 = 0.3;

for i = 1:1:m*n
    g(i) = (x1' * w(:,i) - y1)^2 + (x2' * w(:,i) - y2)^2;
end

%TODO: visualize g(w) with a mesh plot. 
%      You'll need to reshape g into a m by n grid

%% function minimization
current = [-5 ; -8]; % current position, set to starting position
path = []; % a stack that keep a history of current position
stepsize = 0.01; 

found = 0; 
i = 0;
while found ~= 1 && i <500
    i = i+1;
    %TODO: push current position to path

    %TODO: calculate gradient

    %TODO: update current position

    %TODO: check termination criterion

end