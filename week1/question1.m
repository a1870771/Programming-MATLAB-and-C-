clc;clear;

height = input("Height: ");
depth = input("Depth: ");
length = input("Length: ");

volume = height * depth * length;

if(height < 0 || depth < 0 || length < 0)
    fprintf("Error: Dimensions cannot be less than zero\n");
    return;
end
   
fprintf("The volume of the container is %g unit(s) cubed.\n", volume);
