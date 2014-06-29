; 
; Copyright (c) 2014, Antonio Niño Díaz (AntonioND)
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
; 
; * Redistributions of source code must retain the above copyright notice, this
;   list of conditions and the following disclaimer.
; 
; * Redistributions in binary form must reproduce the above copyright notice,
;   this list of conditions and the following disclaimer in the documentation
;   and/or other materials provided with the distribution.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; 

	INCLUDE	"hardware.inc"
	INCLUDE "header.inc"

;-------------------------------------------------------------------------------------------------

	SECTION "Zoom_Bar_DATA", DATA, BANK[6]

zoom_bar_color_scroll_data:
	REPT	144
	DB	0,0,0
	ENDR
	
RED_VAL	SET	0
	REPT	31
RED_VAL	SET	RED_VAL+1
	DB	RED_VAL,0,0
	ENDR
	REPT	31
RED_VAL	SET	RED_VAL+(-1) ; What the hell, RGBASM? ¬_¬
	DB	RED_VAL,0,0
	ENDR

RED_VAL	SET	0
GREEN_VAL	SET	0
	REPT	31
RED_VAL	SET	RED_VAL+1
GREEN_VAL	SET	GREEN_VAL+1
	DB	RED_VAL,GREEN_VAL,0
	ENDR
	REPT	31
RED_VAL	SET	RED_VAL+(-1)
GREEN_VAL	SET	GREEN_VAL+(-1)
	DB	RED_VAL,GREEN_VAL,0
	ENDR

GREEN_VAL	SET	0
	REPT	31
GREEN_VAL	SET	GREEN_VAL+1
	DB	0,GREEN_VAL,0
	ENDR
	REPT	31
GREEN_VAL	SET	GREEN_VAL+(-1)
	DB	0,GREEN_VAL,0
	ENDR

GREEN_VAL	SET	0
BLUE_VAL	SET	0
	REPT	31
GREEN_VAL	SET	GREEN_VAL+1
BLUE_VAL	SET	BLUE_VAL+1
	DB	0,GREEN_VAL,BLUE_VAL
	ENDR
	REPT	31
GREEN_VAL	SET	GREEN_VAL+(-1)
BLUE_VAL	SET	BLUE_VAL+(-1)
	DB	0,GREEN_VAL,BLUE_VAL
	ENDR

BLUE_VAL	SET	0
	REPT	31
BLUE_VAL	SET	BLUE_VAL+1
	DB	0,0,BLUE_VAL
	ENDR
	REPT	31
BLUE_VAL	SET	BLUE_VAL+(-1)
	DB	0,0,BLUE_VAL
	ENDR

RED_VAL	SET	0
BLUE_VAL	SET	0
	REPT	31
RED_VAL	SET	RED_VAL+1
BLUE_VAL	SET	BLUE_VAL+1
	DB	RED_VAL,0,BLUE_VAL
	ENDR
	REPT	31
RED_VAL	SET	RED_VAL+(-1)
BLUE_VAL	SET	BLUE_VAL+(-1)
	DB	RED_VAL,0,BLUE_VAL
	ENDR
	
	REPT	144
	DB	0,0,0
	ENDR
	
	REPT	30 ; just in case
	DB	0,0,0
	ENDR

;-------------------------------------------------------------------------------------------------

	SECTION	"Zoom_Bar_Vars",BSS

;----------------------------------------------

zoom_bar_exit_demo:	DS	1

zoom_bar_color:		DS  2

zoom_bar_scroll_ptr:	DS	2 ; LSB first

ZOOM_BAR_SCROLL_SPEED	EQU	3*7

ZOOM_BAR_MAX_SCROLL		EQU	75*ZOOM_BAR_SCROLL_SPEED

;-------------------------------------------------------------------------------------------------

	SECTION "Zoom_Bar", CODE, BANK[6]

;----------------------------------------------

