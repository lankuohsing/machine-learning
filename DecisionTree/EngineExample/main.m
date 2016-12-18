clear all;
close all;
clc;

load('training_data.mat')
load('training_label.mat')

load('testing_data.mat')
load('testing_label.mat')
[m1,n1]=size(training_label);
[m2,n2]=size(testing_label);

t1=treefit(training_data,training_label);%train_X的行数为样本数，列数为特征数；y的行数为样本数，1列表征类；
t2=classregtree(training_data,training_label);%用法与上一致，只是treefit为ID3算法，classregtree为CART算法；现在多使用classregtree；
% cost1 = treetest(t1,'test',training_data,training_label);%测试错误率；
% cost2 = treetest(t2,'test',training_data,training_label);%测试错误率；

% view(t1);
% view(t2);
label1 = treeval(t1,testing_data);
label2 = treeval(t2,testing_data);
temp1=label1-testing_label;
temp2=label2-testing_label;
rate1=sum(temp1(:)==0)/m2;
rate2=sum(temp2(:)==0)/m2;



