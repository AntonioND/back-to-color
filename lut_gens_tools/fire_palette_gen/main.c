
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

#if 0

/**
 * Converts an RGB color value to HSL. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and l in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSL representation
 */
function rgbToHsl(r, g, b){
    r /= 255, g /= 255, b /= 255;
    var max = Math.max(r, g, b), min = Math.min(r, g, b);
    var h, s, l = (max + min) / 2;

    if(max == min){
        h = s = 0; // achromatic
    }else{
        var d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        switch(max){
            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
            case g: h = (b - r) / d + 2; break;
            case b: h = (r - g) / d + 4; break;
        }
        h /= 6;
    }

    return [h, s, l];
}

/**
 * Converts an HSL color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes h, s, and l are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  l       The lightness
 * @return  Array           The RGB representation
 */
function hslToRgb(h, s, l){
    var r, g, b;

    if(s == 0){
        r = g = b = l; // achromatic
    }else{
        function hue2rgb(p, q, t){
            if(t < 0) t += 1;
            if(t > 1) t -= 1;
            if(t < 1/6) return p + (q - p) * 6 * t;
            if(t < 1/2) return q;
            if(t < 2/3) return p + (q - p) * (2/3 - t) * 6;
            return p;
        }

        var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        var p = 2 * l - q;
        r = hue2rgb(p, q, h + 1/3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1/3);
    }

    return [r * 255, g * 255, b * 255];
}

/**
 * Converts an RGB color value to HSV. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and v in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSV representation
 */
function rgbToHsv(r, g, b){
    r = r/255, g = g/255, b = b/255;
    var max = Math.max(r, g, b), min = Math.min(r, g, b);
    var h, s, v = max;

    var d = max - min;
    s = max == 0 ? 0 : d / max;

    if(max == min){
        h = 0; // achromatic
    }else{
        switch(max){
            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
            case g: h = (b - r) / d + 2; break;
            case b: h = (r - g) / d + 4; break;
        }
        h /= 6;
    }

    return [h, s, v];
}

/**
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  Array           The RGB representation
 */
function hsvToRgb(h, s, v){
    var r, g, b;

    var i = Math.floor(h * 6);
    var f = h * 6 - i;
    var p = v * (1 - s);
    var q = v * (1 - f * s);
    var t = v * (1 - (1 - f) * s);

    switch(i % 6){
        case 0: r = v, g = t, b = p; break;
        case 1: r = q, g = v, b = p; break;
        case 2: r = p, g = v, b = t; break;
        case 3: r = p, g = q, b = v; break;
        case 4: r = t, g = p, b = v; break;
        case 5: r = v, g = p, b = q; break;
    }

    return [r * 255, g * 255, b * 255];
}
#endif // 0

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

/**
 * Converts an HSL color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes h, s, and l are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  l       The lightness
 * @return  Array           The RGB representation
 */

float hue2rgb(float p, float q, float t)
{
    if(t < 0.0) t += 1.0;
    if(t > 1.0) t -= 1.0;
    if(t < (1.0/6.0)) return p + (q - p) * 6.0 * t;
    if(t < (1.0/2.0)) return q;
    if(t < (2.0/3.0)) return p + (q - p) * ((2.0/3.0) - t) * 6.0;
    return p;
}

void hslToRgb(float h, float s, float l, int * _r, int * _g, int * _b)
{
    float r,g,b;

    if(s == 0.0f)
    {
        r = g = b = l; // achromatic
    }
    else
    {
        float q = (l < 0.5) ? l * (1.0 + s) : l + s - l * s;
        float p = 2.0 * l - q;
        r = hue2rgb(p, q, h + (1.0/3.0));
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - (1.0/3.0));
    }

    *_r = (int)(r * 255.0);
    *_g = (int)(g * 255.0);
    *_b = (int)(b * 255.0);
}

static inline float min(float a, float b)
{
    return a < b ? a : b;
}

void FillPalette(void)
{
    int i;
    for(i = 0; i < 256; i++)
    {
        int r,g,b;
        float j = i;

        //Fire palettes
        //hslToRgb((j/3.0)/256.0, 1.0, min(1.0, (j*2.0)/256.0),&r,&g,&b); // red
        //hslToRgb((1.0/3.0)+(j/3.0)/256.0, 1.0, min(1.0, (j*2.0)/256.0),&r,&g,&b); // green
        //hslToRgb((2.0/3.0)-(j/3.0)/256.0, 1.0, min(1.0, (j*2.0)/256.0),&r,&g,&b); // blue
        //hslToRgb(min(j*1.3/256.0,1.0), 1.0, 0.5,&r,&g,&b); // rainbow

        //Blobs
        float l =  ( atan(    (((float)(i-128))/128.0) * 10.0   ) + M_PI_2 ) / M_PI;
        hslToRgb((2.0/3.0)-(j/6.6)/256.0, 1.0, l ,&r,&g,&b); // blue

        Palette[i][0] = r;
        Palette[i][1] = g;
        Palette[i][2] = b;
    }

    for(i = 0; i < 256; i++)
    {
        int r,g,b;
        r = Palette[i][0];
        g = Palette[i][1];
        b = Palette[i][2];
        if((i % 8) == 0)
        {
            int rgb = ((b>>3)<<10)|((g>>3)<<5)|((r>>3)<<0);
            printf("\tDW $%04X\n",rgb);
        }
    }

    printf("\n");

    for(i = 0; i < 256; i++)
    {
        int r,g,b;
        r = Palette[i][0];
        g = Palette[i][1];
        b = Palette[i][2];
        if((i % 8) == 0)
        {
            int rgb = ( ~(((b>>3)<<10)|((g>>3)<<5)|((r>>3)<<0)) ) & 0x7FFF;
            printf("\tDW $%04X\n",rgb);
        }
    }
}


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

    FillPalette();

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
