clc;clear;

A=[1:10];
B=[11:20];

for i =1:length(B)
    A(length(A) + 1) = B(length(B) - i + 1);
end

fprintf("[");
fprintf('%d ', A);
fprintf(']\n');
