clear all;
close all;
clc;

load('training_data0.mat')
load('training_label0.mat')
load('testing_data0.mat')
load('testing_label0.mat')

load('training_data1.mat')
load('training_label1.mat')
load('testing_data1.mat')
load('testing_label1.mat')

training_data=[training_data0;training_data1];
training_label=[training_label0;training_label1];
testing_data=[testing_data0;testing_data1];
testing_label=[testing_label0;testing_label1];



% training_data(:,[ 5:12 ])=[];
% testing_data(:,[ 5:12 ])=[];
[train_data,test_data]=data_normalization(training_data,testing_data);
save train_data.mat train_data;
save test_data.mat test_data;

a=zeros(31,31);
for i=-15:1:15
   for j=-20:1:10
      c=2^i;g=2^j; 
      param = [ '-t 2 -c ',num2str(c), '-g', num2str(g)];
      model = svmtrain(training_label, train_data, param );
      [predicted_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model); 
       a(i+16,j+21)=accuracy(1);
   end
    
    
end
max(max(a))
% param = [ '-t 2 -c ',num2str(100), '-g', num2str(0.01)];
% 
% model01 = svmtrain(training_label, train_data, param );
% save model01.mat model01;
% [predicted_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model01); 

