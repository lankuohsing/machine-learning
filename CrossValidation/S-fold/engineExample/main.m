clear all;
close all;
clc;

S=5;
format long;
load('training_data.mat')
load('training_label.mat')
load('testing_data.mat')
load('testing_label.mat')
[m0,n0]=size(training_data);
training_seq=1:m0;
num_S=floor(m0/S);
S_matrix=zeros(num_S,S);
[mS,nS]=size(S_matrix);
train_data_S=zeros(num_S*S,n0);
train_label_S=zeros(num_S*S,1);
for i=1:1:S
    S_matrix(:,i)=training_seq(randperm(m0-(i-1)*num_S,num_S));
    train_data_S(1+(i-1)*num_S:i*num_S,:)=training_data(S_matrix(:,i),:);
    train_label_S(1+(i-1)*num_S:i*num_S,:)=training_label(S_matrix(:,i),:);
end

% tic
% [ predict_label_SVM, accuracy_SVM ] = engineSVM( training_data, training_label, testing_data, testing_label );
% t_SVM=toc;
% save t_SVM.mat t_SVM;
% save accuracy_SVM.mat accuracy_SVM;








