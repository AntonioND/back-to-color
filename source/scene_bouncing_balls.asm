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

	SECTION "Bouncing_Balls_DATA", DATA, BANK[1]

bouncing_balls_sprite_palettes:
	DW	0, (31<<10)|(31<<5)|(31), (20<<10)|(20<<5)|(20), (10<<10)|(10<<5)|(10)
	DW	0, (27<<10)|(27<<5)|(27), (17<<10)|(17<<5)|(17),    (9<<10)|(9<<5)|(9)
	DW	0, (23<<10)|(23<<5)|(23), (15<<10)|(15<<5)|(15),    (8<<10)|(8<<5)|(8)
	DW	0, (19<<10)|(19<<5)|(19), (13<<10)|(13<<5)|(13),    (7<<10)|(7<<5)|(7)
	DW	0, (15<<10)|(15<<5)|(15), (10<<10)|(10<<5)|(10),    (5<<10)|(5<<5)|(5)
	DW	0, (11<<10)|(11<<5)|(11),    (7<<10)|(7<<5)|(7),    (3<<10)|(3<<5)|(3)
	DW	0,    (7<<10)|(7<<5)|(7),    (5<<10)|(5<<5)|(5),    (1<<10)|(1<<5)|(1)
	DW	0,    (0<<10)|(0<<5)|(0),    (0<<10)|(0<<5)|(0),    (0<<10)|(0<<5)|(0) ; shadow

bouncing_balls_sprite_tiles: ; 2 tiles
DB $18,$24,$3C,$42,$18,$E7,$00,$FF
DB $81,$FF,$C3,$FF,$7E,$7E,$3C,$3C
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$7E,$7E,$FF,$FF,$7E,$7E

;-------------------------------------------------------------------------------------------------

	SECTION	"Bouncing_Balls_Vars",BSS

;----------------------------------------------

BOUNCING_BALLS_NUMBER_OF_BALLS	EQU	32

bouncing_balls_exit_demo:	DS	1 ; set to 1 to exit this effect
bouncing_balls_event_count:	DS	2
bouncing_balls_current_event:	DS	2 ; pointer to the next event

bouncing_balls_update_dma_sprites:	DS	1

bouncing_balls_angle:	DS	1

bouncing_balls_y_offset:	DS	BOUNCING_BALLS_NUMBER_OF_BALLS ; add to Y coordinate
bouncing_balls_z:			DS	BOUNCING_BALLS_NUMBER_OF_BALLS
bouncing_balls_x:			DS	BOUNCING_BALLS_NUMBER_OF_BALLS

bouncing_balls_z_shadow:	DS	16 ; bouncing_balls_z is destroyed when sorting, so use this
; only 16 sprites for shadows needed (but only 8 shown each frame)

bouncing_balls_sorted_x:		DS	BOUNCING_BALLS_NUMBER_OF_BALLS
bouncing_balls_sorted_z:		DS	BOUNCING_BALLS_NUMBER_OF_BALLS
bouncing_balls_sorted_y_offset:	DS	BOUNCING_BALLS_NUMBER_OF_BALLS

bouncing_balls_dissapear_offset:	DS	1 ; add to balls, shadows and floor when disappearing

BOUNCING_BALLS_Y_BALLS		EQU	64
BOUNCING_BALLS_Y_SHADOWS	EQU	128

bouncing_balls_y_offset_function:	DS	2 ; pointer to a function that calculates y offsets

bouncing_balls_show_shadow:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Zoom_Bar", CODE, BANK[1]

;----------------------------------------------

bouncing_balls_init_variables:
	
	ld	a,0
	ld	[bouncing_balls_show_shadow],a
	ld	[bouncing_balls_dissapear_offset],a
	
	ld	a,0
	ld	[bouncing_balls_exit_demo],a
	ld	[bouncing_balls_update_dma_sprites],a
	
	ld	bc,bouncing_balls_y_offset_fn_none
	call	bouncing_balls_set_y_offset_fn
	
	ld	a,0
	ld	[bouncing_balls_event_count],a
	ld	[bouncing_balls_event_count+1],a
	
	ld	hl,_event_table_bouncing_balls
	ld	a,h
	ld	[bouncing_balls_current_event],a
	ld	a,l
	ld	[bouncing_balls_current_event+1],a

	ret

;-------------------------------------------------------------------------------------------------

