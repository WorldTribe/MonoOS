__asm__ (".code16gcc");
#include "include/stdio.h"

BYTE* videomem = (BYTE*) VIDEO_MEMORY;
UINT32 videoindex = 0;
COLOR videocolor = COLOR_WHITE;

void endl() {
	videoindex += ((VIDEO_WIDTH * VIDEO_DEPTH) - (videoindex % (VIDEO_WIDTH * VIDEO_DEPTH)));
}

void putch(char ch) {
	switch(ch) {
		case '\n' : endl(); break }
		case '\t' : for(int i = 0; i < 3; i++) putch(0x20); break; 
		case '\v' : videoindex += VIDEO_WIDTH * VIDEO_DEPTH; break 
		case '\b' : videoindex -= VIDEO_DEPTH; break;
		case '\r' : videoindex -= (videoindex % (VIDEO_WIDTH * VIDEO_DEPTH)); break; 
		default : 
				videomem[videoindex++] = ch;
				videomem[videoindex++] = videocolor;
				break;
	}
}


