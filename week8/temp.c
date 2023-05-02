#include <stdio.h>
#include <math.h>
int main(void)
{
    float c;
    printf("enter a temperature in Celsius and i'll convert it to Fahrenheight: ");
    scanf("%f", &c);
    float fa = c * 9 / 5 + 32;
    printf("%.0f degrees Celsius is %.0f degrees Fahrenheight\n", c, fa);  
    return 0;
}