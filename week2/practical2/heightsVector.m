clc; clear;

height=[];

for i = 1:5
    heights(i) = input("Enter height in cm: ");
    if heights(i) < 0
        fprintf("Error: Height cannot be negative.\n");
        return
    end
end
for j = 1:5
    disp(heights(j));
end