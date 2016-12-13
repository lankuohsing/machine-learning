clear all;
close all;
clc;

x=[1 2 3;4 5 6;7 8 9];
y=[5 3 6;1 2 8;9 1 5];
[xx,yy]=data_normalization(x,y);

%等效于如下代码
inst = x';
[inst_norm, settings] = mapminmax(inst);
inst_norm=inst_norm';
test = y';
test_norm = mapminmax('apply', test, settings);
test_norm=test_norm';