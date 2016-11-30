function [ training_data, training_label, testing_data, testing_label ] = generate_data( num )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=2;b=5;c=0;d=3;

training_data=[a+(b-a).*rand(50,1), c+(d-c).*rand(50,1);
    c+(d-c).*rand(50,1), a+(b-a).*rand(50,1)];
training_label=[zeros(50,1);ones(50,1)];
testing_data=[a+(b-a).*rand(50,1), c+(d-c).*rand(50,1);
    c+(d-c).*rand(50,1), a+(b-a).*rand(50,1)];
testing_label=[zeros(50,1);ones(50,1)];
figure('name','training data');





end

