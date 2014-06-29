
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

GLuint Texture_Create_RGB(const void * data, int width, int height)
{
    GLuint texture;

    glGenTextures( 1, &texture );
    glBindTexture( GL_TEXTURE_2D, texture );
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );

    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGB8, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data );

    return texture;
}

void Init(int argc, char *argv[])
{
    if (argc > 1 && strcmp(argv[1], "-glinfo")==0)
    {
        printf("GL_RENDERER   = %s\n",(char*)glGetString(GL_RENDERER));
        printf("GL_VERSION    = %s\n",(char*)glGetString(GL_VERSION));
        printf("GL_VENDOR     = %s\n",(char*)glGetString(GL_VENDOR));
        printf("GL_EXTENSIONS = %s\n",(char*)glGetString(GL_EXTENSIONS));
        exit(0);
    }

    if(SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER) != 0 )
    {
        printf("Unable to initialize SDL: %s\n", SDL_GetError());
        exit(1);
    }
    atexit(SDL_Quit);

    int check = SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    //check |= SDL_GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1 );
    if(check)
    {
        printf("Unable to configure OpenGL.");
        exit(1);
    }

    SDL_Surface *screen = SDL_SetVideoMode( 256, 128, 32, SDL_OPENGL/* | SDL_HWSURFACE | SDL_FULLSCREEN*/ );
    if(screen == NULL)
    {
		printf("Unable to set video mode: %s\n", SDL_GetError());
		exit(1);
	}
}

Uint8 Framebuffer[256*128*3];
Uint8 Heightbuffer[256*128];
Uint8 Directionbuffer[256*128*2];

Uint8 Palette[256][3];

int MouseX = 0, MouseY = 0;

void Game_Update(void)
{
    //Draw BG
    int i,j;
    Uint8 * ptr = (Uint8*)Framebuffer;
    for(j = 0; j < 128; j++) for(i = 0; i < 256; i ++)
    {
        if(i < 256)
        {
            Uint8 * pal = Palette[i];
            *ptr++ = *pal++;
            *ptr++ = *pal++;
            *ptr++ = *pal;
        }
        else
        {
            *ptr++ = 255;
            *ptr++ = 0;
            *ptr++ = 255;
        }
    }
}

void CreateLuts(void)
{
    SDL_Surface * surface = SDL_LoadBMP("./bump-map-smooth.bmp");
    if(surface)
    {
        // Load image

        unsigned char * px = surface->pixels;
        int pitch = surface->pitch;

        int matrix[41*37];

        int i,j;
        for(j = 0; j < 37; j++)
        {
            for(i = 0; i < 41; i++)
            {
                matrix[j*41+i] = px[(pitch*j)+(i*3)];
                //printf("%02X ",matrix[j*41+i]);
            }
            //printf("\n");
        }

        printf("\n\n\nDeltas table smooth [dx,dy]\n\n");

        for(j = 0; j < 36; j++)
        {
            for(i = 0; i < 40; i++)
            {
                int ul = matrix[j*41+i];
                int ur = matrix[j*41+i+1];
                int dl = matrix[(j+1)*41+i];
                //int dr = matrix[(j+1)*41+i+1];

                int deltax = ( ( (ur - ul)/32) + 16 ) &0xFF;
                int deltay = ( ( (dl - ul)/32) + 16 ) &0xFF;

                if((i%16)==0) printf("\nDB $%02X,$%02X",deltax,deltay);
                else printf(",$%02X,$%02X",deltax,deltay);

                //printf("%02X ",matrix[j*41+i]);
            }

            printf(",$00,$00,$00,$00,$00,$00,$00,$00");
            printf(",$00,$00,$00,$00,$00,$00,$00,$00\n");

            printf("DB $00,$00,$00,$00,$00,$00,$00,$00");
            printf(",$00,$00,$00,$00,$00,$00,$00,$00");
            printf(",$00,$00,$00,$00,$00,$00,$00,$00");
            printf(",$00,$00,$00,$00,$00,$00,$00,$00");
            //printf("\n");
        }

        SDL_FreeSurface(surface);

        surface = SDL_LoadBMP("./bump-map-rough.bmp");
        if(surface)
        {
            px = surface->pixels;
            pitch = surface->pitch;
            for(j = 0; j < 37; j++)
            {
                for(i = 0; i < 41; i++)
                {
                    matrix[j*41+i] = px[(pitch*j)+(i*3)];
                }
            }

            printf("\n\n\nDeltas table rough [dx,dy]\n\n");

            for(j = 0; j < 36; j++)
            {
                for(i = 0; i < 40; i++)
                {
                    int ul = matrix[j*41+i];
                    int ur = matrix[j*41+i+1];
                    int dl = matrix[(j+1)*41+i];
                    //int dr = matrix[(j+1)*41+i+1];

                    int deltax = ( ( (ur - ul)/16) + 16 ) &0xFF;
                    int deltay = ( ( (dl - ul)/16) + 16 ) &0xFF;

                    if((i%16)==0) printf("\nDB $%02X,$%02X",deltax,deltay);
                    else printf(",$%02X,$%02X",deltax,deltay);

                    //printf("%02X ",matrix[j*41+i]);
                }

                printf(",$00,$00,$00,$00,$00,$00,$00,$00");
                printf(",$00,$00,$00,$00,$00,$00,$00,$00\n");

                printf("DB $00,$00,$00,$00,$00,$00,$00,$00");
                printf(",$00,$00,$00,$00,$00,$00,$00,$00");
                printf(",$00,$00,$00,$00,$00,$00,$00,$00");
                printf(",$00,$00,$00,$00,$00,$00,$00,$00");
                //printf("\n");
            }

            SDL_FreeSurface(surface);
        }

        // Intensity

        int intens_table[32*32];
/*
        for(j = 0; j < 32; j++)
        {
            for(i = 0; i < 32; i++)
            {
#define max(a,b) ((a)>(b)?(a):(b))
                float dx = max(0,abs(15.5-i)-2); // rectangled circle
                float dy = max(0,abs(15.5-j)-2);

                float intens = 1.0-(sqrt(dx*dx + dy*dy)/15.5);
                if(intens < 0.0) intens = 0.0;

                int value = intens*7;
                if(value > 6.0) value = 6.0;

                intens_table[j*32+i] = value;
            }
        }
*/
        for(j = 0; j < 32; j++)
        {
            for(i = 0; i < 32; i++)
            {
                float dx = abs(15.5-i);
                float dy = abs(15.5-j);

                float intens = 1.0-(sqrt(dx*dx + dy*dy)/16.5);
                if(intens < 0.0) intens = 0.0;
                int value = intens*7;
                if(value > 6.0) value = 6.0;

                intens_table[j*32+i] = value;
            }
        }

        printf("\n\n\nIntensity table 1 \n\n");

        for(j = 0; j < 32; j++)
        {
            for(i = 0; i < 32; i++)
            {
                int a = intens_table[j*32+i];
                int vector[7] = {0,0,1,1,2,2,3};

                if((i%32)==0) printf("\nDB $%02X",vector[a]);
                else printf(",$%02X",vector[a]);

                //printf("%02X ",matrix[j*41+i]);
            }
            //printf("\n");
        }

        printf("\n\n\nIntensity table 2 \n\n");

        for(j = 0; j < 32; j++)
        {
            for(i = 0; i < 32; i++)
            {
                int a = intens_table[j*32+i];
                int vector[7] = {0,1,1,2,2,3,3};

                if((i%32)==0) printf("\nDB $%02X",vector[a]);
                else printf(",$%02X",vector[a]);

                //printf("%02X ",matrix[j*41+i]);
            }
            //printf("\n");
        }
        printf("\n");
    }
}

