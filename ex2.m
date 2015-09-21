clc;
clear;
close all; 

i=2;  
num_train = 30;  % 30 OR 200 Samples points
MSE_MLE = zeros(2,1);
MSE_MAP = zeros(2,1);
load '2D_MLE_MAP_Data.mat' % Load data
sigma2 = 0.5;
t_daf = [0.001,0.2];
talg2 = t_daf(i);  % Choose DIFFERENT variance for w

Mean_w = 0.5;


%% 1-1)
X_Train = x(1:num_train,:);
Y_Train = y(1:num_train,:);

w_MLE = inv(X_Train'*X_Train)*X_Train'*Y_Train;  % MLE


%% 1-2)
[m,n] = size(X_Train);
% MAP
w_MAP = inv( X_Train'*X_Train+(sigma2/talg2)*eye(n,n))*(X_Train'*Y_Train+ (sigma2/talg2)*Mean_w*ones(n,1));
 
%% 1-3)
%Plot plane
figure,
scatter3(X_Train(:,1),X_Train(:,2),Y_Train);
plot_plane( w_MLE, 'r' )
plot_plane( w_MAP, 'b' )

%% 1-4)
%Calculate the MSE

X_Test = x(num_train+1:end,:);
Y_Test = y(num_train+1:end,:);
Num = size(Y_Test,1);
Y_pre_MLE = X_Test*w_MLE;
Y_pre_MAP = X_Test*w_MAP;

MSE_MLE(i) = mean((Y_pre_MLE-Y_Test).^2);
MSE_MAP(i) = mean((Y_pre_MAP-Y_Test).^2);