bouncing_balls_set_y_offset_fn: ; bc = fn
	ld	hl,bouncing_balls_y_offset_function
	ld	[hl],c
	inc	hl
	ld	[hl],b
	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_none:
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
	ld	b,BOUNCING_BALLS_NUMBER_OF_BALLS
.loop:	
	ld	[hl+],a
	dec	b
	jr	nz,.loop

	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_none_to_sine_1:
	
	ld	a,[bouncing_balls_angle]
	cpl
	inc	a
	sra	a
	sra	a
	inc	a
	ld	c,a ; c = loop limit
	
	ld	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	cp	a,c
	jr	nc,.not_reached_spr_limit
	ld	c,BOUNCING_BALLS_NUMBER_OF_BALLS
.not_reached_spr_limit:
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
.loop:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	sla	a
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a

	pop	af
	inc	a
	cp	a,c
	jr	nz,.loop

	; fill the rest with 0
	
	ld	b,0
.fillzero:
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ret	z
	ld	[hl],b
	inc	hl
	inc	a
	jr	.fillzero

;----------------------------------------------

bouncing_balls_y_offset_fn_sine_1:
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
.loop:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	sla	a
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a
	
	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.loop
	
	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_sine_1_to_none:

	ld	a,[bouncing_balls_angle]
	cpl
	inc	a
	sra	a
	sra	a
	inc	a
	ld	c,a ; c = loop limit
	
	ld	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	cp	a,c
	jr	nc,.not_reached_spr_limit
	ld	c,BOUNCING_BALLS_NUMBER_OF_BALLS
.not_reached_spr_limit:
	
	; fill with none
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
	ld	b,0
.loop:
	ld	[hl],b
	inc	hl
	inc	a
	cp	a,c
	jr	nz,.loop

	; fill the rest with sine 1
	
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ret	z
	
.loop2:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	sla	a
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a

	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.loop2
	
	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_none_to_sine_2:
	
	ld	a,[bouncing_balls_angle]
	cpl
	inc	a
	sra	a
	sra	a
	inc	a
	ld	c,a ; c = loop limit
	
	ld	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	cp	a,c
	jr	nc,.not_reached_spr_limit
	ld	c,BOUNCING_BALLS_NUMBER_OF_BALLS
.not_reached_spr_limit:
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
.loop:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a

	pop	af
	inc	a
	cp	a,c
	jr	nz,.loop

	; fill the rest with 0
	
	ld	b,0
.fillzero:
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ret	z
	ld	[hl],b
	inc	hl
	inc	a
	jr	.fillzero

;----------------------------------------------

bouncing_balls_y_offset_fn_sine_2:

	ld	hl,bouncing_balls_y_offset
	ld	a,0
.loop:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a
	
	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.loop
	
	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_sine_2_to_none:

	ld	a,[bouncing_balls_angle]
	cpl
	inc	a
	sra	a
	sra	a
	inc	a
	ld	c,a ; c = loop limit
	
	ld	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	cp	a,c
	jr	nc,.not_reached_spr_limit
	ld	c,BOUNCING_BALLS_NUMBER_OF_BALLS
.not_reached_spr_limit:
	
	; fill with none
	
	ld	hl,bouncing_balls_y_offset
	ld	a,0
	ld	b,0
.loop:
	ld	[hl],b
	inc	hl
	inc	a
	cp	a,c
	jr	nz,.loop

	; fill the rest with sine 2
	
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ret	z
	
.loop2:
	push	af

	sla	a
	sla	a
	ld	b,a
	ld	a,[bouncing_balls_angle]
	add	a,b
	ld	d,Sine>>8
	ld	e,a
	ld	a,[de]
	sra	a
	ld	[hl+],a

	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.loop2
	
	ret

;----------------------------------------------

bouncing_balls_y_offset_fn_rise_and_disappear:

	ld	hl,bouncing_balls_y_offset
	ld	a,[bouncing_balls_dissapear_offset]	
	ld	b,BOUNCING_BALLS_NUMBER_OF_BALLS
.loop:
	ld	[hl+],a
	dec	b
	jr	nz,.loop
	
	dec	a
	ld	[bouncing_balls_dissapear_offset],a

	ret

;-------------------------------------------------------------------------------------------------

_event_exit_bouncing_balls_demo:
	ld	a,1
	ld	[bouncing_balls_exit_demo],a
	ret

