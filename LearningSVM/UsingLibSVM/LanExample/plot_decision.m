function [  ] = plot_decision( training_data, testing_data, num )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
plot(training_data(1:num,1),training_data(1:num,2),'b.')
hold on;
plot(training_data(num+1:2*num,1),training_data(num+1:2*num,2),'r.')
hold on;
X=training_data;



load model.mat;
w = model.SVs' * model.sv_coef;
b = -model.rho;
if (model.Label(1) == -1)
    w = -w; b = -b;
end
y_hat = sign(w'*X' + b);
sv = full(model.SVs);
% plot support vectors
plot(sv(:,1),sv(:,2),'ko', 'MarkerSize', 10);

% plot decision boundary
plot_x = linspace(min(X(:,1)), max(X(:,1)), 30);
plot_y = (-1/w(2))*(w(1)*plot_x + b);
plot(plot_x, plot_y, 'k-', 'LineWidth', 1)




figure('name','testing data');
plot(testing_data(1:num,1),testing_data(1:num,2),'b.')
hold on;
plot(testing_data(num+1:2*num,1),testing_data(num+1:2*num,2),'r.')
hold off;
end

