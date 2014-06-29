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

MAP_TEMP			EQU	$D200
ATTR_MAP_TEMP		EQU	$D500 ;($D200 + 32*18) aligned to $100
COMBINED_MAP_TEMP	EQU	$D800 ;($D500 + 32*18) aligned to $100
; Note -> In this effect, columns are off by one in COMBINED_MAP_TEMP

;-------------------------------------------------------------------------------------------------

	SECTION "FIRE_DATA", DATA, BANK[2]

fire_palettes:
	; 0 - Red
	DW $0000,$0003,$0007,$004B,  $006F,$00D3,$0117,$019B,  $01FF,$0E7F,$1EDF,$2F3F,  $3F7F,$4FBF,$5FDF,$6FFF
	DW $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF
	
	; 1 - Inverted red
	DW $7FFF,$7FFC,$7FF8,$7FB4,  $7F90,$7F2C,$7EE8,$7E64,  $7E00,$7180,$6120,$50C0,  $4080,$3040,$2020,$1000
	DW $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000
	
	; 2 - Green
	DW $0000,$0060,$00E0,$0960,  $0DE0,$1A60,$22E0,$3360,  $3FE0,$4FE3,$5BE7,$67EB,  $6FEF,$77F3,$7BF7,$7FFB
	DW $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF
	
	; 3 - Inverted green
	DW $7FFF,$7F9F,$7F1F,$769F,  $721F,$659F,$5D1F,$4C9F,  $401F,$301C,$2418,$1814,  $1010,$080C,$0408,$0004
	DW $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000
	
	; 4 - Blue
	DW $0000,$0C00,$1C00,$2C40,  $3C60,$4CC0,$5D00,$6D80,  $7DE0,$7E63,$7EC7,$7F2B,  $7F6F,$7FB3,$7FD7,$7FFB
	DW $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF,  $7FFF,$7FFF,$7FFF,$7FFF
	
	; 5 - Inverted blue
	DW $7FFF,$73FF,$63FF,$53BF,  $439F,$333F,$22FF,$127F,  $021F,$019C,$0138,$00D4,  $0090,$004C,$0028,$0004
	DW $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000,  $0000,$0000,$0000,$0000
	
	; 6 - Rainbow
	DW $001F,$00FF,$01FF,$02FF,  $03FF,$03F8,$03F1,$03E9,  $03E1,$1BE0,$37E0,$57E0,  $77E0,$7F40,$7E40,$7D40
	DW $7C60,$7C04,$7C0C,$7C14,  $7C1B,$701F,$501F,$301F,  $101F,$001F,$001F,$001F,  $001F,$001F,$001F,$001F
	
	; 7 - Inverted rainbow
	DW $7FE0,$7F00,$7E00,$7D00,  $7C00,$7C07,$7C0E,$7C16,  $7C1E,$641F,$481F,$281F,  $081F,$00BF,$01BF,$02BF
	DW $039F,$03FB,$03F3,$03EB,  $03E4,$0FE0,$2FE0,$4FE0,  $6FE0,$7FE0,$7FE0,$7FE0,  $7FE0,$7FE0,$7FE0,$7FE0

fire_tiles: ; 4 tiles
	DB $00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00
	DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
	DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
	DB $00,$FF,$00,$FF,$00,$FF,$00,$FF
	DB $00,$FF,$00,$FF,$00,$FF,$00,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

fire_sprite_tiles: ; 10 tiles
	DB $FF,$FF,$FE,$81,$FF,$80,$FD,$9E
	DB $F3,$92,$FD,$9E,$FF,$80,$FE,$81
	DB $FF,$80,$FD,$9E,$F3,$92,$F3,$92
	DB $FD,$9E,$FF,$80,$FE,$81,$FF,$FF
	DB $79,$79,$F9,$C9,$79,$C9,$F9,$49
	DB $F9,$49,$F9,$49,$79,$C9,$F9,$C9
	DB $79,$C9,$F9,$49,$F9,$49,$F9,$49
	DB $F6,$4F,$5F,$E0,$AF,$B0,$1F,$1F
	DB $FF,$FF,$FF,$20,$FF,$20,$FF,$27
	DB $FC,$24,$FC,$24,$FC,$24,$FF,$27
	DB $FF,$20,$FF,$20,$FF,$26,$FE,$27
	DB $FD,$25,$BD,$65,$7C,$E4,$BC,$BC
	DB $DE,$DE,$BE,$72,$DE,$32,$7D,$93
	DB $FF,$91,$FE,$91,$FF,$90,$7F,$92
	DB $DE,$33,$BF,$73,$DF,$53,$BE,$72
	DB $FE,$32,$5E,$B2,$FE,$92,$FE,$FE
	DB $78,$78,$78,$48,$78,$48,$78,$48
	DB $78,$48,$F8,$C8,$F8,$C8,$78,$C8
	DB $F8,$48,$F8,$08,$78,$88,$F8,$88
	DB $B8,$C8,$78,$48,$78,$48,$78,$78

