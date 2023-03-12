clc;clear;

A=[1:10];
B=[11:20];
C=[];

for i =1:length(B)
    C = [C A(i) B(i)]
end

fprintf("[");
fprintf('%d ', C);
fprintf(']\n');
