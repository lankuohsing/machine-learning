function [ predict_label, accuracy ] = engineSVM( training_data, training_label, testing_data, testing_label )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[train_data,test_data]=data_normalization(training_data,testing_data);
param = [ ' -t 2 -c ',num2str(100), ' -g ', num2str(0.01)];
model = svmtrain(training_label, train_data, param );
[predict_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model); 
accuracy=accuracy(1);
end

