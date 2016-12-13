%==========================================================================
%
% 函数名：redundance
% 函数介绍：进行两两冗余分析。
%          对基因进行两两相关性分析。相关性强的一对基因中分类权重小的被去掉，大的被保留。
%          相关性弱的基因和上行保留下的基因的集合就是特征基因。
%          运行该函数需要设定相关系数阈值。
% 输入参数： original_data是原始基因表达谱数据。首行是样本标记行。
%           order是分类权重较大基因的顺序号。
%           d是分类权重较大基因的权重值。
%           stand_data是分类权重较大基因的归一化表达量。
%           g_numbertotal是原始基因表达谱数据中的总的基因个数。
% 输出参数：feature_gene是特征基因的归一化表达量。
%          feature_order是特征基因的顺序号。
%
%=========================================================================
function [ feature_gene, feature_order ] = redundance ( original_data, order, d , stand_data, g_numbertotal)

%设定相关系数阈值
correlative_threshold = input (' 请输入相关系数阈值：');
%计算相关系数矩阵r 
r = abs(  corrcoef ( transpose ( stand_data ) )  );

[row, column ] = size ( stand_data );
%先得到有序基因集合f和t。由大到小排列。
[ a, index] = sort ( d, 'descend');
f = stand_data ( index, : );%归一化表达拉量。
order_temp = order ( index );

fset = f ( 1, : );%第一个基因的归一化表达量。
orderset = order_temp ( 1 );
p = 1;        %标志fset的基因个数。

for i = 2 : row
    g (i, :) = f (i, :);
    corr = 0;
    
    for j = 1 : p
        g (j, :) = fset (j, :);
        
        if r (i, j) > correlative_threshold
            corr = 1;
        end
        
        if corr == 0
            p = p + 1;
            fset ( p, : ) = g(i, :);
            orderset ( p ) = i;
        end
        
        p = p - 1;
    end
    
    p = p + 1;
end

feature_order = orderset;

%输出特征基因的原始表达量。
gene_data = original_data ( 2 : g_numbertotal + 1 , :);
[ m , n ] = size ( feature_order );
for i = 1 : n
    feature_gene( i , :) = gene_data ( feature_order ( i ) , : );
end

% end
