clear all;
close all;
clc;
format long;

load('train_data.mat')
load('train_label.mat')
load('test_data.mat')
load('test_label.mat')





param = [ '-t 2 -c ',num2str(100), '-g', num2str(0.01)];

model34 = svmtrain(train_label, train_data, param );
save model34.mat model34;
[predicted_label, accuracy, decision_values] = svmpredict(test_label, test_data, model34); 

