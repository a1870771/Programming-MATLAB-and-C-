M = [1, 2, 3; 4, 5, 6; 7, 8, 9];

[rows, cols] = size(M)

% find the value to print
for r = 1:rows
   
    % select the column to print
    c = cols - r + 1;
    fprintf('%d', M(r,c));
end