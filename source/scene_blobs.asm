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

	SECTION "BLOBS_DATA", DATA, BANK[2]

blobs_palettes: ; 0 - 8
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0400,$0400,$0820
	DW $0C20,$0C41,$0C62,$0C62,$0C63,$0C63,$0C63,$0C63
	DW $0C63,$0C63,$0C63,$0C63,$0C63,$0C63,$0C63,$0C63

	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0400,$0400,$0400,$0400,$0400,$0800,$0C20,$1440
	DW $1C60,$1CA2,$1CC4,$1CC5,$1CE6,$1CE6,$1CE6,$1CE6
	DW $1CE6,$1CE7,$1CE7,$1CE7,$1CE7,$1CE7,$1CE7,$1CE7

	DW $0000,$0000,$0000,$0000,$0000,$0400,$0400,$0400
	DW $0400,$0400,$0400,$0800,$0800,$0C20,$1440,$1C60
	DW $2CA0,$2CE4,$2D26,$2D48,$2D49,$2D49,$2D69,$2D6A
	DW $2D6A,$2D6A,$2D6A,$2D6A,$2D6A,$2D6B,$2D6B,$2D6B

	DW $0400,$0400,$0400,$0400,$0400,$0400,$0400,$0400
	DW $0800,$0800,$0800,$0C00,$0C20,$1020,$1840,$2880
	DW $3CE0,$3D45,$3D89,$3DAA,$3DCC,$3DCC,$3DCD,$3DED
	DW $3DED,$3DEE,$3DEE,$3DEE,$3DEE,$3DEE,$3DEE,$3DEE

	DW $0400,$0400,$0400,$0400,$0400,$0400,$0400,$0800
	DW $0800,$0800,$0C00,$0C20,$1020,$1840,$2060,$30A0
	DW $4D00,$4DA7,$4DEB,$4E2D,$4E2F,$4E4F,$4E50,$4E51
	DW $4E71,$4E71,$4E71,$4E72,$4E72,$4E72,$4E72,$4E72

	DW $0400,$0400,$0400,$0400,$0400,$0800,$0800,$0800
	DW $0C00,$0C00,$0C20,$1020,$1420,$1C40,$2880,$3CC0
	DW $5D40,$5DE8,$5E4D,$5E90,$5EB2,$5EB3,$5ED3,$5ED4
	DW $5ED4,$5EF5,$5EF5,$5EF5,$5EF5,$5EF6,$5EF6,$5EF6

	DW $0400,$0400,$0400,$0800,$0800,$0800,$0800,$0C00
	DW $0C00,$0C00,$1020,$1420,$1840,$2060,$2C80,$44E0
	DW $6D80,$6E49,$6EAF,$6EF3,$6F15,$6F36,$6F57,$6F57
	DW $6F58,$6F58,$6F79,$6F79,$6F79,$6F79,$6F79,$6F79

	DW $0800,$0800,$0800,$0800,$0800,$0800,$0C00,$0C00
	DW $1000,$1020,$1420,$1820,$1C40,$2460,$34A0,$5100
	DW $7DC0,$7EAB,$7F32,$7F75,$7F98,$7FB9,$7FBA,$7FDB
	DW $7FDB,$7FDC,$7FFC,$7FFC,$7FFD,$7FFD,$7FFD,$7FFD


blobs_tiles: ; 4 tiles
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $00,$FF,$00,$FF,$00,$FF,$00,$FF
DB $00,$FF,$00,$FF,$00,$FF,$00,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

