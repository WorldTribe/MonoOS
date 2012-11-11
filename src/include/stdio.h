#ifndef _STDIO_H
#define _STDIO_H

#define VIDEO_MEMORY			0xb8000
#define VIDEO_WIDTH				80
#define VIDEO_HEIGHT			25
#define VIDEO_DEPTH				2
#define VIDEO_SIZE				(VIDEO_WIDTH * VIDEO_HEIGHT * VIDEO_DEPTH)

#define COLOR_WHITE				0x07

#include "types.h"


void endl();
void putch(char);
char getch();
void print(STRING);
void set_color(COLOR);

#endif
