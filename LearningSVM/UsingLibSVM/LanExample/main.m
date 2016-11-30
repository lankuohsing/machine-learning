clear all;
close all;
clc;
num=50;
[ training_data, training_label, testing_data, testing_label ] = generate_data( 50 );
model = svmtrain(training_label, training_data, '-t 2 -c 100 -g 0.01');
save model.mat model;
% load('model.mat')
[predicted_label, accuracy, decision_values] = svmpredict(testing_label, testing_data, model);
% [predicted_label, accuracy, decision_values] = svmpredict(training_label, training_data, model);
plot_decision( training_data, testing_data, num );