//------------------------------------------------------------------------

int FPS = 0;
Uint32 timer_callback(Uint32 interval, void *parm)
{
    char title[64];
    sprintf(title,"OpenGL test - FPS: %d",FPS);
    SDL_WM_SetCaption(title,NULL);
    FPS = 0;
    return interval;
}

int main(int argc, char *argv[])
{
    Init(argc,argv);

    glEnable(GL_TEXTURE_2D);
    glDisable(GL_DEPTH_TEST);

	glClearColor(0,0,0, 0);
    glViewport(0,0, 256,128);

    glMatrixMode( GL_PROJECTION );
    glLoadIdentity();
    glOrtho(0,256, 128,0, -1,1);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    //--------------------------------

    CreateLuts();

    SDL_TimerID timerID = SDL_AddTimer(1000,timer_callback,NULL);

    //--------------------------------

    int lastticks = SDL_GetTicks();
    int done = 0;
    while(!done)
    {
        // ---------------------- EVENTS --------------------------------

        SDL_Event event;

        while(SDL_PollEvent(&event))
        {
            if(event.type == SDL_QUIT)
            {
                done = 1;
            }
            else if(event.type == SDL_MOUSEMOTION)
            {
                MouseX = event.motion.x;
                MouseY = event.motion.y;
            }
            else if(event.type == SDL_KEYDOWN)
            {
                switch(event.key.keysym.sym)
                {
                    case SDLK_ESCAPE:
                        done = 1;
                        break;
                    default:
                        break;
                }
            }
        }

        // ---------------------- GAME --------------------------------

        Game_Update();

        // ---------------------- DRAW --------------------------------

        glClear(GL_COLOR_BUFFER_BIT); //Clear screen

        GLuint texture = Texture_Create_RGB(Framebuffer,256,128);

        glBindTexture(GL_TEXTURE_2D,texture);
        glColor3f(1.0,1.0,1.0);
        glBegin( GL_QUADS );
            glTexCoord2i(0,0); // Top-left vertex
            glVertex3f(0,0,0);

            glTexCoord2i(1,0); // Bottom-left vertex
            glVertex3f(256,0,0);

            glTexCoord2i(1,1); // Bottom-right vertex
            glVertex3f(256,128,0);

            glTexCoord2i(0,1); // Top-right vertex
            glVertex3f(0,128,0);
        glEnd();

        //glFlush();

        SDL_GL_SwapBuffers();

        glDeleteTextures( 1, &texture );

        FPS++;
        while( (SDL_GetTicks() - lastticks) < 19 ) SDL_Delay(1);
        while( (SDL_GetTicks() - lastticks) < 20 );//((FPS>60) ? 17 : 16) );
        lastticks = SDL_GetTicks();
    }

    SDL_RemoveTimer(timerID);

	return 0;
}
