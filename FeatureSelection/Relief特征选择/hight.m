%=============================================================

% 函数名：hight
% 函数介绍：求直方图的高（概率密度)。
% 输入参数：x是横轴的区间。   
%          r是要画柱图的数据。如基因的分类信息指数或基因的分类权重等。
%          fenshu是横轴的区间个数。
%          number是基因表达谱数据中的基因个数。
% 输出参数：y是分到每个区间的基因个数


%==============================
function [y] = hight (x, r, fenshu, number )
y = zeros (1, fenshu);
for i = 1 : number
    for j = 1 : fenshu
        if j ~= fenshu
            if r ( i ) >= x ( j ) & r ( i ) < x ( j + 1 )
                y ( j ) = y ( j ) + 1;
            end
        else
            if r ( i ) >= x ( j ) & r ( i ) <= x ( j + 1 )
                y ( j ) = y ( j ) + 1;
            end
        end
    end
end
%end of function y=glmd(x,r,fenshu,number,B);%直方图的高(概率密度)
