clear all;
close all;
clc;

S=5;
format long;
load('training_data.mat')
load('training_label.mat')
load('testing_data.mat')
load('testing_label.mat')
[ train_data_S,train_label_S ] = SfoldMatrix( training_data, training_label, S );

% tic
% [ predict_label_SVM, accuracy_SVM ] = engineSVM( training_data, training_label, testing_data, testing_label );
% t_SVM=toc;
% save t_SVM.mat t_SVM;
% save accuracy_SVM.mat accuracy_SVM;








