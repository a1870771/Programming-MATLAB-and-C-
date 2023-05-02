#include <stdio.h>

int main(void)
{
    int years;
    printf("How many years of education do you have? Enter as a positive integer: ");
    scanf("%d", &years);
    printf("Your have a");
    if(years <= 7 && years >= 0){
        printf(" Primary ");
    } else if(years >= 8 && years <= 12){
        printf(" Secondary ");
    } else if(years >= 13){
        printf(" Tertiary ");
    } else{
        printf("n issue with your input.\n");
        return 1;
    }
    printf("level education.\n");
    return 0;
}