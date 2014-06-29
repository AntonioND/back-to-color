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

MAP_TEMP			EQU	$D000
ATTR_MAP_TEMP		EQU	$D300 ;($D000 + 32*18) aligned to $100
COMBINED_MAP_TEMP	EQU	$D600 ;($D300 + 32*18) aligned to $100

;-------------------------------------------------------------------------------------------------

	SECTION "SINE_PLASMA_DATA", DATA, BANK[1]

sine_plasma_background_palettes:
	DW	$001F,$0014,$000A,$0000
	DW	$03FF,$0294,$014A,$0000
	DW	$03E0,$0280,$0140,$0000
	DW	$7C00,$5000,$2800,$0000
	
;	DW	$001F,$0014,$000A,$0000
;	DW	(15<<5)|(31),(10<<5)|(20),(5<<5)|(10),$0000
;	DW	$03FF,$0294,$014A,$0000
;	DW	(15<<10)|(31<<5)|(15),(10<<10)|(20<<5)|(10),(5<<10)|(10<<5)|(5),$0000

sine_plasma_sprites_palette:
	DW	$0000,$7FFF,$3DEF,$0000

sine_plasma_tiles: ; 16
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$E7,$FF,$C3,$FF
	DB $C3,$FF,$E7,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$E7,$FF,$DB,$E7,$BD,$C3
	DB $BD,$C3,$DB,$E7,$E7,$FF,$FF,$FF
	DB $E7,$FF,$DB,$E7,$BD,$C3,$7E,$81
	DB $7E,$81,$BD,$C3,$DB,$E7,$E7,$FF
	DB $E7,$FF,$DB,$E7,$BD,$C3,$66,$81
	DB $66,$81,$BD,$C3,$DB,$E7,$E7,$FF
	DB $E7,$FF,$DB,$E7,$A5,$C3,$42,$81
	DB $42,$81,$A5,$C3,$DB,$E7,$E7,$FF
	DB $BD,$C3,$66,$81,$C3,$00,$81,$00
	DB $81,$00,$C3,$00,$66,$81,$BD,$C3
	DB $A5,$C3,$42,$81,$81,$00,$00,$00
	DB $00,$00,$81,$00,$42,$81,$A5,$C3
	DB $A5,$C3,$42,$81,$81,$00,$00,$00
	DB $00,$00,$81,$00,$42,$81,$A5,$C3
	DB $BD,$C3,$66,$81,$C3,$00,$81,$00
	DB $81,$00,$C3,$00,$66,$81,$BD,$C3
	DB $E7,$FF,$DB,$E7,$A5,$C3,$42,$81
	DB $42,$81,$A5,$C3,$DB,$E7,$E7,$FF
	DB $E7,$FF,$DB,$E7,$BD,$C3,$66,$81
	DB $66,$81,$BD,$C3,$DB,$E7,$E7,$FF
	DB $E7,$FF,$DB,$E7,$BD,$C3,$7E,$81
	DB $7E,$81,$BD,$C3,$DB,$E7,$E7,$FF
	DB $FF,$FF,$E7,$FF,$DB,$E7,$BD,$C3
	DB $BD,$C3,$DB,$E7,$E7,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$E7,$FF,$C3,$FF
	DB $C3,$FF,$E7,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

sine_plasma_sprite_tiles: ; 14
	DB $FF,$FF,$FE,$81,$FF,$80,$FD,$9E
	DB $F3,$92,$F3,$92,$F3,$92,$FD,$9E
	DB $FF,$80,$FE,$81,$FF,$9F,$F0,$90
	DB $F0,$90,$F0,$90,$F0,$90,$F0,$F0
	DB $78,$78,$F8,$C8,$78,$C8,$F8,$48
	DB $F8,$48,$F8,$48,$F8,$48,$F8,$48
	DB $78,$C8,$F8,$C8,$78,$48,$78,$48
	DB $7F,$4F,$7F,$40,$7F,$40,$7F,$7F
	DB $0F,$0F,$17,$18,$2F,$30,$3B,$27
	DB $3C,$24,$3C,$24,$3C,$24,$3C,$24
	DB $3F,$27,$3F,$20,$3F,$20,$3F,$27
	DB $FC,$E4,$FC,$24,$FC,$24,$FC,$FC
	DB $C7,$C7,$AB,$6C,$D7,$38,$7D,$93
	DB $FE,$92,$FE,$92,$FF,$93,$F7,$98
	DB $FB,$9C,$F7,$17,$F0,$10,$FE,$9E
	DB $FD,$93,$F7,$98,$FB,$9C,$F7,$F7
	DB $EF,$EF,$DF,$39,$EF,$19,$BE,$C9
	DB $7F,$78,$0F,$08,$EF,$E8,$DF,$39
	DB $EF,$19,$FF,$C9,$7F,$49,$7F,$49
	DB $BF,$C9,$EF,$19,$DF,$39,$EF,$EF
	DB $3D,$3D,$3E,$27,$3D,$26,$DF,$E4
	DB $3F,$C4,$FF,$04,$FF,$04,$FF,$24
	DB $3F,$E4,$FF,$E4,$3F,$24,$3F,$24
	DB $3F,$24,$3F,$24,$3F,$24,$3F,$3F
	DB $F8,$F8,$F4,$0C,$FA,$06,$6E,$F2
	DB $9E,$92,$9E,$92,$9E,$92,$9E,$92
	DB $FE,$F2,$FE,$02,$FE,$02,$FE,$F2
	DB $9E,$92,$9E,$92,$9E,$92,$9E,$9E

