clear all;
close all;
clc;
load heartscale.mat;
[m,n]=size(heartscale);
label=cell2mat(heartscale(1:m,1));
instance=zeros(m,n-1);
features=heartscale(1:m,2:n);
for i=1:1:m
   for j=1:1:9
      temp=char(features(i,j));
      
      temp(1:2)=[];
      instance(i,j)=str2num(temp);
       
       
   end
    
    for j=10:1:9
      temp=char(features(i,j));
      
      temp(1:2)=[];
      instance(i,j)=str2num(temp);
       
       
   end
    
end
