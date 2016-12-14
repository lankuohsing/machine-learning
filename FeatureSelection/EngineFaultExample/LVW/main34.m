clear all;
close all;
clc;
format long;
%Êý¾Ý¼ÓÔØ
load('train_data0.mat')
load('train_label.mat')
load('test_data0.mat')
load('test_label.mat')
[m0,n0]=size(train_data0);
train_data0=[1:n0;train_data0];
n=zeros(1,n0);

accuracy=zeros(n0,n0);
max_accuracy=zeros(1,n0);
temp_max=0;

for i=1:1:n0
    [m,n(i)]=size(train_data0);
    for j=1:1:n(i)
        train_data1=train_data0(2:m0+1,:);
        test_data1=test_data0;
        train_data1(:,j)=[];
        test_data1(:,j)=[];
        param = [ '-t 2 -c ',num2str(100), '-g', num2str(0.01)];
        
        model34(i,j) = svmtrain(train_label, train_data1, param );
        
        [predicted_label, accuracy0, decision_values] = svmpredict(test_label, test_data1, model34(i,j));
        accuracy(i,j)=accuracy0(1);
        
    end
    max_accuracy(i)=max(accuracy(i,:));
    [i_max,j_max]=find(accuracy(i,:)==max_accuracy(i));
    if max_accuracy(i)<temp_max
        break;
    end
    temp_max=max_accuracy(i);
    train_data0(:,j_max(1))=[];
    test_data0(:,j_max(1))=[];
    
end
features_index=train_data0(1,:);