_event_bouncing_balls_set_y_offset_fn_none:
	ld	bc,bouncing_balls_y_offset_fn_none
	call	bouncing_balls_set_y_offset_fn
	ret

_event_bouncing_balls_set_y_offset_fn_none_to_sine_1:
	xor	a,a
	ld	[bouncing_balls_angle],a
	ld	bc,bouncing_balls_y_offset_fn_none_to_sine_1
	call	bouncing_balls_set_y_offset_fn
	ret
	
_event_bouncing_balls_set_y_offset_fn_sine_1:
	ld	bc,bouncing_balls_y_offset_fn_sine_1
	call	bouncing_balls_set_y_offset_fn
	ret

_event_bouncing_balls_set_y_offset_fn_sine_1_to_none:
	ld	bc,bouncing_balls_y_offset_fn_sine_1_to_none
	call	bouncing_balls_set_y_offset_fn
	ret

_event_bouncing_balls_set_y_offset_fn_none_to_sine_2:
	xor	a,a
	ld	[bouncing_balls_angle],a
	ld	bc,bouncing_balls_y_offset_fn_none_to_sine_2
	call	bouncing_balls_set_y_offset_fn
	ret

_event_bouncing_balls_set_y_offset_fn_sine_2:
	ld	bc,bouncing_balls_y_offset_fn_sine_2
	call	bouncing_balls_set_y_offset_fn
	ret
	
_event_bouncing_balls_set_y_offset_fn_sine_2_to_none:
	ld	bc,bouncing_balls_y_offset_fn_sine_2_to_none
	call	bouncing_balls_set_y_offset_fn
	ret

_event_bouncing_balls_set_y_offset_fn_rise_and_disappear:
	xor	a,a
	ld	[bouncing_balls_dissapear_offset],a
	ld	bc,bouncing_balls_y_offset_fn_rise_and_disappear
	call	bouncing_balls_set_y_offset_fn
	ret

;-------------------

_event_table_bouncing_balls:
EVENT_COUNT	SET	64+48
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_none_to_sine_1
EVENT_COUNT	SET	EVENT_COUNT+128
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_sine_1
EVENT_COUNT	SET	EVENT_COUNT+(256-128)+256
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_sine_1_to_none
EVENT_COUNT	SET	EVENT_COUNT+128
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_none
EVENT_COUNT	SET	EVENT_COUNT+(256-128)
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_none_to_sine_2
EVENT_COUNT	SET	EVENT_COUNT+128
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_sine_2
EVENT_COUNT	SET	EVENT_COUNT+(256-128)+256
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_sine_2_to_none
EVENT_COUNT	SET	EVENT_COUNT+128
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_none
EVENT_COUNT	SET	EVENT_COUNT+128+32
	DW	EVENT_COUNT,_event_bouncing_balls_set_y_offset_fn_rise_and_disappear
EVENT_COUNT	SET	EVENT_COUNT+96
	DW	EVENT_COUNT,_event_exit_bouncing_balls_demo
	
	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

