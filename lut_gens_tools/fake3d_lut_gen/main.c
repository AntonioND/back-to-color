#include <stdio.h>
#include <math.h>

int main(int argc, char * argv[])
{
    FILE * f = fopen("text.txt","w");

    //distance
    int i,j;
    for(j = 32; j < 64; j++)
    {
        for(i = 0; i < 256; i++)
        {
            if((i & 31) == 0) fprintf(f,"DB ");

            float dist = j;
            float angle = i;

            float y = (dist * sin(angle*2.0*M_PI/256.0));

            signed char gb_val_0 = y;

            fprintf(f,"$%02X",gb_val_0&0xFF);

            if((i & 31) == 31) fprintf(f,"\n");
            else fprintf(f,",");
        }
    }

    fprintf(f,"\n");

    fprintf(f,"fake3d_pal_red:\n");

    for(i = 0; i < 256; i++)
    {
        if((i & 15) == 0) fprintf(f,"DW ");

        float angle = i;

        float y = 20 + (11 * sin(angle*2.0*M_PI/256.0));

        unsigned short gb_val_0 = y;

        fprintf(f,"$%04X",gb_val_0&0xFFFF);

        if((i & 15) == 15) fprintf(f,"\n");
        else fprintf(f,",");
    }

    fprintf(f,"\n");

    fprintf(f,"fake3d_pal_green:\n");

    for(i = 0; i < 256; i++)
    {
        if((i & 15) == 0) fprintf(f,"DW ");

        float angle = i;

        float y = 20 + (11 * sin(angle*2.0*M_PI/256.0));

        unsigned short gb_val_0 = y;
        gb_val_0 = gb_val_0<<5;

        fprintf(f,"$%04X",gb_val_0&0xFFFF);

        if((i & 15) == 15) fprintf(f,"\n");
        else fprintf(f,",");
    }

    fprintf(f,"\n");

    fprintf(f,"fake3d_pal_blue:\n");

    for(i = 0; i < 256; i++)
    {
        if((i & 15) == 0) fprintf(f,"DW ");

        float angle = i;

        float y = 20 + (11 * sin(angle*2.0*M_PI/256.0));

        unsigned short gb_val_0 = y;
        gb_val_0 = gb_val_0<<10;

        fprintf(f,"$%04X",gb_val_0&0xFFFF);

        if((i & 15) == 15) fprintf(f,"\n");
        else fprintf(f,",");
    }

    fprintf(f,"\n");

    fprintf(f,"fake3d_pal_yellow:\n");

    for(i = 0; i < 256; i++)
    {
        if((i & 15) == 0) fprintf(f,"DW ");

        float angle = i;

        float y = 20 + (11 * sin(angle*2.0*M_PI/256.0));

        unsigned short gb_val_0 = y;
        gb_val_0 = (gb_val_0<<5)|gb_val_0;

        fprintf(f,"$%04X",gb_val_0&0xFFFF);

        if((i & 15) == 15) fprintf(f,"\n");
        else fprintf(f,",");
    }

    fprintf(f,"\n");

    fprintf(f,"fake3d_pal_cyan:\n");

    for(i = 0; i < 256; i++)
    {
        if((i & 15) == 0) fprintf(f,"DW ");

        float angle = i;

        float y = 20 + (11 * sin(angle*2.0*M_PI/256.0));

        unsigned short gb_val_0 = y;
        gb_val_0 = (gb_val_0<<10)|(gb_val_0<<5);

        fprintf(f,"$%04X",gb_val_0&0xFFFF);

        if((i & 15) == 15) fprintf(f,"\n");
        else fprintf(f,",");
    }

    fprintf(f,"\n");

    fclose(f);

    return 0;
}