;-------------------------------------------------------------------------------------------------

	SECTION	"Sine_Plasma_Vars",BSS

; ---------------------------

sine_plasma_dma_copy_ready:	DS	1

sine_plasma_exit_demo:	DS	1 ; set to 1 to exit this effect
sine_plasma_event_count:	DS	2
sine_plasma_current_event:	DS	2 ; pointer to the next event

;-------------------------------------------------------------------------------------------------

	SECTION	"Sine_Plasma_Vars_HRAM",HRAM

; ---------------------------

sine_plasma_value_1:	DS	1
sine_plasma_value_2:	DS	1
sine_plasma_value_3:	DS	1
sine_plasma_value_4:	DS	1

sine_plasma_value_increment_1:	DS	1
sine_plasma_value_increment_2:	DS	1
sine_plasma_value_increment_3:	DS	1
sine_plasma_value_increment_4:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Sine_Plasma", CODE, BANK[1]

;----------------------------------------------

sine_plasma_values_init:

	ld	a,0
	ld	[sine_plasma_value_1],a
	ld	[sine_plasma_value_2],a
	ld	[sine_plasma_value_3],a
	ld	[sine_plasma_value_4],a
	
	ld	a,1
	ld	[sine_plasma_value_increment_1],a
	ld	a,2
	ld	[sine_plasma_value_increment_2],a
	ld	a,-3
	ld	[sine_plasma_value_increment_3],a
	ld	a,-2
	ld	[sine_plasma_value_increment_4],a
	
	ld	a,0
	ld	[sine_plasma_dma_copy_ready],a
	
	ld	a,0
	ld	[sine_plasma_event_count],a
	ld	[sine_plasma_event_count+1],a
	
	ld	a,0
	ld	[sine_plasma_exit_demo],a
	
	ld	hl,_event_table_sine_plasma
	ld	a,h
	ld	[sine_plasma_current_event],a
	ld	a,l
	ld	[sine_plasma_current_event+1],a
	
	ret

;----------------------------------------------

_event_exit_sine_plasma_demo:
	ld	a,1
	ld	[sine_plasma_exit_demo],a
	ret

;_event_sine_plasma_change_increments_1:
;	ld	a,-3
;	ld	[sine_plasma_value_increment_1],a
;	ret

;_event_sine_plasma_change_increments_2:
;	ld	a,0
;	ld	[sine_plasma_value_increment_2],a
;	ret

;_event_sine_plasma_change_increments_3:
;	ld	a,2
;	ld	[sine_plasma_value_increment_3],a
;	ret

;_event_sine_plasma_change_increments_4:
;	ld	a,4
;	ld	[sine_plasma_value_increment_4],a
;	ret

;_event_sine_plasma_change_increments_5:
;	ld	a,3
;	ld	[sine_plasma_value_increment_2],a
;	ret

;----------------------------------------------

_event_table_sine_plasma:

;	DW	50,_event_sine_plasma_change_increments_1
;	DW	100,_event_sine_plasma_change_increments_2
;	DW	150,_event_sine_plasma_change_increments_3
;	DW	200,_event_sine_plasma_change_increments_4
;	DW	250,_event_sine_plasma_change_increments_5
	
	DW	560,_event_exit_sine_plasma_demo

	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

