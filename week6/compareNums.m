function [small big] = compareNums(x, y);
% Assign small and big
    if x < y
        small = x;
        big = y;
    else
        small = y;
        big = x;
    end
end