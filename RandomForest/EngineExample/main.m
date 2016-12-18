clear all;
close all;
clc;
nTree=500;
load('training_data.mat')
load('training_label.mat')

load('testing_data.mat')
load('testing_label.mat')
[m1,n1]=size(training_label);
[m2,n2]=size(testing_label);

Factor = TreeBagger(nTree, training_data, training_label);
[Predict_label,Scores] = predict(Factor, testing_data);
Predict_label=cell2mat(Predict_label);
Predict_label=str2num(Predict_label);
% view(t1);
% view(t2);
temp1=Predict_label-testing_label;
rate1=sum(temp1(:)==0)/m2;