sine_plasma_handle_events:
	
	; Handle events
	; -------------
	
	ld	a,[sine_plasma_event_count]
	ld	e,a
	ld	a,[sine_plasma_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[sine_plasma_current_event]
	ld	h,a
	ld	a,[sine_plasma_current_event+1]
	ld	l,a
	
	ld	c,[hl]
	inc hl
	ld	b,[hl] ; bc = event counter trigger
	ld	a,c
	and	a,b
	cp	a,$FF ; if both are $FF, exit checking
	jr	z,._exit_check_events
	
	ld	a,d
	cp	a,b
	jr	nz,._exit_check_events
	
	ld	a,e
	cp	a,c
	jr	nz,._exit_check_events
	
	inc	hl
	
	ld	c,[hl]
	inc hl
	ld	b,[hl] ; bc = ptr to function
	inc	hl ; hl = ptr to next event
	
	ld	a,h
	ld	[sine_plasma_current_event],a
	ld	a,l
	ld	[sine_plasma_current_event+1],a ; save pointer to next event
	
	ld	h,b
	ld	l,c ; hl = ptr to function
	
	CALL_HL
._exit_check_events:

	; Now, handle functions...
	; ------------------------

	; More checks here
	
	; ...
	
	; Increase counter
	; ----------------
	
	ld	a,[sine_plasma_event_count]
	ld	l,a
	ld	a,[sine_plasma_event_count+1]
	ld	h,a
	
	inc	hl
	
	ld	a,l
	ld	[sine_plasma_event_count],a
	ld	a,h
	ld	[sine_plasma_event_count+1],a
	
	ret

;----------------------------------------------
	
sine_plasma_map_draw:

	; Update
	; ------

	ld	a,[sine_plasma_value_1]
	ld	b,a
	ld	a,[sine_plasma_value_increment_1]
	add	a,b
	ld	[sine_plasma_value_1],a
	
	ld	a,[sine_plasma_value_2]
	ld	b,a
	ld	a,[sine_plasma_value_increment_2]
	add	a,b
	ld	[sine_plasma_value_2],a
	
	ld	a,[sine_plasma_value_3]
	ld	b,a
	ld	a,[sine_plasma_value_increment_3]
	add	a,b
	ld	[sine_plasma_value_3],a
	
	ld	a,[sine_plasma_value_4]
	ld	b,a
	ld	a,[sine_plasma_value_increment_4]
	add	a,b
	ld	[sine_plasma_value_4],a
	
	; Then, draw combined map ...
	; ---------------------------

	ld	de,$0000 ; loop variables
	ld	hl,COMBINED_MAP_TEMP
.loopy
	ld e,0
	
.loopx
	push	hl

	ld	h,Sine>>8
	ld	a,d
	add	a,d
	add	a,d
	add	a,e
	ld	l,a
	;sla	l
	sla	l
	sla	l
	ldh	a,[sine_plasma_value_1]
	add	a,l
	ld	l,a
	ld	b,[hl]
	sra b

	ld	h,Cosine>>8
	ld	l,e
	sla	l
	sla	l
	sla	l
	sla	l
	ldh	a,[sine_plasma_value_2]
	add	a,l	
	ld	c,d
	sla	c
	sla	c
	add	a,c
	ld	l,a
	ld	a,[hl]
	sra a
	add a,b
	
	sra	a ; a = a/2 (we are going to add 2 values more)
	
	ld	c,a ; save a
	
	ld	a,e
	srl	a
	srl	a
	add	a,d
	add	a,d
	sub	a,e
	sra	a
	ld	l,a
	
	ld	h,Sine>>8
	sla	l
	sla	l
	sla	l
	sla	l
	ldh	a,[sine_plasma_value_3]
	add	a,l
	ld	l,a
	ld	b,[hl]
	sra b
	sra	b
	
	ld	a,c ; recover a
	
	add a,b ; add 2 values more (one remaining)
	
	ld	c,a ; save a
	
	ld	a,e
	srl	a
	srl	a
	sub	a,d
	add	a,e
	add	a,e
	sra	a
	ld	l,a
	
	ld	h,Sine>>8
	sla	l
	sla	l
	sla	l
	sla	l
	ldh	a,[sine_plasma_value_4]
	add	a,l
	ld	l,a
	ld	b,[hl]
	sra b
	sra	b
	
	ld	a,c ; recover a
	
	add a,b	; add last value
	
	add a,$80 ; added everything! offset to central value
	
	srl	a
	srl	a ; only 6 bits used (2 pal + 4 tile)
	
	pop	hl
	
	ld	[hl],a
	inc	hl
	
	inc e
	ld	a,e
	cp	a,20
	jp nz,.loopx
	
	ld	bc,12 ; increase to next row
	add	hl,bc
	
	inc d
	ld	a,d
	cp	a,18
	jp nz,.loopy

	; Separate in bg and attr
	; -----------------------
	
	; Wait until maps are copied to VRAM

.wait:

	ld	a,[sine_plasma_dma_copy_ready]
	and	a,a
	jr	z,.update
	
	halt
	jr	.wait
	
.update:
	
	; Continue
	
	ld	de,0 ; array index
.loop
	
	; Load combined tile
	
	ld	hl,COMBINED_MAP_TEMP
	
	add	hl,de
	ld	a,[hl]
	
	; Split tile and attr
	
	ld	b,a
	swap	a
	and	a,3
	ld	c,a
	
	ld	a,b
	and	a,$F ; a = tile, c = attr
	
	; Save tile
	
	ld	hl,MAP_TEMP
	add	hl,de
	ld	[hl],a
	
	; Save attr
	
	ld	hl,ATTR_MAP_TEMP
	add	hl,de
	ld	[hl],c
	
	; Next tile
	inc	de
	
	; If not column 20, loop
	ld	a,e
	and	a,$1F
	cp	a,20
	jr	nz,.loop
	
	; If column 20, add 12 and check if 32 * 20 = $280 is reached
	
	ld	hl,12
	add	hl,de
	ld	d,h
	ld	e,l

	ld	a,$80
	cp	e
	jr	nz,.loop
	ld	a,$02
	cp	d
	jr	nz,.loop ; if de == $280 exit
	
	; Let the VBL handler know that the new frame can be copied
	; ---------------------------------------------------------
	
	ld	a,1
	ld	[sine_plasma_dma_copy_ready],a
	
	ret

;----------------------------------------------

sine_plasma_setup_sprites:
	
	ld	bc,((8+2)<<8)|(16+128-2)
	ld	l,0
	call	sprite_set_xy
	ld	bc,((16+2)<<8)|(16+128-2)
	ld	l,1
	call	sprite_set_xy
	ld	bc,((24+2)<<8)|(16+128-2)
	ld	l,2
	call	sprite_set_xy
	ld	bc,((32+2)<<8)|(16+128-2)
	ld	l,3
	call	sprite_set_xy
	ld	bc,((40+2)<<8)|(16+128-2)
	ld	l,4
	call	sprite_set_xy
	ld	bc,((48+2)<<8)|(16+128-2)
	ld	l,5
	call	sprite_set_xy
	ld	bc,((56+2)<<8)|(16+128-2)
	ld	l,6
	call	sprite_set_xy
	
	ld	a,0
	ld	l,0
	call	sprite_set_tile
	ld	a,2
	ld	l,1
	call	sprite_set_tile
	ld	a,4
	ld	l,2
	call	sprite_set_tile
	ld	a,6
	ld	l,3
	call	sprite_set_tile
	ld	a,8
	ld	l,4
	call	sprite_set_tile
	ld	a,10
	ld	l,5
	call	sprite_set_tile
	ld	a,12
	ld	l,6
	call	sprite_set_tile
	
	; Load data
	
	ld	b,$90
	call	wait_ly
	
	call	refresh_OAM
	
	ret

;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

SINE_PLASMA_MAP_UPDATE_BG_ATTR: MACRO
	
	ld	a,[sine_plasma_dma_copy_ready]
	and	a,a
	jr	z,.skip
	
	ld	a,0
	ld	[sine_plasma_dma_copy_ready],a
	
	ld	a,0
	ld	[rVBK],a

	DMA_COPY	MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ld	a,1
	ld	[rVBK],a

	DMA_COPY	ATTR_MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ld	a,0
	ld	[rVBK],a
.skip:

ENDM

;----------------------------------------------

sine_plasma_vbl_handler:
	
	SINE_PLASMA_MAP_UPDATE_BG_ATTR
	
	LONG_CALL	gbt_update
	
	ret

;----------------------------------------------
	
	GLOBAL Sine_Plasma
	
Sine_Plasma:

	ld	a,LCDCF_ON|LCDCF_WINON|LCDCF_WIN9C00 ; use window to hide things
	ld	[rLCDC],a
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,16
	ld	hl,sine_plasma_tiles
	ld	de,$0100 ;  de = start index
	call	vram_copy_tiles
	
	ld	bc,14
	ld	hl,sine_plasma_sprite_tiles
	ld	de,$0000 ;  de = start index
	call	vram_copy_tiles

	call	sine_plasma_setup_sprites

	call	sine_plasma_values_init	
	
	ld	b,$90
	call	wait_ly

	call	sine_plasma_map_draw
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,sine_plasma_vbl_handler
	call	irq_set_VBL
	
	call	wait_vbl
	
	; Load palettes and configure IRQs
	
	ld	b,$90
	call	wait_ly
	
	ld	a,0
	ld	hl,sine_plasma_background_palettes
	call	bg_set_palette
	ld	a,1
	call	bg_set_palette
	ld	a,2
	call	bg_set_palette
	ld	a,3
	call	bg_set_palette
	
	ld	a,0
	ld	hl,sine_plasma_sprites_palette
	call	spr_set_palette
	
	ld	a,LCDCF_ON|LCDCF_BG8800|LCDCF_BG9800|LCDCF_OBJON|LCDCF_OBJ16 ; configuration
	ld	[rLCDC],a
	
	; START	
	
.loop: ; Main loop
	
	call	sine_plasma_map_draw
	call	sine_plasma_handle_events
	
	;call	wait_vbl
	
	ld	a,[sine_plasma_exit_demo]
	and	a,a
	jr	z,.loop
	
	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