fire_sprites_palette:
	DW	$0000,$7FFF,$3DEF,$0000

;-------------------------------------------------------------------------------------------------

	SECTION	"Fire_Vars",BSS

; ---------------------------

fire_exit_demo:	DS	1 ; when 1, exit this part of the demo

fire_bg_copy_dma_ready:	DS	1

fire_has_to_refresh_oam:	DS	1

fire_multiply_value:	DS	1 ; 64 is the upper limit. 60 is a good value

fire_current_palette:	DS	1

fire_is_rising:		DS	1
fire_is_going_down:	DS	1

fire_event_count:	DS	2
fire_current_event:	DS	2 ; pointer to the next event

fire_invert_palette:		DS	1 ; if not 0, event handler has to invert palettes and set counter to this value
fire_count_to_invert_pal:	DS	1 ; when it reaches 0, return to normal palette

fire_randomize_function:	DS	2 ; pointer to current randomize pattern function

fire_randomize_bottom_light_coord:	DS	1 ; for fire_map_randomize_moving_lights_bottom
fire_randomize_bottom_light_dir:	DS	1 ; for fire_map_randomize_moving_lights_bottom

;-------------------------------------------------------------------------------------------------

	SECTION "Fire", CODE, BANK[2]

;----------------------------------------------

fire_init_variables:

	ld	a,0
	ld	[fire_exit_demo],a
	
	ld	[fire_bg_copy_dma_ready],a
	ld	[fire_has_to_refresh_oam],a
	
	ld	[fire_is_rising],a
	ld	[fire_is_going_down],a
	
	ld	[fire_current_palette],a
	
	ld	[fire_multiply_value],a
	
	ld	[fire_invert_palette],a
	ld	[fire_count_to_invert_pal],a
	
	ld	a,0
	ld	[fire_event_count],a
	ld	[fire_event_count+1],a
	
	ld	hl,_event_table_fire
	ld	a,h
	ld	[fire_current_event],a
	ld	a,l
	ld	[fire_current_event+1],a
	
	ld	de,fire_map_randomize_1_light
	call	fire_map_set_randomize_fire_function

	ret

;----------------------------------------------

_event_fire_rise:
	ld	a,1
	ld	[fire_is_rising],a
	ret

_event_fire_set_max_height:
	ld	a,57
	ld	[fire_multiply_value],a
	ret

_event_fire_go_down:
	ld	a,1
	ld	[fire_is_going_down],a
	ret

_event_fire_stop_rise_and_stop_go_down:
	ld	a,0
	ld	[fire_is_going_down],a
	ld	[fire_is_rising],a
	ret

_event_fire_invert_palettes_short:
	ld	a,2
	ld	[fire_invert_palette],a
	ret

_event_fire_invert_palettes_med:
	ld	a,4
	ld	[fire_invert_palette],a
	ret

_event_fire_invert_palettes_long:
	ld	a,10
	ld	[fire_invert_palette],a
	ret

_event_fire_set_red_palette:
	ld	a,0
	call	fire_palette_load
	ret

_event_fire_set_green_palette:
	ld	a,2
	call	fire_palette_load
	ret

_event_fire_set_blue_palette:
	ld	a,4
	call	fire_palette_load
	ret

_event_fire_set_red_inv_palette:
	ld	a,1
	call	fire_palette_load
	ret

_event_fire_set_green_inv_palette:
	ld	a,3
	call	fire_palette_load
	ret

_event_fire_set_blue_inv_palette:
	ld	a,5
	call	fire_palette_load
	ret
	
