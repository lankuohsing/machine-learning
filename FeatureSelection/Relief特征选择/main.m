clear all;
close all;
clc;
load('data.mat');
[important_data, important_order,  feature_gene, feature_order] = Relief ( data );