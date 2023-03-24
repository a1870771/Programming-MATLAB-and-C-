clc;

% Test Case 1 (Positive integers)
v1 = [1, 2, 3];
v2 = [4, 5, 6];
fprintf("Input: [1, 2, 3] [4, 5, 6]     Expected Output: 21     Actual Output: %0.0f\n", sumVectors(v1,v2))

% Test Case 2 (Negative integers + Different length)
v1 = [10, 20, 30 11];
v2 = [-10, -20, -30 -11];
fprintf("Input: [10, 20, 30, 11] [-10, -20, -30, -11]     Expected Output: 0     Actual Output: %0.0f\n", sumVectors(v1,v2))

% Test Case 3 (Non-integers values)
v1 = [-1.5, 11, 2.34];
v2 = [0, 3.14, -30];
fprintf("Input: [-1.5, 11, 2.34] [0, 3.14, -30]     Expected Output: -15.02     Actual Output: %0.2f\n", sumVectors(v1,v2))