_event_fire_set_rainbow_palette:
	ld	a,6
	call	fire_palette_load
	ret

_event_fire_set_rainbow_inv_palette:
	ld	a,7
	call	fire_palette_load
	ret

_event_set_randomize_1_light:
	ld	de,fire_map_randomize_1_light
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_set_randomize_2_lights:
	ld	de,fire_map_randomize_2_lights
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_set_randomize_2_lights_bottom_mini:
	ld	de,fire_map_randomize_2_lights_bottom
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_set_randomize_bottom_mini:
	ld	de,fire_map_randomize_bottom_mini
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_set_randomize_bottom_full:
	ld	de,fire_map_randomize_bottom_full
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_set_randomize_bottom_moving:
	call	fire_fire_map_randomize_moving_lights_bottom_init
	ld	de,fire_map_randomize_moving_lights_bottom
	call	fire_map_set_randomize_fire_function ; de = function
	ret

_event_exit_fire_demo:
	ld	a,1
	ld	[fire_exit_demo],a
	ret

;-------------------

_event_table_fire:
	
	; pattern 0
	DW	1,_event_fire_set_max_height
	DW	115,_event_set_randomize_2_lights
	
	; pattern 1
	DW	225,_event_set_randomize_2_lights_bottom_mini
	
	DW	330,_event_fire_go_down
	DW	355,_event_set_randomize_bottom_mini
	DW	356,_event_fire_stop_rise_and_stop_go_down
	DW	357,_event_fire_rise
	DW	370,_event_fire_stop_rise_and_stop_go_down
	DW	420,_event_fire_rise

	; pattern 2
	DW	450,_event_fire_invert_palettes_med
	DW	451,_event_set_randomize_bottom_full
	
	DW	478,_event_fire_invert_palettes_med
	DW	479,_event_fire_set_green_inv_palette
	
	DW	506,_event_fire_invert_palettes_med
	DW	507,_event_fire_set_red_inv_palette
	
	DW	534,_event_fire_invert_palettes_med
	DW	535,_event_fire_set_blue_inv_palette

	DW	562,_event_fire_invert_palettes_med
	DW	563,_event_fire_set_red_inv_palette

	DW	590,_event_fire_invert_palettes_med
	DW	591,_event_fire_set_rainbow_inv_palette
	
	DW	618,_event_fire_invert_palettes_med
	DW	619,_event_fire_set_red_inv_palette
	
	DW	646,_event_fire_invert_palettes_med
	DW	647,_event_fire_go_down

	; pattern 3
	
	DW	674,_event_set_randomize_bottom_moving
	DW	675,_event_fire_set_max_height

	DW	690,_event_fire_set_red_inv_palette

	DW	706,_event_fire_set_green_palette

	DW	724,_event_fire_set_green_inv_palette

	DW	738,_event_fire_set_blue_palette

	DW	754,_event_fire_set_blue_inv_palette

	DW	770,_event_fire_set_red_palette
	
	DW	775,_event_set_randomize_bottom_full
	
	DW	855,_event_fire_go_down
	
	DW	885,_event_exit_fire_demo

	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

