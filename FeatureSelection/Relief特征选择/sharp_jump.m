%==============================
%
% 函数名：sharp_jump
% 函数介绍：求柱状图的基因个数突变点对应的分类权重值。
% 输入参数：area_midpoint是横轴的区间中点。
%          high是高度，即区间中的基因个数。
%          fenshu是[a,b]区间等分的份数。fenshu取决于两类样本的个数，r1,r2。有成熟的公式。
%          wide是区间宽度。
% 输出参数：alfa是柱图的突跳点对应的分类权重值。
%
%=====================================================================
function [alfa] = sharp_jump ( area_midpoint, high, fenshu, wide )
different = zeros ( 1, fenshu - 1 );

for i = 1 : fenshu - 1
    different ( i ) = abs ( high ( i ) - high ( i + 1 ) );
end

[B, IX] = sort( different );
m = IX ( fenshu - 1 );
alfa = area_midpoint ( m ) + wide / 2;
% end
