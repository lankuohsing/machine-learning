clear all;
close all;
clc;
format long;
load('training_data3.mat')
load('training_label3.mat')
load('testing_data3.mat')
load('testing_label3.mat')

load('training_data4.mat')
load('training_label4.mat')
load('testing_data4.mat')
load('testing_label4.mat')

training_data=[training_data3;training_data4];
training_label=[training_label3;training_label4];
testing_data=[testing_data3;testing_data4];
testing_label=[testing_label3;testing_label4];



% training_data(:,[3 4 11 12 ])=[];
% testing_data(:,[3 4 11 12])=[];
[train_data,test_data]=data_normalization(training_data,testing_data);
train_label=training_label; test_label=testing_label;
save train_data.mat train_data;
save test_data.mat test_data;
save train_label.mat train_label;
save test_label.mat test_label;
% a=zeros(31,31);
% for i=-15:1:15
%    for j=-20:1:10
%       c=2^i;g=2^j; 
%       param = [ '-t 2 -c ',num2str(c), '-g', num2str(g)];
%       model = svmtrain(training_label, train_data, param );
%       [predicted_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model); 
%        a(i+16,j+21)=accuracy(1);
%    end
%     
%     
% end
% max_accuracy=max(max(a));
% [m,n]=find(a==max_accuracy);
param = [ '-t 2 -c ',num2str(100), '-g', num2str(0.01)];

model02 = svmtrain(training_label, train_data, param );
save model02.mat model02;
[predicted_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model02); 