fire_handle_events:
	
	; Handle events
	; -------------
	
	ld	a,[fire_event_count]
	ld	e,a
	ld	a,[fire_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[fire_current_event]
	ld	h,a
	ld	a,[fire_current_event+1]
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
	ld	[fire_current_event],a
	ld	a,l
	ld	[fire_current_event+1],a ; save pointer to next event
	
	ld	h,b
	ld	l,c ; hl = ptr to function
	
	CALL_HL
._exit_check_events:

	; Now, handle fire functions...
	; -----------------------------
	
	; Check if rising
	ld	a,[fire_is_rising]
	and	a,a
	jr	z,._not_rising
	
	ld	hl,fire_multiply_value
	inc	[hl]
	inc	[hl]
	inc	[hl]
	
	ld	a,57
	cp	a,[hl]
	jr	nz,._not_rising
	xor	a,a
	ld	[fire_is_rising],a
	
._not_rising
	
	; Check if going down
	ld	a,[fire_is_going_down]
	and	a,a
	jr	z,._not_going_down
	
	ld	hl,fire_multiply_value
	dec	[hl]
	dec	[hl]
	dec	[hl]
	
	ld	a,0
	cp	a,[hl]
	jr	nz,._not_going_down
	xor	a,a
	ld	[fire_is_going_down],a
	
._not_going_down
	
	; Check if it is needed to invert palette
	
	ld	a,[fire_invert_palette]
	and	a,a
	jr	z,._not_inverting_palette
	
	ld	a,[fire_current_palette]
	xor	a,$01
	
	call	fire_palette_load
	
	ld	a,[fire_invert_palette] ; the value here is the number of steps to wait
	ld	[fire_count_to_invert_pal],a
	
	xor	a,a
	ld	[fire_invert_palette],a
	
._not_inverting_palette
	
	; Check if it is needed to invert palette with countdown
	
	ld	a,[fire_count_to_invert_pal]
	and	a,a
	jr	z,._not_inverting_palette_countdown
	
	dec	a
	ld	[fire_count_to_invert_pal],a
	
	and	a,a
	
	jr	nz,._not_inverting_palette_countdown ; exit

	ld	a,[fire_current_palette]
	xor	a,$01
	call	fire_palette_load
	
._not_inverting_palette_countdown
	
	; More checks here
	
	; ...
	
	; Increase counter
	; ----------------
	
	ld	a,[fire_event_count]
	ld	l,a
	ld	a,[fire_event_count+1]
	ld	h,a
	
	inc	hl
	
	ld	a,l
	ld	[fire_event_count],a
	ld	a,h
	ld	[fire_event_count+1],a
	
	ret

;----------------------------------------------

fire_palette_load: ; a = palette number
	
	ld	[fire_current_palette],a
	
.wait:
	ld	a,[rLY]
	cp	a,$90
	jr	c,.wait
	
	ld	a,[fire_current_palette]
	
	ld	l,a
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl ; hl = a * 64
	
	ld	de,fire_palettes
	add	hl,de  ; hl = fire_palettes + a * 64
	
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

FIRE_GET_TILE_COMBINED_PTR: MACRO ; b = x, c = y, hl = returned tile pointer
	
	inc	b
	
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

ENDM

;-------------------------------------------------------------------------------------

fire_map_randomize_bottom_full:
	
	; Randomize botton row
	; --------------------
	
	ld	b,0
	ld	c,18 ; randomized row is just below the screen
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	ld	b,15
	ld	c,16
	
	REPT	20
	call	GetRandom ; doesn't destroy contents of DE or BC
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	ENDR
	
	ld	hl,12
	add	hl,de ; add 12 to go to next row
	ld	d,h
	ld	e,l ; de = tile pointer - randomized row is just below the screen + 1
	
	;ld	b,15
	;ld	c,16
	
	REPT	20
	call	GetRandom ; doesn't destroy contents of DE or BC
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	ENDR
	
	ret

;----------------------------------------------

fire_map_randomize_clear_bottom_rows:
	
	; Randomize botton row
	; --------------------
	
	ld	b,0
	ld	c,18 ; randomized row is just below the screen
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	
	xor	a,a
	REPT	20
	ld	[hl+],a
	ENDR
	
	ld	de,12
	add	hl,de ; new row - randomized row is just below the screen + 1
	
	REPT	20
	ld	[hl+],a
	ENDR
	
	ret

;----------------------------------------------

fire_map_randomize_bottom_mini:
	
	call	fire_map_randomize_clear_bottom_rows
	
	ld	b,6
	ld	c,18 ; randomized row is just below the screen
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	ld	b,15
	ld	c,16
	
	REPT	7
	call	GetRandom ; doesn't destroy contents of DE or BC
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	ENDR
	
	ret

;----------------------------------------------

fire_map_randomize_1_light:
	
	call	fire_map_randomize_clear_bottom_rows
	
	ld	b,2
	ld	c,11
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	ld	b,15
	ld	c,16
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a

	ret

;----------------------------------------------

fire_map_randomize_2_lights:
	
	call	fire_map_randomize_clear_bottom_rows

fire_map_randomize_2_lights_dont_clear_bottom: ; used by fire_map_randomize_2_lights_bottom

	; 1
	
	ld	b,2
	ld	c,11
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	ld	b,15
	ld	c,16
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	
	; 2
	
	ld	b,16
	ld	c,9
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	ld	b,15
	ld	c,16
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	
	call	GetRandom
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a

	ret

;----------------------------------------------

fire_map_randomize_2_lights_bottom:
	
	call	fire_map_randomize_bottom_mini
	
	jr	fire_map_randomize_2_lights_dont_clear_bottom

;----------------------------------------------

FIRE_BOTTOM_MIN_X	EQU	2*2
FIRE_BOTTOM_SIZE	EQU	8
FIRE_BOTTOM_MAX_X	EQU (20-8-2)*2 ;(20-FIRE_BOTTOM_SIZE-FIRE_BOTTOM_MIN_X)*2

fire_fire_map_randomize_moving_lights_bottom_init:
	
	ld	a,4
	ld	[fire_randomize_bottom_light_coord],a
	
	ld	a,1
	ld	[fire_randomize_bottom_light_dir],a
	
	ret

;---------------------

fire_map_randomize_moving_lights_bottom:
	
	call	fire_map_randomize_clear_bottom_rows
	
	; ----
	
	ld	a,[fire_randomize_bottom_light_coord]
	sra	a
	
	ld	b,a
	ld	c,18 ; randomized row is just below the screen
	FIRE_GET_TILE_COMBINED_PTR ; b = x, c = y, hl = returned tile pointer
	ld	d,h
	ld	e,l ; de = tile pointer
	
	REPT	7
	call	GetRandom ; doesn't destroy contents of DE or BC
	and	a,b
	add	a,c ; random between 16 and 31
	ld	[de],a
	inc	de
	ENDR

	; ----

	ld	a,[fire_randomize_bottom_light_coord]
	ld	hl,fire_randomize_bottom_light_dir
	add	a,[hl]
	ld	[fire_randomize_bottom_light_coord],a
	cp	a,FIRE_BOTTOM_MAX_X
	jr	nz,.exit
	ld	a,-1
	ld	[hl],a
.exit:
	cp	a,FIRE_BOTTOM_MIN_X
	jr	nz,.exit2
	ld	a,1
	ld	[hl],a
.exit2:
	
	ret

;----------------------------------------------

fire_map_set_randomize_fire_function: ; de = function
	
	ld	hl,fire_randomize_function
	ld	[hl],d
	inc hl
	ld	[hl],e
	
	ret

;-------------------------------------------------------------------------------------

fire_map_handle:
	
	; Wait until maps are copied to VRAM
	
	ld	a,[fire_bg_copy_dma_ready]
	and	a,a
	jr	z,.update
	
	halt
	jr	fire_map_handle
	
.update:

	; Just set tiles with values from 0-31
	; When finished calculating, split in tile index and palette
	
	; http://lodev.org/cgtutor/fire.html
	
	ld	hl,fire_randomize_function
	ld	a,[hl+]
	ld	l,[hl]
	ld	h,a
	
	CALL_HL
	
	; Calculate effect
	; ----------------

	ld	c,0 ; c = y
.loopy
	ld	b,0 ; b = x
.loopx
	push	bc
	
	;----
	
	inc	c
	dec	b
	
	; -------
	; | |X| |
	; -------
	; |L|C|R| X = ( (L+C+R+D) * fire_multiply_value ) / 256
	; -------
	; | |D| |	
	; -------
	
	FIRE_GET_TILE_COMBINED_PTR
	
	ld	a,[hl+]
	add	a,[hl]
	inc	hl
	add	a,[hl]
	
	ld	bc,31
	add	hl,bc ; next row, x-1, y+1
	
	add	a,[hl]
	
	ld	bc,-31-32-1
	add	hl,bc ; return to the tile that is being calculated
	push	hl
	
	; Divide by some number higher than 4
	
	ld	c,a
	ld	a,[fire_multiply_value] ; hl = a * c -- [fire_multiply_value] is a bit less than 64
	call	mul_u8u8u16 ; hl = returned value    a,c = initial values
	
	ld	a,h ; a = hl/256 (just get the higher byte)
	
	pop	hl
	ld	[hl],a
	
	;----
	
	pop	bc
	
	inc	b
	ld	a,20
	cp	a,b
	jr	nz,.loopx
	
	inc	c
	ld	a,18
	cp	a,c
	jr	nz,.loopy

	; Split tile index and palette
	; ----------------------------
	
	ld	de,0 ; array index
.loop
	
	; Load combined tile
	
	ld	hl,COMBINED_MAP_TEMP+1 ; Columns are off by 1
	
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
	
	; Tell the VBL handler to copy
	ld	a,1
	ld	[fire_bg_copy_dma_ready],a
	
	ret
	
;----------------------------------------------

fire_map_clear:
	
	ld	bc,32*18
	ld	d,0
	ld	hl,MAP_TEMP
	call	memset
	
	ld	bc,32*18
	ld	d,0
	ld	hl,ATTR_MAP_TEMP
	call	memset
	
	ld	bc,32*32
	ld	d,0
	ld	hl,COMBINED_MAP_TEMP
	call	memset
	
	ret
	
;----------------------------------------------

fire_map_update_bg_attr:
	
	ld	a,[fire_bg_copy_dma_ready]
	and	a,a
	ret	z
	
	ld	a,0
	ld	[fire_bg_copy_dma_ready],a
	
	ld	a,1
	ld	[rVBK],a
	DMA_COPY	ATTR_MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ld	a,0
	ld	[rVBK],a
	DMA_COPY	MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ret

;----------------------------------------------

fire_setup_sprites:
	
	; BURN
	
	ld	bc,((131-2)<<8)|(16+2)
	ld	l,0
	call	sprite_set_xy
	ld	bc,((139-2)<<8)|(16+2)
	ld	l,1
	call	sprite_set_xy
	ld	bc,((147-2)<<8)|(16+2)
	ld	l,2
	call	sprite_set_xy
	ld	bc,((155-2)<<8)|(16+2)
	ld	l,3
	call	sprite_set_xy
	ld	bc,((163-2)<<8)|(16+2)
	ld	l,4
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
	
	; Done!
	
	ld	a,1
	ld	[fire_has_to_refresh_oam],a
	
	ret

;----------------------------------------------
	
fire_refresh_oam:

	ld	a,[fire_has_to_refresh_oam]
	and	a,a
	ret	z
	
	xor	a,a
	ld	[fire_has_to_refresh_oam],a
	
	;------------------
	
	call	refresh_OAM
	
	;------------------
	
	ld	hl,fire_sprites_palette
	
	ld	a,$80 ; auto increment
	ld	[rOCPS],a
	
	ld	c,(rOCPD&$FF)
	REPT	4
	ld	a,[hl+]
	ld	[$FF00+c],a
	ld	a,[hl+]
	ld	[$FF00+c],a
	ENDR

	ret
	
;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

fire_vbl_handler:
	
	call	fire_refresh_oam
	
	call	fire_map_update_bg_attr
	
	LONG_CALL	gbt_update
	
	ret

;----------------------------------------------
	
	GLOBAL Fire
	
Fire:

	call	fire_init_variables
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,4
	ld	hl,fire_tiles
	ld	de,$0100 ;  de = start index
	call	vram_copy_tiles
	
	ld	bc,10
	ld	hl,fire_sprite_tiles
	ld	de,0 ;  de = start index
	call	vram_copy_tiles
	
	ld	a,1
	ld	[rVBK],a
	
	ld	bc,32*32
	ld	d,7
	ld	hl,$9800
	call	vram_memset ; bc = size    d = value    hl = dest address

	ld	a,0
	ld	[rVBK],a
	
	ld	bc,32*32
	ld	d,0
	ld	hl,$9800
	call	vram_memset ; bc = size    d = value    hl = dest address
	
	call	fire_map_clear
	
	call	fire_setup_sprites
	
	call	wait_vbl

	call	fire_map_handle

	ld	a,LCDCF_ON|LCDCF_BG8800|LCDCF_BG9800|LCDCF_OBJ16|LCDCF_OBJON ; configuration
	ld	[rLCDC],a
	
	; Load palettes and configure IRQs
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,fire_vbl_handler
	call	irq_set_VBL
	
	ld	b,$90
	call	wait_ly
	
	ld	a,0
	call	fire_palette_load
	
	; START	
	
.loop: ; Main loop
	
	call	fire_handle_events
	
	call	fire_map_handle
	
	call	wait_vbl

	ld	a,[fire_exit_demo]
	and	a,a
	jr	z,.loop

	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

