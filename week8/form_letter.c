#include <stdio.h>


int main(void)
{
    char firstName[20], lastName[20];
    int age;
    float fraction;

    printf("Enter your name, age and employment fraction: ");
    scanf("%s %s %d %f", firstName, lastName, &age, &fraction);
    printf("Your name is %s %s, you are %d years old, and your employment fraction is %.1f\n", firstName, lastName, age, fraction);
    
    return 0;
}