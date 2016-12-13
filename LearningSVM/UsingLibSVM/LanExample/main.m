%% Use_precomputed_kernelForLibsvm_example  
% faruto  
% last modified by 2011.04.20  
%%  
tic;  
clear;  
clc;  
close all;  
format compact;  
%%  
% load heart_scale.mat;  
% Split Data  
load training_instance_matrix.mat;
load training_label_vector.mat;
load testing_instance_matrix.mat;
load testing_label_vector.mat;
[m_train,n_train]=size(training_instance_matrix);
[m_test,n_test]=size(testing_instance_matrix);


train_label=training_label_vector;
train_data=training_instance_matrix;
test_label=testing_label_vector;
test_data=testing_instance_matrix;
%% Linear Kernel  
model_linear = svmtrain(train_label, train_data, '-t 0');  
[predict_label_L, accuracy_L, dec_values_L] = svmpredict(test_label, test_data, model_linear);  
  
%% Precomputed Kernel One  
% 使用的核函数 K(x,x') = (x * x')  
% 核矩阵  
ktrain1 = train_data*train_data';  
Ktrain1 = [(1:m_train)',ktrain1];  
model_precomputed1 = svmtrain(train_label, Ktrain1, '-t 4');  
ktest1 = test_data*train_data';  
Ktest1 = [(1:m_test)', ktest1];  
[predict_label_P1, accuracy_P1, dec_values_P1] = svmpredict(test_label, Ktest1, model_precomputed1);  
  
%% Precomputed Kernel Two  
% 使用的核函数 K(x,x') = ||x|| * ||x'||  
% 核矩阵  
ktrain2 = ones(m_train,m_train);  
for i = 1:m_train  
    for j = 1:m_train  
        ktrain2(i,j) = sum(train_data(i,:).^2)^0.5 * sum(train_data(j,:).^2)^0.5;  
    end  
end  
Ktrain2 = [(1:m_train)',ktrain2];  
model_precomputed2 = svmtrain(train_label, Ktrain2, '-t 4');  
  
ktest2 = ones(m_test,m_train);  
for i = 1:m_test  
    for j = 1:m_train  
        ktest2(i,j) = sum(test_data(i,:).^2)^0.5 * sum(train_data(j,:).^2)^0.5;  
    end  
end  
Ktest2 = [(1:m_test)', ktest2];  
[predict_label_P2, accuracy_P2, dec_values_P2] = svmpredict(test_label, Ktest2, model_precomputed2);  
%% Precomputed Kernel Three  
% 使用的核函数 K(x,x') = (x * x') / ||x|| * ||x'||  
% 核矩阵  
ktrain3 = ones(m_train,m_train);  
for i = 1:m_train  
    for j = 1:m_train  
        ktrain3(i,j) = ...  
        train_data(i,:)*train_data(j,:)'/(sum(train_data(i,:).^2)^0.5 * sum(train_data(j,:).^2)^0.5);  
    end  
end  
Ktrain3 = [(1:m_train)',ktrain3];  
model_precomputed3 = svmtrain(train_label, Ktrain3, '-t 4');  
  
ktest3 = ones(m_test,m_train);  
for i = 1:m_test  
    for j = 1:m_train  
        ktest3(i,j) = ...  
        test_data(i,:)*train_data(j,:)'/(sum(test_data(i,:).^2)^0.5 * sum(train_data(j,:).^2)^0.5);  
    end  
end  
Ktest3 = [(1:m_test)', ktest3];  
[predict_label_P3, accuracy_P3, dec_values_P3] = svmpredict(test_label, Ktest3, model_precomputed3);  
  
  
%% Display the accuracy  
accuracyL = accuracy_L(1) % Display the accuracy using linear kernel  
accuracyP1 = accuracy_P1(1) % Display the accuracy using precomputed kernel One  
accuracyP2 = accuracy_P2(1) % Display the accuracy using precomputed kernel Two  
accuracyP3 = accuracy_P3(1) % Display the accuracy using precomputed kernel Three  
%%  
toc;  