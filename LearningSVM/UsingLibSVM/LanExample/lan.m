clear all;
close all;
clc;
[training_label,training_inst]=libsvmread('training_data.txt');
[testing_label,testing_inst]=libsvmread('testing_data.txt');
model = svmtrain(training_label,training_inst, '-t 0 -c 100 -v 3');
% [predict_label, accuracy, dec_values] =svmpredict(testing_label, testing_inst, model); % test the trainingdata