#include <stdio.h>
#include <math.h>

int main(int argc, char * argv[])
{
    FILE * f = fopen("text.txt","w");

    //distance palette
    int i,j;
    for(j = 0; j < 32; j++)
    {
        fprintf(f,"DB ");
        float dy = 15.5-((float)j);
        float dysq = dy * dy;
        for(i = 0; i < 32; i++)
        {
            float dx = ((float)i)-15.5;
            float dxsq = dx * dx;

            //float dist = sqrt(dysq+dxsq)/2.75;
            float dist = sqrt(dysq+dxsq)/2.5;

            dist = 7.75 - dist;
            if(dist > 7.0) dist = 7.0;
            if(dist < 0.0) dist = 0.0;

            unsigned char gb_val = dist;

            fprintf(f,"$%02X",gb_val);
            if(i != 31) fprintf(f,",");
        }
        fprintf(f,"\n");
    }

    fprintf(f,"\n");
    fprintf(f,"\n");

#define NUM_LOOPS   2.0
#define NUM_REPEATS_FAR 8.0
#define TEX_SIZE 32.0

    //distance texture
    for(j = 0; j < 64; j++)
    {
        fprintf(f,"DB ");
        float dy = 31.5-((float)j);
        float dysq = dy * dy;
        for(i = 0; i < 64; i++)
        {
            float dx = ((float)i)-31.5;
            float dxsq = dx * dx;

            float dist = NUM_REPEATS_FAR * TEX_SIZE * 1.0/sqrt(dysq+dxsq);

            unsigned char gb_val = dist;

            fprintf(f,"$%02X",gb_val);
            if( (i != 31) && (i != 63) ) fprintf(f,",");
            if(i == 31) fprintf(f,"\nDB ");
        }
        fprintf(f,"\n");
    }

    fprintf(f,"\n");
    fprintf(f,"\n");

    //angle texture
    for(j = 0; j < 64; j++)
    {
        fprintf(f,"DB ");
        float dy = 31.5-((float)j);
        for(i = 0; i < 64; i++)
        {
            float dx = ((float)i)-31.5;

            float atan2result = atan2(dy,dx);
            if(atan2result < 0) atan2result += (2.0 * M_PI);

            float angle = NUM_LOOPS * TEX_SIZE * atan2result / (2.0 * M_PI);

            unsigned char gb_val = angle;

            fprintf(f,"$%02X",gb_val);
            if( (i != 31) && (i != 63) ) fprintf(f,",");
            if(i == 31) fprintf(f,"\nDB ");
        }
        fprintf(f,"\n");
    }

    fprintf(f,"\n");
    fprintf(f,"\n");

    //palettes
    for(j = 0; j < 8; j++)
    {
        fprintf(f,"DW ");
        for(i = 0; i < 4; i++)
        {
            //int r = 31 - (31*(j*j*j))/220 - i*8;
            int r = ( 27 - 2*j ) - i*8;
            if(r < 0) r = 0;
            if(r > 31) r = 31;
            int g = ( 31 - 1*j ) - i*8;
            if(g < 0) g = 0;
            if(g > 31) g = 31;
            int b = ( 27 - 3*j ) - i*8;
            if(b < 0) b = 0;
            if(b > 31) b = 31;

            unsigned short gb_val = (b<<10)|(g<<5)|r;
            fprintf(f,"$%04X",gb_val);
            if(i != 3) fprintf(f,",");
        }
        fprintf(f,"\n");
    }

    fclose(f);

    return 0;
}
