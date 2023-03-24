function [min max] = minMaxVectors(v1, v2)
    v = [v1 v2];
    min = v(1);
    max = v(1);
    for i = 2:length(v)
        if v(i) > max
            max = v(i);
        end
        if v(i) < min
            min = v(i);
        end
    end
end