blobs_sprite_tiles: ; 12 tiles
DB $FF,$FF,$FE,$81,$FF,$80,$FD,$9E
DB $F3,$92,$FD,$9E,$FF,$80,$FE,$81
DB $FF,$80,$FD,$9E,$F3,$92,$F3,$92
DB $FD,$9E,$FF,$80,$FE,$81,$FF,$FF
DB $78,$78,$F8,$C8,$78,$C8,$F8,$48
DB $F8,$48,$F8,$48,$78,$C8,$F8,$C8
DB $78,$C8,$F8,$48,$F8,$48,$F8,$48
DB $FF,$4F,$7F,$C0,$FF,$C0,$7F,$7F
DB $0F,$0F,$17,$18,$2F,$30,$3B,$27
DB $3C,$24,$3C,$24,$3C,$24,$3C,$24
DB $3C,$24,$3C,$24,$3C,$24,$3C,$24
DB $FB,$E7,$EF,$30,$F7,$38,$EF,$EF
DB $DF,$DF,$BF,$70,$DF,$30,$7F,$93
DB $FE,$92,$FF,$93,$FF,$90,$FF,$90
DB $FF,$90,$FF,$93,$FE,$92,$FE,$92
DB $7F,$93,$DF,$30,$BF,$70,$DF,$DF
DB $E3,$E3,$D5,$36,$EB,$1C,$BE,$C9
DB $7F,$49,$BF,$C9,$EF,$19,$DB,$3C
DB $ED,$1E,$BB,$CB,$78,$48,$7F,$4F
DB $BE,$C9,$EB,$1C,$D5,$36,$E3,$E3
DB $F0,$F0,$E8,$18,$F4,$0C,$DC,$E4
DB $3C,$3C,$00,$00,$F0,$F0,$E8,$18
DB $F4,$0C,$FC,$E4,$3C,$24,$3C,$24
DB $DC,$E4,$F4,$0C,$E8,$18,$F0,$F0

blobs_sprites_palette:
	DW	$0000,$7FFF,$3DEF,$0000

	SECTION "BLOBS_DATA_2",ROMX[$7F00],BANK[2]

blobs_texture:
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$02,$03,$04,$04,$03,$02,$00,$00,$00,$00,$00
DB $00,$00,$00,$01,$04,$06,$07,$08,$08,$07,$06,$04,$01,$00,$00,$00
DB $00,$00,$01,$04,$07,$09,$0B,$0C,$0C,$0B,$09,$07,$04,$01,$00,$00
DB $00,$00,$04,$07,$0A,$0D,$0F,$10,$10,$0F,$0D,$0A,$07,$04,$00,$00
DB $00,$02,$06,$09,$0D,$10,$12,$14,$14,$12,$10,$0D,$09,$06,$02,$00
DB $00,$03,$07,$0B,$0F,$12,$16,$18,$18,$16,$12,$0F,$0B,$07,$03,$00
DB $00,$04,$08,$0C,$10,$14,$18,$1C,$1C,$18,$14,$10,$0C,$08,$04,$00
DB $00,$04,$08,$0C,$10,$14,$18,$1C,$1C,$18,$14,$10,$0C,$08,$04,$00
DB $00,$03,$07,$0B,$0F,$12,$16,$18,$18,$16,$12,$0F,$0B,$07,$03,$00
DB $00,$02,$06,$09,$0D,$10,$12,$14,$14,$12,$10,$0D,$09,$06,$02,$00
DB $00,$00,$04,$07,$0A,$0D,$0F,$10,$10,$0F,$0D,$0A,$07,$04,$00,$00
DB $00,$00,$01,$04,$07,$09,$0B,$0C,$0C,$0B,$09,$07,$04,$01,$00,$00
DB $00,$00,$00,$01,$04,$06,$07,$08,$08,$07,$06,$04,$01,$00,$00,$00
DB $00,$00,$00,$00,$00,$02,$03,$04,$04,$03,$02,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

;-------------------------------------------------------------------------------------------------

	SECTION	"Blobs_Vars",BSS

; ---------------------------

blobs_exit_demo:	DS	1 ; set to 1 to exit this effect
blobs_event_count:	DS	2
blobs_current_event:	DS	2 ; pointer to the next event

blobs_refresh_oam_needed:	DS	1

blobs_1_x:	DS	1
blobs_1_y:	DS	1
blobs_2_x:	DS	1
blobs_2_y:	DS	1
blobs_3_x:	DS	1
blobs_3_y:	DS	1

blobs_1_pos_index:	DS	1
blobs_2_pos_index:	DS	1
blobs_3_pos_index:	DS	1

blobs_bg_dma_copy_ready:	DS	1

blobs_has_to_change_palette:	DS	1
blobs_current_palette:			DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Blobs", CODE, BANK[2]

;----------------------------------------------

