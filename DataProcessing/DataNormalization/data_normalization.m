function [ normalized_train, normalized_test ] = data_normalization( origin_train, origin_test )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%y = (ymax-ymin)*(x-xmin)/(xmax-xmin) + ymin
min_normalized_train=-1;max_normalized_train=1;%映射后的范围
[row_train,col_train]=size(origin_train);
%映射前原始数据的范围
max_origin_train=max(origin_train);
min_origin_train=min(origin_train);

min_origin_train_matrix=repmat(min_origin_train,row_train,1);
max_origin_train_matrix=repmat(max_origin_train,row_train,1);
min_normalized_train_matrix=min_normalized_train*ones(row_train,col_train);
max_normalized_train_matrix=max_normalized_train*ones(row_train,col_train);
normalized_train=(origin_train-min_origin_train_matrix)./...
                    (max_origin_train_matrix-min_origin_train_matrix).*...
                    (max_normalized_train_matrix-min_normalized_train_matrix)+...
                    min_normalized_train_matrix;
                
normalized_test=(origin_test-min_origin_train_matrix)./...
                    (max_origin_train_matrix-min_origin_train_matrix).*...
                    (max_normalized_train_matrix-min_normalized_train_matrix)+...
                    min_normalized_train_matrix;

end

