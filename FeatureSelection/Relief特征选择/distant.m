function [ data_temp ] = distant(r1, r2, data, x, lei, k)
%=====这是relief算法的第三步function [w , m] = weight( r1, r2, data )中的一个子函数。
%=====函数功能：针对样本x找到一个m×2k的阵
%=====方法：计算每个特征的类内和类间距离。此处为：欧氏距离。（可根据需要选择不同的方法）
% =====r1和r2分别是两类样本的个数。
% =====data是标准化之后的基因表达谱数据。
%=====x是样本向量。
%=====lei是类别。lei＝1表示样本属于第一类；lei＝0表示样本属于第二类。
%=====k是r1和r2中的小值。
%=====data_temp是2k个样本的基因表达量。大小为：特征个数×2k的阵。其中前面的k个样本为类内样本，后面的k个为类间样本。
%=====data_temp中样本选择的原则：按照样本x与其他同类样本之间的距离从小到大选出的k个同类样本；按照样本x与异类样本之间按照距离从大到小选出的k个异类样本。
[m, n] = size( data );
%首先：计算每个样本的类间和类内距离。
dist_temp = zeros(1, n);
for i = 1: n       %样本循环
    y = data(:, i);
    dist_temp(i) = sqrt(sum((x-y).*(x-y)));  %是否有欧氏距离的函数。
end
if lei == 1 %表示样本属于第一类
    [b1, ix1] = sort (dist_temp(1: r1));  %类内：从小到大排序选择距离小的k个。
    [b2, ix2] = sort (dist_temp(r1+1: n), 'descend');%类间：从大到小排序选择距离大的k个。
    data_temp(:, 1: k) = data (:,ix1(1: k));  %ix1(b-k+1:b)
    data_temp(:, k+1:2*k) = data (:,(r1+ix2(1: k)));
else      %表示样本属于第二类。
    [b1,ix1] = sort (dist_temp(r1+1:n));%类内：从小到大排序选择距离小的k个。
    [b2,ix2] = sort (dist_temp(1:r1), 'descend' );  %类间：从大到小排序选择距离大的k个。
    data_temp(:,1:k) = data (:, (r1+ix1(1:k)));  %ix1(b-k+1:b)
    data_temp(:,k+1:2*k) = data (:, ix2(1:k));
end
%end of function [data_hm]=distant(r1,r2,data,x,lei,k)