blobs_init_variables:

	ld	a,0
	ld	[blobs_exit_demo],a
	
	ld	a,0
	ld	[blobs_refresh_oam_needed],a
	
	ld	a,0
	ld	[blobs_bg_dma_copy_ready],a
	
	; Black palette
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,0
	ld	[blobs_current_palette],a
	
	ld	a,0
	ld	[blobs_1_pos_index],a
	ld	[blobs_2_pos_index],a
	ld	[blobs_3_pos_index],a
	
	call	blobs_calculate_positions_and_handle
	
	; Calling blobs_calculate_positions_and_handle increases indexes, so reset them again
	
	ld	a,0
	ld	[blobs_1_pos_index],a
	ld	[blobs_2_pos_index],a
	ld	[blobs_3_pos_index],a
	
	; ----
	
	ld	a,0
	ld	[blobs_event_count],a
	ld	[blobs_event_count+1],a
	
	ld	hl,_event_table_blobs
	ld	a,h
	ld	[blobs_current_event],a
	ld	a,l
	ld	[blobs_current_event+1],a

	ret

;----------------------------------------------

_event_exit_blobs_demo:
	ld	a,1
	ld	[blobs_exit_demo],a
	ret

_event_load_pal_blobs_0:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,0
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_1:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,1
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_2:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,2
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_3:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,3
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_4:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,4
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_5:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,5
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_6:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,6
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_7:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,7
	ld	[blobs_current_palette],a
	ret

_event_load_pal_blobs_8:
	ld	a,1
	ld	[blobs_has_to_change_palette],a
	ld	a,8
	ld	[blobs_current_palette],a
	ret

;-------------------

_event_table_blobs:
	DW	1,_event_load_pal_blobs_0
	DW	2,_event_load_pal_blobs_1
	DW	3,_event_load_pal_blobs_2
	DW	4,_event_load_pal_blobs_3
	DW	5,_event_load_pal_blobs_4
	DW	6,_event_load_pal_blobs_5
	DW	7,_event_load_pal_blobs_6
	DW	8,_event_load_pal_blobs_7
	DW	9,_event_load_pal_blobs_8
	
	DW	241,_event_load_pal_blobs_7
	DW	242,_event_load_pal_blobs_6
	DW	243,_event_load_pal_blobs_5
	DW	244,_event_load_pal_blobs_4
	DW	245,_event_load_pal_blobs_3
	DW	246,_event_load_pal_blobs_2
	DW	247,_event_load_pal_blobs_1
	DW	248,_event_load_pal_blobs_0
	
	DW	250,_event_exit_blobs_demo

	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

