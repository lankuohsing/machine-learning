%==========================================================================
%
% 函数名：choose
% 函数介绍：选出分类权重大于阈值的基因，输出他们的原始表达量。和基因的顺序号。
% 输入参数： w是所有基因的分类权重向量。
%           m是原始基因表达谱数据中总的基因个数。
%           data是原始基因表达谱数据。数据的首行是样本类别标记行。0表示一类样本。1表示另一类样本。
%           stand_data是原始基因表达谱数据的归一化表达量。样本标记行已经去掉了。
% 输出参数：data_important是分类权重大于阈值的基因的原始表达量。
%          order是分类权重大于阈值的基因的顺序号。
%          w_important是选出的权重较大基因的权重。
%          stand_dataimportant是分类权重大于阈值的基因的归一化表达量。
%==========================================================================
function [data_important, order, w_important, stand_dataimportant ] = choose ( w, m, data, stand_data )

%去掉样本标记行。
gene_data = data ( 2 : m + 1 , : );

%设定基因权重阈值。
w_threshold = input ('请输入基因权重阈值：');

p = 1;

for i = 1 : m
    
    if w ( i ) > w_threshold              
        data_important ( p , :) = gene_data ( i, : );%分类权重较大基因的原始表达量。
        stand_dataimportant ( p , :) = stand_data ( i , :);%分类权重较大基因的归一化表达量。
        order ( p ) = i;
        w_important ( p ) = w ( i );
        p = p + 1;
    end
    
end
%end
