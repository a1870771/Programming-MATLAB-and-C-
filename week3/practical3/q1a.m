clc;clear;

A =  [-1 -2 -3 -4 -5];
B = zeros(size(A));


for i = 1:length(A)
    B(i) = A(i)^3;
end

fprintf("[");
fprintf('%.4f ', B);
fprintf(']\n');