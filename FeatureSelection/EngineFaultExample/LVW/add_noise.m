clear all;
close all;
clc;
load('train_data.mat')
load('test_data.mat')
SNR_engine=30;
train_data0=awgn(train_data,SNR_engine);
save train_data0.mat train_data0;
test_data0=awgn(test_data,SNR_engine);
save test_data0.mat test_data0;