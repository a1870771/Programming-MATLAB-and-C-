years=[2015:2041];


leapYears=[];

for i = 1:length(years)
    if mod(years(i), 4) == 0
        leapYears = [leapYears years(i)];
    end
end


fprintf("[");
fprintf('%d ', leapYears);
fprintf(']\n');