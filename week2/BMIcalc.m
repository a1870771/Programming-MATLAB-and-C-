clc; clear;

weight = input("Weight (kgs): ");
height = input("Height (m): ");

%Problems could arise if the either of the input values are negative. 
%Mathmatically, height can be less than zero with no consequence, but in 
%reality I've never met anyone quite that short. To deal with this is the
%following error-catching code:

if(weight < 0 || height < 0)
    fprintf("Error: Weight/Height cannot be negative.\n")
    return;
end

BMI = weight / height^2;

fprintf("Your BMI is %.2f\n", BMI);