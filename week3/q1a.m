clc;clear;
A=[-10:0.5:10];
B=zeros(size(A));

for i = 1:length(A)
    B(i) = A(i)^3;
end

disp(B);

