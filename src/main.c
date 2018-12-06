#include <math.h>
#include <stdio.h>

int main(void)
{
        const double half_life = 2.2195e+16;
        const double lambda    = log(2) / half_life;
        printf("Enter the initial proportion of U-235\n");
        double prop;
        scanf("%lf", &prop);
        printf("Enter the time of evolution\n");
        double time;
        scanf("%lf", &time);
        printf("The final proportion of U-235 is %f\n",
               prop * exp(-lambda * time));
        return 0;
}
