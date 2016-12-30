function [ train_data_S,train_label_S ] = SfoldMatrix( training_data, training_label, S )
%UNTITLED2 train_data_S of this function goes here
%   Detailed explanation goes here
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

end