blobs_handle_events:

	; Update blobs
	; ------------
	
	call	blobs_calculate_positions_and_handle
	
	; Handle events
	; -------------
	
	ld	a,[blobs_event_count]
	ld	e,a
	ld	a,[blobs_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[blobs_current_event]
	ld	h,a
	ld	a,[blobs_current_event+1]
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
	ld	[blobs_current_event],a
	ld	a,l
	ld	[blobs_current_event+1],a ; save pointer to next event
	
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
	
	ld	a,[blobs_event_count]
	ld	l,a
	ld	a,[blobs_event_count+1]
	ld	h,a
	
	ld	de,$0001 ; to avoid OAM bug (It shouldn't reach such high values, but do it anyway...)
	add	hl,de
	
	ld	a,l
	ld	[blobs_event_count],a
	ld	a,h
	ld	[blobs_event_count+1],a
	
	ret

;----------------------------------------------

blobs_palette_load:
	
	ld	a,[blobs_has_to_change_palette]
	and	a,a
	ret	z
	
	ld	a,0
	ld	[blobs_has_to_change_palette],a
	
	ld	a,[blobs_current_palette]
	
	ld	l,a
	ld	h,0 ; hl = palette number

.wait:
	ld	a,[rLY]
	cp	a,$90
	jr	c,.wait
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl ; hl = a * 64
	
	ld	de,blobs_palettes
	add	hl,de  ; hl = blobs_palettes + a * 64
	
	ld	a,$80 ; auto increment
	ld	[rBCPS],a
	
	ld	c,(rBCPD&$FF)
	REPT	4*8
	ld	a,[hl+]
	ld	[$FF00+c],a
	ld	a,[hl+]
	ld	[$FF00+c],a
	ENDR

	ret

;----------------------------------------------

BLOBS_SET_TILE_COMBINED: MACRO ; b = x, c = y, a = tile
	
	ld	d,COMBINED_MAP_TEMP >> 8
	ld	e,b ; de = base + x
	
	ld	l,c
	ld	h,$00 ; hl = y
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl ; hl = y *  32
	
	add	hl,de ; hl = base + x + (y * 32)
	
	ld	[hl],a
	
ENDM

;-------------------------------------------------------------------------------------

blobs_calculate_positions_and_handle:
	
	ld	a,[blobs_1_pos_index]
	ld	h,Cosine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,2
	ld	[blobs_1_x],a
	
	ld	a,[blobs_1_pos_index]
	ld	h,Sine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,1
	ld	[blobs_1_y],a
	
	ld	a,[blobs_1_pos_index]
	add	a,7
	ld	[blobs_1_pos_index],a

	; -------------------------------
	
	ld	a,[blobs_2_pos_index]
	ld	h,Cosine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,2
	ld	[blobs_2_x],a
	
	ld	a,[blobs_2_pos_index]
	sla	a
	sla	a
	ld	h,Sine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,2
	ld	[blobs_2_y],a
	
	ld	a,[blobs_2_pos_index]
	add	a,3
	ld	[blobs_2_pos_index],a

	; -------------------------------
	
	ld	a,[blobs_3_pos_index]
	sla	a
	ld	h,Sine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,2
	ld	[blobs_3_x],a
	
	ld	a,[blobs_3_pos_index]
	ld	h,Sine>>8
	ld	l,a
	ld	a,[hl]
	sra	a
	sra	a
	sra	a
	sra	a
	sub	a,1
	ld	[blobs_3_y],a
	
	ld	a,[blobs_3_pos_index]
	add	a,-7
	ld	[blobs_3_pos_index],a

	ret

;----------------------------------

BLOBS_GET_SUBTILE_TEXTURE_FROM_COORDS: MACRO ; b = x, c = y -> returns a = subtile
	
	ld	a,15
	cp	a,b
	jr	c,.exit\@
	
	cp	a,c
	jr	c,.exit\@
	
	ld	a,c
	and	a,$0F
	swap	a
	ld	c,a
	
	ld	a,b
	and	a,$0F
	or	a,c
	
	ld	h,blobs_texture>>8
	ld	l,a
	
	ld	a,[hl]
	
	jr	.exit_not_zero\@

.exit\@:
	xor	a,a
	
.exit_not_zero\@:

ENDM

;-------------------------------------------------------------------------------------

blobs_map_draw:
	
	ld	a,[blobs_bg_dma_copy_ready]
	and	a,a
	jr	z,.continue ; wait until last frame is copied
	
	halt
	jr	blobs_map_draw
	
.continue:
	
	; Calculate effect
	; ----------------
	
	ld	c,0 ; c = min y
.loopy
	ld	b,0 ; b = min x
.loopx
	push	bc
	
	;----
	
	ld	a,[blobs_1_y]
	add	a,c
	ld	c,a
	
	ld	a,[blobs_1_x]
	add	a,b
	ld	b,a
	
	BLOBS_GET_SUBTILE_TEXTURE_FROM_COORDS

	pop	bc
	push	bc
	
	push	af
	
	ld	a,[blobs_2_y]
	add	a,c
	ld	c,a
	
	ld	a,[blobs_2_x]
	add	a,b
	ld	b,a

	BLOBS_GET_SUBTILE_TEXTURE_FROM_COORDS
	
	ld	b,a
	pop	af
	add	a,b
	
	pop	bc
	push	bc
	
	push	af
	
	ld	a,[blobs_3_y]
	add	a,c
	ld	c,a
	
	ld	a,[blobs_3_x]
	add	a,b
	ld	b,a

	BLOBS_GET_SUBTILE_TEXTURE_FROM_COORDS
	
	ld	b,a
	pop	af
	add	a,b
	
	cp	a,31
	jr	c,.not_overflow
	ld	a,31
.not_overflow:

	pop	bc
	push	bc

	BLOBS_SET_TILE_COMBINED

	;----
	
	pop	bc
	
	inc	b
	ld	a,b
	cp	a,20
	jp	nz,.loopx
	
	inc	c
	ld	a,c
	cp	a,18
	jp	nz,.loopy
	
	; Separate in bg and attr
	; -----------------------
	
	ld	de,0 ; array index
.loop
	
	; Load combined tile
	
	ld	hl,COMBINED_MAP_TEMP
	
	add	hl,de
	ld	a,[hl]
	
	; Split tile and attr
	
	ld	b,a
	sra	a
	sra	a
	and	a,7
	ld	c,a
	
	ld	a,b
	and	a,3 ; a = tile, c = attr
	
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
	
	; Tell the VBL handler to update screen
	
	ld	a,1
	ld	[blobs_bg_dma_copy_ready],a
	
	ret

;----------------------------------------------

blobs_map_update_bg_attr:
	
	ld	a,[blobs_bg_dma_copy_ready]
	and	a,a
	ret	z

	ld	a,0
	ld	[blobs_bg_dma_copy_ready],a
	
	ld	a,1
	ld	[rVBK],a ; should be 20*18, but as there is space between rows, use 32
	DMA_COPY	ATTR_MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma

	ld	a,0
	ld	[rVBK],a ; should be 20*18, but as there is space between rows, use 32
	DMA_COPY	MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ret
;----------------------------------------------

blobs_setup_sprites:
	
	; BLOBS
	
	ld	bc,((8+2)<<8)|(16+2)
	ld	l,0
	call	sprite_set_xy
	ld	bc,((16+2)<<8)|(16+2)
	ld	l,1
	call	sprite_set_xy
	ld	bc,((24+2)<<8)|(16+2)
	ld	l,2
	call	sprite_set_xy
	ld	bc,((32+2)<<8)|(16+2)
	ld	l,3
	call	sprite_set_xy
	ld	bc,((40+2)<<8)|(16+2)
	ld	l,4
	call	sprite_set_xy
	ld	bc,((48+2)<<8)|(16+2)
	ld	l,5
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
	
	; Done!
	
	ret

;----------------------------------------------

blobs_sprite_palette_load:
	
	ld	a,[blobs_refresh_oam_needed]
	and	a,a
	ret	z
	
	xor	a,a
	ld	[blobs_refresh_oam_needed],a
	
	ld	a,0
	ld	hl,blobs_sprites_palette
	call	spr_set_palette
	
	call	refresh_OAM
	
	ret
	
;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

blobs_vbl_handler:
	
	call	blobs_sprite_palette_load
	
	call	blobs_map_update_bg_attr
	
	call	blobs_palette_load
	
	LONG_CALL	gbt_update

	ret

;----------------------------------------------
	
	GLOBAL Blobs
	
Blobs:

	ld	bc,32*32
	ld	d,0
	ld	hl,$9C00
	call	vram_memset ; bc = size    d = value    hl = dest address

	call	blobs_init_variables
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,4
	ld	hl,blobs_tiles
	ld	de,$0100 ;  de = start index
	call	vram_copy_tiles
	
	ld	bc,12
	ld	hl,blobs_sprite_tiles
	ld	de,0 ;  de = start index
	call	vram_copy_tiles
	
	ld	b,$90
	call	wait_ly
	
	call	blobs_map_draw

	call	blobs_setup_sprites
	
	ld	a,1
	ld	[blobs_refresh_oam_needed],a
	
	ld	b,$90
	call	wait_ly
	
	ld	a,0
	call	blobs_palette_load
	
	ld	bc,blobs_vbl_handler
	call	irq_set_VBL
	
	ld	a,LCDCF_ON|LCDCF_BG8800|LCDCF_BG9800|LCDCF_OBJ16|LCDCF_OBJON ; configuration
	ld	[rLCDC],a
	
	ld	a,$01
	ld	[rIE],a
	
	; START	
	
.loop: ; Main loop
	
	call	blobs_handle_events
	call	blobs_map_draw
	
	call	wait_vbl
	
	ld	a,[blobs_exit_demo]
	and	a,a
	jr	z,.loop

	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

