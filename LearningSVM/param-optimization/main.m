%%
%{
结合libsvm，采用高斯核，进行参数寻优
%}
clear all;
close all;
clc;

%%
%加载训练集
load('training_data.mat')
load('training_label.mat')
%加载测试集
load('testing_data.mat')
load('testing_label.mat')
%数据归一化
[train_data,test_data]=data_normalization(training_data,testing_data);
save train_data.mat train_data;
save test_data.mat test_data;
%%
	
%# read some training data
labels=training_label;
data=train_data;
%# grid of parameters
folds = 5;
[C,gamma] = meshgrid(-5:2:15, -15:2:3);

%# grid search, and cross-validation
cv_acc = zeros(numel(C),1);
for i=1:numel(C)
    cv_acc(i) = svmtrain(labels, data, ...
                    sprintf('-c %f -g %f -v %d', 2^C(i), 2^gamma(i), folds));
end

%# pair (C,gamma) with best accuracy
[~,idx] = max(cv_acc);

%# contour plot of paramter selection
contour(C, gamma, reshape(cv_acc,size(C))), colorbar
hold on
plot(C(idx), gamma(idx), 'rx')
text(C(idx), gamma(idx), sprintf('Acc = %.2f %%',cv_acc(idx)), ...
    'HorizontalAlign','left', 'VerticalAlign','top')
hold off
xlabel('log_2(C)'), ylabel('log_2(\gamma)'), title('Cross-Validation Accuracy')

%# now you can train you model using best_C and best_gamma
best_C = 2^C(idx);
best_gamma = 2^gamma(idx);
%# ...


%参数寻优
% bestmodel = 0;
% for log2c = -6:10,
%   for log2g = -6:3,
%     param = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
%     model = svmtrain(training_label,train_data, param);
%     if (model >= bestmodel),
%       bestmodel = model; bestc = 2^log2c; bestg = 2^log2g;
%     end
%     
%   end
% end
% fprintf('(best c=%g, g=%g, rate=%g)\n',bestc, bestg, bestmodel);

%给定参数
% param = [ '-v 5 -t 2 -c ',num2str(100), ' -g ', num2str(0.01)];
% model = svmtrain(training_label, train_data, param );
% [predicted_label, accuracy, decision_values] = svmpredict(testing_label, test_data, model); 

% PCA
% [training_coef,training_score,latent,t2] = princomp(train_data);
% testing_score=test_data*training_coef;
% % % [testing_coef,testing_score,latent,t2] = princomp(testing_data);
% model = svmtrain(training_label, training_score(:, 1:3), param );
% [predicted_label, accuracy, decision_values] = svmpredict(testing_label, testing_score(:, 1:3), model); 
