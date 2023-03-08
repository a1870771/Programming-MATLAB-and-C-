clc; clear;

num = [];
i = 1;

while i <= 5
    num(i) = abs(input("Enter a number: "));
    i = i + 1;
end


fprintf("The absolute sum of the numbers is %.1f\n", sum(num));