%==========================================================================
%
% 函数名：weighted
% 函数介绍：计算基因的权重向量。
% 输入参数：data是归一化之后的基因表达谱数据。
%          r1是第一类样本的个数
%          r2是第二类样本的个数
% 输出参数：w是基因的分类权重。是一个列向量。
%          m是表达谱数据中总的基因个数
%
%==========================================================================
function [w , m] = weighted ( r1, r2, data )
[m, n] = size ( data );
w = zeros (1, m);%每一个特征都有一个分类权重。
%首先：使每个样本的类内和类间距离个数相等。
if r1 <= r2
    k = r1;
else 
    k = r2;
end
%第二步：求特征的分类权重。
for i = 1 : n         %样本循环
    x = data (:, i);  %x是样本向量。
    if i <= r1
        fine = 1;   %样本属于第一类。
    else
        fine = 0;   %样本属于第二类。
    end
    [ data_hm ] = distant (r1, r2, data, x, fine, k);%针对样本x找到一个m×2k的阵data_hm
    a = 0;          %特征分类权重的第一个累加项。
    b = 0;          %特征分类权重的第二个累加项。
    for r = 1 : m     %基因循环
        for j = 1 : 2*k %同类、异类样本循环。
            for t =1: 2*k  %临时样本阵的样本循环。 
                if (j <= k & t <= k) || (j > k & t > k )
                    a = a + (data_hm (r, j) - data_hm (r, t))^2;
                else
                    b = b + (data_hm (r, j) - data_hm (r, t))^2;
                end
            end
        end
        a = a / k;
        b = b / k;
        w( r ) = w( r ) - a + b;
    end   %    for r=1:m     %基因循环
end
w = transpose ( w );
% end
