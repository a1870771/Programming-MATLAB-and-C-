clc;

% tests combinations of negative numbers, non-integer numbers and equal
% numbers.

% Test Case 1
x = 2;
y = 3;
[small big] = compareNums(x, y);
fprintf("Input: %0.0f %0.0f   Expected Output: %0.0f %0.0f  Actual Output: %0.0f %0.0f\n", x, y, x, y, small, big)

% Test Case 2
x = 8;
y = 5;
[small big] = compareNums(x, y);
fprintf("Input: %0.0f %0.0f   Expected Output: %0.0f %0.0f  Actual Output: %0.0f %0.0f\n", x, y, y, x, small, big)

% Test Case 3
x = 1;
y = -5;
[small big] = compareNums(x, y);
fprintf("Input: %0.0f %0.0f   Expected Output: %0.0f %0.0f  Actual Output: %0.0f %0.0f\n", x, y, y, x, small, big)

% Test Case 4
x = 0;
y = 100;
[small big] = compareNums(x, y);
fprintf("Input: %0.0f %0.0f   Expected Output: %0.0f %0.0f  Actual Output: %0.0f %0.0f\n", x, y, x, y, small, big)

% Test Case 5
x = 1;
y = -1;
[small big] = compareNums(x, y);
fprintf("Input: %0.0f %0.0f   Expected Output: %0.0f %0.0f  Actual Output: %0.0f %0.0f\n", x, y, y, x, small, big)

% Test Case 6
x = 0.2;
y = 0.02;
[small big] = compareNums(x, y);
fprintf("Input: %0.1f %0.2f   Expected Output: %0.2f %0.1f  Actual Output: %0.2f %0.1f\n", x, y, y, x, small, big)
