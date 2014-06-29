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

	SECTION	"Common_Buffers",WRAMX[$D000],BANK[1]

common_bufffers1::	DS	32*32 ; Reserve space for temp buffers
common_bufffers2::	DS	32*32
common_bufffers3::	DS	32*32
common_bufffers4::	DS	32*32

	SECTION	"Main",HOME

	GLOBAL	RGB_Scroller
	GLOBAL	Plasma_Lines
	GLOBAL	Horizontal_Bars
	GLOBAL	Sine_Plasma
	GLOBAL	Fire
	GLOBAL	Tunnel
	GLOBAL	Blobs
	GLOBAL	Credits
	GLOBAL	Pentagon
	GLOBAL	Fake_3D
	GLOBAL	Train
	GLOBAL	Bump
	GLOBAL	Zoom_Bars
	GLOBAL	Bouncing_Balls
	GLOBAL	Matrix

	GLOBAL	Not_CGB ; in scene_credits.asm

;--------------------------------------------------------------------------
;- Main()                                                                 -
;--------------------------------------------------------------------------

Main:

	ei ; Enable interrupts. Don't disable them EVER!

	ld	a,[Init_Reg_A]
	cp	a,$11
	call	nz,NotColorGB
	
	call	CPU_fast ; needed for this effects...
	
	; Power on LCD...
	
	ld	a,LCDCF_ON
	ld	[rLCDC],a
	
	; Clean video output
	
	call	demo_config_default
	
	; Start demo effects
	; ------------------
	
	call	gbt_stop
	
	; Skip parts
	; ----------
	
	;    UP = skip part 1
	;    RIGHT = skip parts 1 and 2
	;    DOWN = skip parts 1, 2 and 3
	;    LEFT = skip parts 1, 2, 3 and 4

	call	scan_keys
	
	ld	a,[joy_held]
	and	a,PAD_UP
	jp	nz,.skip_part_1
	
	ld	a,[joy_held]
	and	a,PAD_RIGHT
	jp	nz,.skip_part_2

	ld	a,[joy_held]
	and	a,PAD_DOWN
	jp	nz,.skip_part_3
	
	ld	a,[joy_held]
	and	a,PAD_LEFT
	jp	nz,.skip_part_4

	; ----------------
	; - PART 1 START -
	; ----------------
	
	; RGB_Scroller
	; ------------
	
	ld	de,Start_Song_Data
	ld	b,1
	ld	c,BANK(Start_Song_Data)
	LONG_CALL_ARGS	gbt_play

	LONG_CALL	RGB_Scroller
	
	ld	b,4
	call	demo_wait_gbt_pattern
	
	; Train
	; -----

	LONG_CALL	Train

	ld	b,6
	call	demo_wait_gbt_pattern
	
	; Sine_Plasma
	; -----------
	
	LONG_CALL	Sine_Plasma
	
	ld	b,9
	call	demo_wait_gbt_pattern

	; Tunnel
	; ------

	LONG_CALL	Tunnel
	
	ld	b,11
	call	demo_wait_gbt_pattern
	
	; Plasma_Lines
	; ------------
	
	LONG_CALL	Plasma_Lines
	
	call	demo_wait_gbt_end
	call	gbt_stop

	; --------------
	; - PART 1 END -
	; --------------
	
