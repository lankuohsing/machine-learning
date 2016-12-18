clear all;
close all;
clc;
nTree=500;
num_neighbors=10;
load('training_data.mat')
load('training_label.mat')

load('testing_data.mat')
load('testing_label.mat')
[m1,n1]=size(training_label);
[m2,n2]=size(testing_label);

predict_label = knnclassify(testing_data, training_data,training_label, num_neighbors);
accuracy = length(find(predict_label == testing_label))/length(testing_label)*100;

% temp1=Predict_label-testing_label;
% rate1=sum(temp1(:)==0)/m2;




