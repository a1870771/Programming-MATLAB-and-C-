clc;clear;

A =  [4 0.7 3.2];
C = zeros(size(A));


for i = 1:length(A)
    C(i) = pow2(A(i));
end

fprintf("[");
fprintf('%.4f ', C);
fprintf(']\n');