.skip_part_1:
	
	; ----------------
	; - PART 2 START -
	; ----------------
	
	; Zoom_Bars
	; ---------

	call	demo_wait_30_frames
	
	call	gbt_stop
	ld	de,zoom_sfx_Data
	ld	b,$05
	ld	c,BANK(zoom_sfx_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Zoom_Bars
	
	;call	demo_wait_gbt_end
	call	gbt_stop

	call	demo_wait_30_frames
	
	; Blobs
	; -----
	
	call	gbt_stop
	ld	de,Second_Data
	ld	b,$05
	ld	c,BANK(Second_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Blobs
	
	ld	b,2
	call	demo_wait_gbt_pattern
	
	; Fake_3D
	; -------
	
	LONG_CALL	Fake_3D
	
	call	demo_wait_gbt_end
	call	gbt_stop
	
	; --------------
	; - PART 2 END -
	; --------------
	
.skip_part_2:
	
	; ----------------
	; - PART 3 START -
	; ----------------

	; Pentagon
	; --------
	
	call	demo_wait_30_frames
	
	ld	de,pentagon_sfx_Data
	ld	b,$05
	ld	c,BANK(pentagon_sfx_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Pentagon
	
	call	demo_wait_gbt_end
	call	gbt_stop
	
	call	demo_wait_30_frames
	
	; Bouncing_Balls
	; --------------
	
	ld	de,Song_Third_Data
	ld	b,$05
	ld	c,BANK(Song_Third_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Bouncing_Balls
	
	ld	b,7
	call	demo_wait_gbt_pattern

	; Horizontal_Bars
	; ---------------
	
	LONG_CALL	Horizontal_Bars
	
	ld	b,12
	call	demo_wait_gbt_pattern
	
	; Matrix
	; ------
	
	LONG_CALL	Matrix
	
	;call	demo_wait_gbt_end
	;call	gbt_stop
	
	call	demo_wait_30_frames

	; --------------
	; - PART 3 END -
	; --------------

.skip_part_3:

	; ----------------
	; - PART 4 START -
	; ----------------

	; Fire
	; ----
	
	ld	de,Song_Fire_Data
	ld	b,$05
	ld	c,BANK(Song_Fire_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Fire
	
	ld	b,4
	call	demo_wait_gbt_pattern
	
	; Bump
	; ----
	
	LONG_CALL	Bump

	call	demo_wait_gbt_end
	call	gbt_stop
	
	call	demo_wait_30_frames
	
	; --------------
	; - PART 4 END -
	; --------------
	
.skip_part_4:
	
	; -----------------
	; - CREDITS START -
	; -----------------
	
	; Credits
	; -------
	
	ld	de,Song_Credits_Data
	ld	b,$06
	ld	c,BANK(Song_Credits_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Credits
	
	; ---------------
	; - CREDITS END -
	; ---------------
	
	; Should never reach this point, but return anyway...
	
	ret

;--------------------------------------------------------------------------
;- demo_wait_30_frames()                                                  -
;--------------------------------------------------------------------------

demo_wait_30_frames:

	ld	c,30
.repeat:
	call	wait_vbl
	dec	c
	jr	nz,.repeat
	
	ret
	
;--------------------------------------------------------------------------
;- vbl_handler_default()                                                  -
;- vbl_set_handler_default()                                              -
;- demo_config_default()                                                  -
;--------------------------------------------------------------------------

vbl_handler_default:
	
	LONG_CALL	gbt_update
	
	ret

;-------------------------

vbl_set_handler_default:
	
	ld	bc,vbl_handler_default
	call	irq_set_VBL_no_ei
	
	ret

;--------------------------------------------------------------------------
;- demo_config_default()                                                  -
;--------------------------------------------------------------------------

demo_config_default:: ; Set up a black screen. No glitching in the process.
	
	ld	a,0
	ld	hl,OAM_Copy
	ld	b,40*4
	call	memset_fast ; a = value    hl = start address    b = size
	
	ld	b,144-1
	call	wait_ly
	
	di
	
	call	wait_screen_blank ; wait for HBL, the next IRQ is VBL
	
	call	vram_clear_palettes

	call	refresh_OAM
	
	ld	a,LCDCF_ON
	ld	[rLCDC],a ; disable sprites and window

	call	irq_clear_all_irq_disabled
	call	vbl_set_handler_default
	
	ld	a,1
	ld	[rIF],a ; Prepare VBL flag to trigger IRQ when enabling IRQs
	ld	a,1
	ld	[rIE],a
	ld	a,0
	ld	[rSTAT],a
	
	ld	a,0
	ld	[rWX],a
	ld	[rWY],a
	ld	[rSCY],a
	ld	[rSCX],a
	
	ei ; Handle VBL and return
	
	ret

;--------------------------------------------------------------------------

demo_wait_gbt_pattern::	; b = pattern

	ld	a,[gbt_current_pattern]
	cp	a,b
	jr	z,.exit
	
	halt
	
	jr	demo_wait_gbt_pattern

.exit:
	
	ld	a,[gbt_current_step]
	and	a,a
	ret	z
	
	ld	b,b ; BGB trap
	
	ret

;--------------------------------------------------------------------------

demo_wait_gbt_end::

	ld	a,[gbt_playing]
	and	a,a
	jr	nz,.dont_trap
	
	ld	b,b ; BGB trap
	
.dont_trap;

	ld	a,[gbt_playing]
	and	a,a
	ret	z
	
	halt
	
	jr	.dont_trap

;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
;- demo_load_4x4_tiles()    Must be called with LONG_CALL                 -
;--------------------------------------------------------------------------

demo_load_4x4_tiles:: ; Data located in bump map scene bank
	
	ld	b,BANK(bump_tiles)
	call	rom_bank_set
	
	ld	bc,128
	ld	hl,bump_tiles
	ld	de,256 ;  de = start index
	call	vram_copy_tiles
	ld	bc,128
	ld	de,128 ;  de = start index
	call	vram_copy_tiles
	
	ret
	
;--------------------------------------------------------------------------
;- NotColorGB()                                                           -
;--------------------------------------------------------------------------

NotColorGB:
	
	ld	a,1
	ld	[rIE],a
	
	ld	de,Song_Credits_Data
	ld	b,$06
	ld	c,BANK(Song_Credits_Data)
	LONG_CALL_ARGS	gbt_play
	
	LONG_CALL	Not_CGB

	ret

;--------------------------------------------------------------------------