bouncing_balls_handle_events:
	
	; Handle events
	; -------------
	
	ld	a,[bouncing_balls_event_count]
	ld	e,a
	ld	a,[bouncing_balls_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[bouncing_balls_current_event]
	ld	h,a
	ld	a,[bouncing_balls_current_event+1]
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
	ld	[bouncing_balls_current_event],a
	ld	a,l
	ld	[bouncing_balls_current_event+1],a ; save pointer to next event
	
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
	
	ld	a,[bouncing_balls_event_count]
	ld	l,a
	ld	a,[bouncing_balls_event_count+1]
	ld	h,a
	
	inc	hl
	
	ld	a,l
	ld	[bouncing_balls_event_count],a
	ld	a,h
	ld	[bouncing_balls_event_count+1],a
	
	ret

;-------------------------------------------------------------------------------------------------

bouncing_balls_handle_balls:
	
	; Update balls
	; ------------
	
	xor	a,a
.nextspr:
	push	af
	
	sla	a
	sla	a
	sla	a
	sla	a
	ld	hl,bouncing_balls_angle
	add	a,[hl]
	
	ld	h,Sine>>8
	ld	l,a
	ld	b,[hl]
	sra	b
	ld	a,80+8
	add	a,b
	ld	b,a ; b = x
	
	pop	af
	push	af
	
	ld	hl,bouncing_balls_x
	ld	e,a
	ld	d,0
	add	hl,de
	ld	[hl],b
	
	sla	a
	sla	a
	sla	a
	sla	a
	ld	hl,bouncing_balls_angle
	add	a,[hl]

	ld	h,Cosine>>8
	ld	l,a
	ld	c,[hl]
	sra	c
	sra	c
	sra	c
	ld	a,BOUNCING_BALLS_Y_BALLS
	add	a,c
	ld	c,a ; c = y
	
	pop	af
	push	af

	ld	hl,bouncing_balls_z
	ld	e,a
	ld	d,0
	add	hl,de
	ld	[hl],c
	
	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr
	
	; bouncing_balls_z is destroyed when sorting, so save it
	ld	b,16
	ld	hl,bouncing_balls_z
	ld	de,bouncing_balls_z_shadow
	call	memcopy_fast ; b = size    hl = source address    de = dest address
	
	; Calculate Y offset (Effects)
	; ----------------------------

	ld	hl,bouncing_balls_y_offset_function
	ld	a,[hl+]
	ld	h,[hl]
	ld	l,a
	CALL_HL

	; Sort by Z (higher Z goes first)
	; -------------------------------

	; This fills bouncing_balls_sorted_z and bouncing_balls_sorted_x
	; and sets bouncing_balls_z to 0 (least priority)
	
IF 0 ; DON'T SORT
	ld	b,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	hl,bouncing_balls_z
	ld	de,bouncing_balls_sorted_z
	call	memcopy_fast ; b = size    hl = source address    de = dest address
	
	ld	b,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	hl,bouncing_balls_x
	ld	de,bouncing_balls_sorted_x
	call	memcopy_fast ; b = size    hl = source address    de = dest address
	
	ld	b,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	hl,bouncing_balls_y_offset
	ld	de,bouncing_balls_sorted_y_offset
	call	memcopy_fast ; b = size    hl = source address    de = dest address
ENDC

	ld	a,0
.nextsort_outer:
	push	af
	
	; Inner loop start *
	
	ld	hl,bouncing_balls_z
	
	ld	a,[hl+]
	ld	b,a ; b = max z
	ld	c,0 ; c = max z ball index
	
NUM_BALL	SET	1	
	REPT	32-1 ; BOUNCING_BALLS_NUMBER_OF_BALLS - 1

	ld	a,[hl+] ; a = bouncing_balls_z[num of ball]
	
	cp	a,b
	jr	c,.not_higher\@
	ld	b,a ; b = max z
	ld	c,NUM_BALL ; c = max z ball index
.not_higher\@:

NUM_BALL	SET	NUM_BALL+1
	ENDR
	
	; Inner loop end *
	
	pop	af
	
	; a = sorting ball index
	; b = max z
	; c = max z ball index
	
	; Now save that:
	;   bouncing_balls_sorted_z[a] = b
	;   bouncing_balls_sorted_x[a] = etc...
	; Set bouncing_balls_z[c] to 0
	
	ld	e,c
	ld	d,0 ; de = max z ball index
	ld	hl,bouncing_balls_z
	add	hl,de
	ld	[hl],0
	
	ld	hl,bouncing_balls_x
	add	hl,de
	ld	c,[hl] ; c = max z ball -> x coordinate of it
	
	; Save Y offset
	
	push	bc
	
	; a = sorting ball index
	
	ld	hl,bouncing_balls_y_offset
	add	hl,de
	ld	b,[hl]
	
	ld	hl,bouncing_balls_sorted_y_offset
	ld	e,a
	ld	d,0
	add	hl,de
	ld	[hl],b
	
	pop	bc
	
	; a = sorting ball index
	; b = max z
	; c = max z ball -> x coordinate of it
	
	; Now save that:
	;   bouncing_balls_sorted_z[a] = b
	;   bouncing_balls_sorted_x[a] = c
	
	ld	e,a
	ld	d,0
	ld	hl,bouncing_balls_sorted_z
	add	hl,de
	ld	[hl],b
	
	ld	hl,bouncing_balls_sorted_x
	add	hl,de
	ld	[hl],c
	
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jp	nz,.nextsort_outer

	; Change rotation angle
	; ---------------------
	
	ld	hl,bouncing_balls_angle
	dec	[hl]
	
	ret
	
;----------------------------------------------

bouncing_balls_update_sprites:

	; Wait until sprites are copied to OAM
	
	ld	a,[bouncing_balls_update_dma_sprites]
	and	a,a
	jr	z,.update
	
	halt
	jr	bouncing_balls_update_sprites
	
.update:
	
	; Update balls
	; ------------
	
	xor	a,a
.nextspr:
	push	af
	
	ld	hl,bouncing_balls_sorted_x
	ld	e,a
	ld	d,0
	add	hl,de
	ld	b,[hl] ; b = x
	
	ld	hl,bouncing_balls_sorted_z
	add	hl,de
	ld	c,[hl] ; c = z
	
	push	bc
	
	ld	hl,bouncing_balls_sorted_y_offset
	add	hl,de
	ld	a,[hl]
	add	a,c
	ld	c,a ; c = z + y

	ld	l,e
	push	hl
	call	sprite_set_xy
	pop	hl
	pop	bc
	
	ld	a,BOUNCING_BALLS_Y_BALLS
	sub	a,c
	sra	a
	sra	a
	add	a,3
	cp	a,$FF
	jr	nz,.ok
	inc	a ; a = 0
.ok:
	cp	a,7
	jr	nz,.ok2
	dec	a ; a = 6
.ok2:
	call	sprite_set_params
	
	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr
	
	; Handle shadows
	; --------------
	
	ld	a,[bouncing_balls_show_shadow]
	xor	a,1
	ld	[bouncing_balls_show_shadow],a
	
	and	a,1
	jr	z,.shadow_alternative

	xor	a,a
.nextspr2:
	push	af
	
	sla	a
	
	ld	hl,bouncing_balls_x
	ld	e,a
	ld	d,0
	add	hl,de
	ld	b,[hl] ; b = x
	
	ld	hl,bouncing_balls_z_shadow
	add	hl,de
	ld	a,[hl]
	add	a,BOUNCING_BALLS_Y_SHADOWS-BOUNCING_BALLS_Y_BALLS
	ld	hl,bouncing_balls_dissapear_offset
	sub	a,[hl]
	ld	c,a ; c = z
	
	ld	hl,sp+1
	ld	a,[hl] ; pop af/push af

	add	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	l,a
	call	sprite_set_xy

	pop	af
	inc	a
	cp	a,40-BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr2
	
	jr	.end_shadows
	
	;----------------
	
.shadow_alternative:

	xor	a,a
.nextspr3:
	push	af

	sla	a
	inc	a
	
	ld	hl,bouncing_balls_x
	ld	e,a
	ld	d,0
	add	hl,de
	ld	b,[hl] ; b = x
	
	ld	hl,bouncing_balls_z_shadow
	add	hl,de
	ld	a,[hl]
	add	a,BOUNCING_BALLS_Y_SHADOWS-BOUNCING_BALLS_Y_BALLS
	ld	hl,bouncing_balls_dissapear_offset
	sub	a,[hl]
	ld	c,a ; c = z
	
	ld	hl,sp+1
	ld	a,[hl] ; pop af/push af

	add	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	l,a
	call	sprite_set_xy

	pop	af
	inc	a
	cp	a,40-BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr3

	;jr	.end_shadows

.end_shadows:

	; Tell the VBL handler this is ready
	; ----------------------------------
	
	ld	a,1
	ld	[bouncing_balls_update_dma_sprites],a
	
	ret

;----------------------------------------------

bouncing_balls_setup_sprites:

	; Setup tiles
	xor	a,a
.nextspr:
	push	af
	
	ld	l,a
	ld	a,0
	call	sprite_set_tile
	
	pop	af
	push	af
	
	ld	l,a
	ld	a,0
	call	sprite_set_params
	
	pop	af
	inc	a
	cp	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr
	
	; Setup palettes
	
	xor	a,a
.nextspr2:
	push	af

	add	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	l,a
	ld	a,1
	call	sprite_set_tile
	
	pop	af
	push	af
	
	add	a,BOUNCING_BALLS_NUMBER_OF_BALLS
	ld	l,a
	ld	a,7
	call	sprite_set_params
	
	pop	af
	inc	a
	cp	a,40-BOUNCING_BALLS_NUMBER_OF_BALLS
	jr	nz,.nextspr2
	
	ret

;-------------------------------------------------------------------------------------------------

bouncing_balls_lcd_handler:

	ld	a,[rLY]
	cp	a,$89
	ret	nc
	
	inc	a
	inc	a
	ld	[rLYC],a
	
	sub	a,92+2 ; 92 + undo the 2 incs
	ld	hl,bouncing_balls_dissapear_offset
	add	a,[hl]
	and	a,31<<1
	add	a,4 ; a = Blue
	
	rla
	
	ld	h,a
	ld	l,0 ; hl = RGB(0,0,a)

	ld	a,$80 ; auto increment
	ld	[rBCPS],a

	ld	b,2
	ld	c,rSTAT & $FF
.wait_screen_blank:
	ld	a,[$FF00+c]
	and	a,b
	jr	nz,.wait_screen_blank ; Not mode 0 or 1

	ld	c,rBCPD & $FF
	
	ld	a,l
	ld	[$FF00+c],a
	ld	a,h
	ld	[$FF00+c],a
	
	ret

;----------------------------------------------

bouncing_balls_vbl_handler:

	ld	a,92
	ld	hl,bouncing_balls_dissapear_offset
	sub	a,[hl]
	cp	a,144
	jr	c,.no_screen_limit
	ld	a,144
.no_screen_limit:
	ld	[rLYC],a
	
	ld	a,$80 ; auto increment
	ld	[rBCPS],a
	
	ld	c,rBCPD & $FF
	
	xor	a,a
	ld	[$FF00+c],a
	ld	[$FF00+c],a
	
	; ----------------------
	
	ld	a,[bouncing_balls_update_dma_sprites]
	and	a,a
	jr	z,.dont_update_oam
	call	refresh_OAM
	xor	a,a
	ld	[bouncing_balls_update_dma_sprites],a
.dont_update_oam

	; ----------------------
	
	LONG_CALL	gbt_update
	
	ret
	
;-------------------------------------------------------------------------------------------------
	
	GLOBAL Bouncing_Balls
	
Bouncing_Balls:

	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_ON
	ld	[rLCDC],a	
	
	call	bouncing_balls_init_variables
	
	call	bouncing_balls_setup_sprites
	
	; clear screen...

	ld	a,0
	ld	[rVBK],a
	
	ld	bc,2
	ld	hl,bouncing_balls_sprite_tiles
	ld	de,$0000 ;  de = start index
	call	vram_copy_tiles
	
	ld	hl,$8000 + (16 * 256) ; clear tile 0 ($8800 mapping)
	ld	bc,16
	ld	d,$00
	call	vram_memset
	
	ld	hl,$9800
	ld	bc,32*32*2
	ld	d,0	
	call	vram_memset	
	
	ld	a,1
	ld	[rVBK],a
	
	ld	hl,$9800
	ld	bc,32*32*2
	ld	d,0
	call	vram_memset	
	
	; Prepare first frame and setup VBL handler
	
	call	bouncing_balls_handle_balls
	
	call	bouncing_balls_update_sprites
	
	ld	bc,bouncing_balls_vbl_handler
	call	irq_set_VBL
	
	ld	a,$01
	ld	[rIE],a
	
	; Setup HBL IRQ and load palettes
	
	call	wait_vbl
	
	ld	a,0
	ld	hl,bouncing_balls_sprite_palettes
	call	spr_set_palette
	ld	a,1
	call	spr_set_palette
	ld	a,2
	call	spr_set_palette
	ld	a,3
	call	spr_set_palette
	ld	a,4
	call	spr_set_palette
	ld	a,5
	call	spr_set_palette
	ld	a,6
	call	spr_set_palette
	ld	a,7
	call	spr_set_palette

	ld	bc,bouncing_balls_lcd_handler
	call	irq_set_LCD
	
	ld	a,92
	ld	[rLYC],a
	
	ld	a,$03
	ld	[rIE],a
	
	ld	a,STATF_LYC
	ld	[rSTAT],a

	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_OBJON|LCDCF_OBJ8|LCDCF_ON
	ld	[rLCDC],a
	
	; Start...
	; --------
	
.loop:
	
	call	bouncing_balls_handle_events
	
	call	bouncing_balls_handle_balls
	
	call	bouncing_balls_update_sprites
	
	call	wait_vbl

	ld	a,[bouncing_balls_exit_demo]
	and	a,a
	jr	z,.loop

	; Exit...
	; -------
	
	call	demo_config_default
	
	
	ret