zoom_bar_init_variables:
	
	ld	a,0
	ld	[zoom_bar_color+0],a
	ld	[zoom_bar_color+1],a
	
	ld	a,zoom_bar_color_scroll_data&$FF
	ld	[zoom_bar_scroll_ptr+0],a
	ld	a,zoom_bar_color_scroll_data>>8
	ld	[zoom_bar_scroll_ptr+1],a

	ld	a,0
	ld	[zoom_bar_exit_demo],a
	
	ret

;----------------------------------------------

zoom_bar_handle_scroll:
	
	ld	a,[zoom_bar_scroll_ptr+0]
	ld	l,a
	ld	a,[zoom_bar_scroll_ptr+1]
	ld	h,a
	
	ld	de,ZOOM_BAR_SCROLL_SPEED
	add	hl,de
	
	ld	a,l
	ld	[zoom_bar_scroll_ptr+0],a
	ld	a,h
	ld	[zoom_bar_scroll_ptr+1],a
	
	ld	a,h
	cp	a,(zoom_bar_color_scroll_data+ZOOM_BAR_MAX_SCROLL)>>8
	ret	nz
	
	ld	a,l
	cp	a,(zoom_bar_color_scroll_data+ZOOM_BAR_MAX_SCROLL)&$FF
	ret	nz
	
	ld	a,1
	ld	[zoom_bar_exit_demo],a
	
	ret

;----------------------------------------------
	
lcd_handler:
	
	ld	a,[zoom_bar_scroll_ptr+0]
	ld	l,a
	ld	a,[zoom_bar_scroll_ptr+1]
	ld	h,a
	
	ld	a,[rLY]
	cp	a,$89
	ret	z
	
	ld	e,a
	ld	d,0
	add	hl,de
	add	hl,de
	add	hl,de
	
	inc	a
	ld	[rLYC],a
	
	ld	a,[hl+] ; R
	ld	b,a
	ld	a,[hl+] ; G
	ld	c,a
	ld	l,[hl] ; B
	
	; b = red, c = green, l = blue

	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	
	ld	a,l
	or	a,c
	ld	l,a
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	
	ld	a,l
	or	a,b
	ld	e,a
	ld	d,h ; de = rgb
	
	ld	a,$80 ; auto increment
	ld	[rBCPS],a
	
	call	wait_screen_blank ; destroys register a
	
	ld	c,rBCPD & $FF
	
	ld	a,e
	ld	[$FF00+c],a
	ld	a,d
	ld	[$FF00+c],a
	
	ret

;----------------------------------------------

vbl_handler:
	
	call	zoom_bar_handle_scroll
	
	ld	a,0
	ld	[rLYC],a
	
	LONG_CALL	gbt_update
	
	ret
	
;----------------------------------------------
	
	GLOBAL Zoom_Bars
	
Zoom_Bars:
	
	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_ON
	ld	[rLCDC],a	
	
	call	zoom_bar_init_variables
	
	; clear screen...

	ld	a,0
	ld	[rVBK],a
	
	ld	hl,$8000 + (16 * 256) ; clear tile 0 ($8800 mapping)
	ld	bc,16
	ld	d,$00
	call	vram_memset
	
	ld	hl,$9800 
	ld	bc,32*32
	ld	d,0	
	call	vram_memset	
	
	ld	a,1
	ld	[rVBK],a
	
	ld	hl,$9800 
	ld	bc,32*32
	ld	d,0
	call	vram_memset	
	
	; Setup IRQs
	
	call	wait_vbl
	
	ld	bc,vbl_handler
	call	irq_set_VBL
	
	ld	bc,lcd_handler
	call	irq_set_LCD
	
	ld	a,$03
	ld	[rIE],a
	
	ld	a,STATF_LYC
	ld	[rSTAT],a

	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_ON
	ld	[rLCDC],a
	
	; Start...
	; --------
	
.loop:
	call	wait_vbl
	ld	a,[zoom_bar_exit_demo]
	and	a,a
	jr	z,.loop
	
	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

