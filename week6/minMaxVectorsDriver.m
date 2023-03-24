clc;

% Test Case 1 (Positive Integers)
v1 = [1, 2, 3, 4];
v2 = [5, 6, 7, 8];
[min max] = minMaxVectors(v1, v2);

fprintf("Input: [1, 2, 3, 4] [5, 6, 7, 8]    Expected Output (min max): 1 8     Actual output: %0.0f %0.0f\n", min, max)

% Test Case 2 (Negative Integers)
v1 = [-10, -100];
v2 = [10, 100];
[min max] = minMaxVectors(v1, v2);

fprintf("Input: [-10, -100] [10, 100]    Expected Output (min max): -100 100     Actual output: %0.0f %0.0f\n", min, max)

% Test Case 3 (Non-integers and varying lengths)
v1 = [-0.1, 2.5];
v2 = [3.14, 2, 3, 4];
[min max] = minMaxVectors(v1, v2);

fprintf("Input: [-0.1, 2.5] [3.14, 2, 3, 4]    Expected Output (min max): -0.1 4     Actual output: %0.1f %0.0f\n", min, max)