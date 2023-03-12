clc;clear;

A =  [-10:0.5:10];
B = zeros(size(A));
C = zeros(size(A));


for i = 1:length(A)
    B(i) = A(i)^3;
    C(i) = pow2(A(i));
end

hold on;
plot(A,B);
plot(A,C);
hold off;