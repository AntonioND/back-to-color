#include <stdio.h>
#include <math.h>

int main(int argc, char * argv[])
{
    FILE * f = fopen("text.txt","w");

    int i,j;
    for(j = 0; j < 8; j++)
    {
        fprintf(f,"DB ");
        float dy = 3.5-((float)j);
        float dysq = dy * dy;
        for(i = 0; i < 8; i++)
        {
            float dx = ((float)i)-3.5;
            float dxsq = dx * dx;

            float dist = sqrt(dysq+dxsq);

            dist = dist / 3.5 * 31.0;

            char gb_val = 31.0 - dist;

            if(gb_val > 31) gb_val = 31;
            if(gb_val < 0) gb_val = 0;

            fprintf(f,"$%02X",gb_val);
            if(i != 7) fprintf(f,",");
        }
        fprintf(f,"\n");
    }

    fprintf(f,"\n");
    fprintf(f,"\n");

    for(j = 0; j < 16; j++)
    {
        fprintf(f,"DB ");
        float dy = 7.5-((float)j);
        float dysq = dy * dy;
        for(i = 0; i < 16; i++)
        {
            float dx = ((float)i)-7.5;
            float dxsq = dx * dx;

            float dist = sqrt(dysq+dxsq);

            dist = dist / 7.5 * 31.0;

            char gb_val = 31.0 - dist;

            if(gb_val > 31) gb_val = 31;
            if(gb_val < 0) gb_val = 0;

            fprintf(f,"$%02X",gb_val);
            if(i != 15) fprintf(f,",");
        }
        fprintf(f,"\n");
    }

    fclose(f);

    return 0;
}
