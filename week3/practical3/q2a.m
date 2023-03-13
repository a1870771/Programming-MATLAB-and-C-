clc;clear;

A=[1:10];
B=[11:20];

for i =1:length(B)
    A(length(A) + 1) = B(i);
end

fprintf("[");
fprintf('%d ', A);
fprintf(']\n');
