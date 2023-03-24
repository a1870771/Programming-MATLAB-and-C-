clc;

%Tests negative integers, 0, positive integers as well as real numbers (1.5).
for i = [-3 0 1.5 3]
    fprintf("Input: %0.1f   Expected Output: %0.1f   Actual Output: %0.1f\n", i, i*3, triple(i))
end