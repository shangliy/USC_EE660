clc;
clear;
close all;

d= 3;

x =  [1:0.1:10]';
y = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 + normrnd(0, 0.3, size(x));
m = size (x,1);

X = ones(m,1);
for i = 1:d
    X = [X,x.^i];
end
   for k =1 :2
       m = size (x,1);
   small_sigma_squared = 0.3
   eta_sqaured = 0.01
   iNumMeasurements = size(X,1);
   iNumRegressors   = size(X,2);

   big_sigma = small_sigma_squared * eye(iNumMeasurements); %a = 0.01 * eye(5);
   
   big_omega = eta_sqaured * eye(iNumRegressors); %b = 0.01 * eye(5);
   if k ==1 
       big_omega(1,1) = 0.01;
   else 
       for i = 1:d+1
            big_omega(i,i) = 0.01/(i^2);
       end
   end
   lambda = inv(X' * inv(big_sigma) * X + inv(big_omega));
   mu     = lambda * X' * inv(big_sigma) * y;
   
   % mvnrnd(MU,SIGMA)
    % mvnrnd(mu,lambda)
    %% draw samples from posterior
    iNumIter = 10000; % number of samples
    for iCount=1:iNumIter
        w_vector_array(iCount,:) = [mvnrnd(mu,lambda)];
    end
   w_m= mean(w_vector_array)
   x = [0:0.1:12]';
   m = size (x,1);
y_t = 0.03 * x.^3 - 0.4 * x.^2 + x + 0.2 + normrnd(0, 0.3, size(x));
   X_t = ones(m,1);
   for i = 1:d
        X_t = [X_t,x.^i];
   end

   prediction = X_t*w_m';
   
    if k ==1 scatter(x,y_t,'o')
    hold on;
    plot(x,prediction)
    hold on;
    else
        plot(x,prediction,'b')
    hold off;
    
    end
   end
   legend('sample points','constant variance','various variance')