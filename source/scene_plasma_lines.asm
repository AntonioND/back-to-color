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
ATTR_MAP_TEMP		EQU	$D400 ;($D000 + 32*32)

TEXT_BAR_HEIGHT		EQU	16

;-------------------------------------------------------------------------------------------------

	SECTION "PLASMA_LINES_DATA", DATA, BANK[1]

plasma_lines_tiles:
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$E7,$FF,$DB,$E7,$BD,$C3
	DB $BD,$C3,$DB,$E7,$E7,$FF,$FF,$FF
	DB $FF,$FF,$C3,$FF,$99,$E7,$A5,$C3
	DB $A5,$C3,$99,$E7,$C3,$FF,$FF,$FF
	DB $C3,$FF,$A5,$C3,$42,$81,$00,$81
	DB $00,$81,$42,$81,$A5,$C3,$C3,$FF

; Map control

plasma_lines_function_pointers_array:
	DW	angle_0,angle_1,angle_2,angle_3,angle_4,angle_5,angle_6,angle_7
	DW	angle_8,angle_9,angle_10,angle_11,angle_12,angle_13,angle_14,angle_15
	
plasma_lines_scroll_x_speed_array:
	DB	-8,-8,-8,-8,0,8,8,8,8,8,8,8,0,-8,-8,-8

plasma_lines_scroll_y_speed_array:
	DB	0,-8,-8,-8,-8,-8,-8,-8,0,8,8,8,8,8,8,8
	
plasma_lines_scroll_x_time_array:
	DB	6,9,12,15,0,15,12,9,6,9,12,15,0,15,12,9

plasma_lines_scroll_y_time_array:
	DB	0,15,12,9,6,9,12,15,0,15,12,9,6,9,12,15

; Color control

plasma_lines_handler_start_speeds:
	DB	1,0,2
	DB	0,2,1
	DB	2,1,0
	DB	1,1,1
	
plasma_lines_handler_start_values:
	DB	31,0,0
	DB	0,15,0
	DB	31,15,0
	DB	15,31,0
	
plasma_lines_text_bar_tiles:
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $00,$00,$FF,$00,$00,$FF,$FF,$FF
	
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
	DB $FF,$FF,$00,$FF,$FF,$00,$00,$00
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

plasma_lines_text_bar_map:
	DB	$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70
	DB	$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70
	DB	$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71
	DB	$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71,$71
	DB	$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72
	DB	$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72,$72

plasma_lines_text_bar_pal:
	DW	$7FFF,$56B5,$294A,$0000

plasma_lines_text_bar_font: ; 44 tiles
DB $FF,$FF,$EF,$C7,$C7,$D7,$D7,$93
DB $93,$BB,$83,$01,$39,$7D,$7D,$7D
DB $FF,$FF,$07,$07,$73,$7B,$7B,$7B
DB $03,$03,$79,$7D,$79,$7D,$03,$03
DB $FF,$FF,$C3,$C3,$99,$BD,$3F,$7F
DB $7F,$7F,$3F,$7F,$99,$BD,$C3,$C3
DB $FF,$FF,$07,$07,$73,$7B,$79,$7D
DB $7D,$7D,$79,$7D,$73,$7B,$07,$07
DB $FF,$FF,$01,$01,$7F,$7F,$7F,$7F
DB $0F,$0F,$7F,$7F,$7F,$7F,$01,$01
DB $FF,$FF,$01,$01,$7F,$7F,$7F,$7F
DB $0F,$0F,$7F,$7F,$7F,$7F,$7F,$7F
DB $FF,$FF,$C3,$C3,$99,$BD,$3F,$7F
DB $61,$61,$3D,$7D,$99,$BD,$C3,$C3
DB $FF,$FF,$7D,$7D,$7D,$7D,$7D,$7D
DB $01,$01,$7D,$7D,$7D,$7D,$7D,$7D
DB $FF,$FF,$C7,$C7,$EF,$EF,$EF,$EF
DB $EF,$EF,$EF,$EF,$EF,$EF,$C7,$C7
DB $FF,$FF,$81,$81,$FB,$FB,$FB,$FB
DB $FB,$FB,$BB,$BB,$BB,$BB,$C7,$C7
DB $FF,$FF,$67,$77,$47,$6F,$0F,$5F
DB $1F,$3F,$0F,$5F,$47,$6F,$67,$77
DB $FF,$FF,$7F,$7F,$7F,$7F,$7F,$7F
DB $7F,$7F,$7F,$7F,$7F,$7F,$07,$07
DB $FF,$FF,$7D,$7D,$39,$39,$11,$55
DB $45,$6D,$6D,$7D,$7D,$7D,$7D,$7D
DB $FF,$FF,$3D,$7D,$1D,$3D,$0D,$5D
DB $45,$6D,$61,$75,$71,$79,$79,$7D
DB $FF,$FF,$C7,$C7,$93,$BB,$39,$7D
DB $7D,$7D,$39,$7D,$93,$BB,$C7,$C7
DB $FF,$FF,$03,$03,$79,$7D,$7D,$7D
DB $79,$7D,$03,$03,$7F,$7F,$7F,$7F
DB $FF,$FF,$87,$87,$33,$7B,$7B,$7B
DB $7B,$7B,$33,$7B,$87,$87,$E3,$F3
DB $FF,$FF,$03,$03,$79,$7D,$7D,$7D
DB $79,$7D,$03,$03,$63,$77,$71,$7B
DB $FF,$FF,$83,$83,$39,$7D,$3F,$7F
DB $83,$83,$F9,$FD,$39,$7D,$83,$83
DB $FF,$FF,$01,$01,$EF,$EF,$EF,$EF
DB $EF,$EF,$EF,$EF,$EF,$EF,$EF,$EF
DB $FF,$FF,$7D,$7D,$7D,$7D,$7D,$7D
DB $7D,$7D,$7D,$7D,$39,$BB,$83,$C7
DB $FF,$FF,$7D,$7D,$7D,$7D,$39,$BB
DB $BB,$BB,$93,$D7,$D7,$D7,$C7,$EF
DB $FF,$FF,$7D,$7D,$7D,$7D,$7D,$7D
DB $39,$7D,$AB,$AB,$83,$AB,$C7,$D7
DB $FF,$FF,$39,$7D,$11,$BB,$83,$D7
DB $C7,$EF,$83,$D7,$11,$BB,$39,$7D
DB $FF,$FF,$39,$7D,$11,$BB,$83,$D7
DB $C7,$EF,$EF,$EF,$EF,$EF,$EF,$EF
DB $FF,$FF,$01,$01,$F1,$FB,$E3,$F7
DB $C7,$EF,$8F,$DF,$1F,$BF,$01,$01
DB $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
DB $CF,$CF,$FF,$FF,$CF,$CF,$CF,$CF
DB $87,$87,$33,$7B,$73,$7B,$E7,$F7
DB $CF,$CF,$FF,$FF,$CF,$CF,$CF,$CF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$CF,$CF,$CF,$CF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$CF,$CF,$CF,$CF,$BF,$BF
DB $C7,$D7,$8F,$AF,$3B,$7B,$1B,$3B
DB $0B,$5B,$43,$6B,$63,$73,$73,$7B
DB $FF,$FF,$01,$01,$7D,$7D,$45,$45
DB $55,$55,$41,$41,$7F,$7F,$01,$01
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$01,$01
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$01,$83,$1D,$3D,$0D,$5D
DB $45,$6D,$61,$75,$71,$79,$01,$83
DB $FF,$FF,$E7,$F7,$C7,$E7,$C7,$D7
DB $F7,$F7,$F7,$F7,$F7,$F7,$C1,$C1
DB $FF,$FF,$01,$83,$7D,$7D,$F9,$FD
DB $C1,$E3,$0F,$9F,$3F,$7F,$01,$01
DB $FF,$FF,$01,$83,$7D,$7D,$FD,$FD
DB $C1,$C3,$FD,$FD,$7D,$7D,$01,$83
DB $FF,$FF,$E3,$F3,$C3,$EB,$8B,$DB
DB $1B,$BB,$03,$03,$FB,$FB,$F1,$F1
DB $FF,$FF,$01,$01,$7F,$7F,$7F,$7F
DB $01,$03,$FD,$FD,$7D,$7D,$01,$83
DB $FF,$FF,$01,$83,$7D,$7D,$7F,$7F
DB $01,$03,$7D,$7D,$7D,$7D,$01,$83
DB $FF,$FF,$01,$01,$F9,$FD,$F1,$FB
DB $E3,$F7,$C7,$EF,$8F,$DF,$9F,$BF
DB $FF,$FF,$01,$83,$7D,$7D,$7D,$7D
DB $01,$83,$7D,$7D,$7D,$7D,$01,$83
DB $FF,$FF,$01,$83,$7D,$7D,$7D,$7D
DB $01,$81,$FD,$FD,$7D,$7D,$01,$83
	
plasma_lines_text_message: ; Mustn't be longer than 256 characters. If shorter than that, put a '123' at the end like here:
	;DB	"  -----------------------------------------------------------------------                    "
	DB	"    DEMO SPECIALLY MADE FOR THE GBDEV 2014 GAMEBOY CODING COMPO!                             "
	DB	123 ; end character
	
;-------------------------------------------------------------------------------------------------

	SECTION	"Plasma_Lines_Vars",BSS

plasma_lines_function_ptr:	DS	2 ; for the angle
plasma_lines_curr_angle:		DS	1

plasma_lines_angle_inc_speed:		DS	1
plasma_lines_next_angle_time:		DS	1
plasma_lines_default_time_to_change:	DS	1

plasma_lines_ready_dma_copy:			DS	1

; Map control

plasma_lines_scroll_x_speed:	DS	1
plasma_lines_scroll_y_speed:	DS	1
plasma_lines_wait_x:			DS	1
plasma_lines_wait_y:			DS	1
plasma_lines_elapsed_x:		DS	1
plasma_lines_elapsed_y:		DS	1

; Color control

plasma_lines_color_change_wait:	DS	1

plasma_lines_pal_red:	DS	1 ; colors of next palette
plasma_lines_pal_green:	DS	1
plasma_lines_pal_blue:	DS	1

plasma_lines_palette:	DS (2*4) ; 4 colors, the last one is black

plasma_lines_pal_value:	DS (4 * 3) ; number of palettes * color components
plasma_lines_pal_speed:	DS (4 * 3)

; Text bar

plasma_lines_ly_sine_index:	DS	1
plasma_lines_text_scroll_x:	DS	1

plasma_lines_text_array_index:	DS	1
plasma_lines_text_next_position:	DS	1 ; next x coordinate to put a character

; Exit flag
; ---------

plasma_lines_exit_flag:		DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Plasma_Lines", CODE, BANK[1]

;-------------------------------------------------------------------
;-                           MAP CONTROL                           -
;-------------------------------------------------------------------

plasma_lines_get_value_from_position: ; b = x, c = y
	
	ld	a,[plasma_lines_function_ptr]
	ld	l,a
	ld	a,[plasma_lines_function_ptr+1]
	ld	h,a
	
	xor	a,a
	
	jp	[hl]
	
angle_0:
	add	a,b
	ret
angle_1:
	add	a,b
	srl	c
	add	a,c
	ret
angle_2:
	add	a,b
	add	a,c
	ret
angle_3:
	srl	b
	add	a,b
	add	a,c
	ret
angle_4:
	add	a,c
	ret
angle_5:
	srl	b
	sub	a,b
	add	a,c
	ret
angle_6:
	sub	a,b
	add	a,c
	ret
angle_7:
	sub	a,b
	srl	c
	add	a,c
	ret
angle_8:
	dec	a
	sub	a,b
	ret
angle_9:
	dec	a
	sub	a,b
	srl	c
	sub	a,c
	ret
angle_10:
	dec	a
	sub	a,b
	sub	a,c
	ret
angle_11:
	dec	a
	srl	b
	sub	a,b
	sub	a,c
	ret
angle_12:
	dec	a
	sub	a,c
	ret
angle_13:
	dec	a
	srl	b
	add	a,b
	sub	a,c
	ret
angle_14:
	dec	a
	add	a,b
	sub	a,c
	ret
angle_15:
	dec	a
	add	a,b
	srl	c
	sub	a,c
	ret

;----------------------------------------------

plasma_lines_set_function_ptr: ; hl = ptr
	
	ld	a,l
	ld	[plasma_lines_function_ptr],a
	ld	a,h
	ld	[plasma_lines_function_ptr+1],a
	
	ret

;----------------------------------------------

plasma_lines_set_tile: ; b = x, c = y

	ld	d,MAP_TEMP >> 8
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
	
	ret

;----------------------------------------------

plasma_lines_create_temp_map:
	
	ld	c,0
	
._outer_loop:

	ld	b,0
	
._inner_loop:
	
	push	bc
	call	plasma_lines_get_value_from_position
	and	a,3
	pop	bc
	push	bc
	call	plasma_lines_set_tile
	pop	bc
	
	inc	b
	ld	a,b
	cp	a,32
	jr	nz,._inner_loop
	
	inc	c
	ld	a,c
	cp	a,32
	jr	nz,._outer_loop
	
	ret

;----------------------------------------------

plasma_lines_set_attr: ; b = x, c = y

	ld	d,ATTR_MAP_TEMP >> 8
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
	
	ret

;----------------------------------------------

plasma_lines_create_temp_attr_map:
	
	ld	c,0
	
._outer_loop:

	ld	b,0
	
._inner_loop:
	
	push	bc
	call	plasma_lines_get_value_from_position
	srl	a
	srl	a
	and	3
	pop	bc
	push	bc
	call	plasma_lines_set_attr
	pop	bc
	
	inc	b
	ld	a,b
	cp	a,32
	jr	nz,._inner_loop
	
	inc	c
	ld	a,c
	cp	a,32
	jr	nz,._outer_loop
	
	ret
	
;----------------------------------------------

plasma_lines_set_scroll_speeds: ; b = scx, c = scy, d = wait x, e = wait y
	
	ld	hl,plasma_lines_scroll_x_speed
	ld	[hl],b
	
	ld	hl,plasma_lines_scroll_y_speed
	ld	[hl],c
	
	ld	hl,plasma_lines_wait_x
	ld	[hl],d
	
	ld	hl,plasma_lines_wait_y
	ld	[hl],e
	
	ret
	
;----------------------------------------------

plasma_lines_reset_angle_handler:
	
	ld	a,5
	ld	[plasma_lines_default_time_to_change],a
	ld	[plasma_lines_next_angle_time],a
	
	ld	a,1
	ld	[plasma_lines_angle_inc_speed],a
	
	ld	a,0
	ld	[plasma_lines_ready_dma_copy],a
	
	ld	a,0
	call	plasma_lines_set_map_angle
	
	ret
	
;----------------------------------------------

plasma_lines_handle_angle:
	
	ld	hl,plasma_lines_next_angle_time
	dec	[hl]
	ret	nz
	
	ld	a,[plasma_lines_ready_dma_copy]
	and	a,a
	jr	z,.continue
	
	inc	[hl] ; wait...
	ret

.continue:
	
	; Change angle
	
;	call	GetRandom
;	cp	a,32
;	jr	c,._invert
	
._increment_angle:
	ld	hl,plasma_lines_curr_angle
	ld	a,[hl]
	ld	hl,plasma_lines_angle_inc_speed
	add	a,[hl]
	jr	._set_angle
	
;._invert:
;	ld	hl,plasma_lines_angle_inc_speed ; invert speed
;	ld	a,[hl]
;	cpl
;	inc	a
;	ld	[hl],a
;	ld	a,[plasma_lines_curr_angle] ; invert angle
;	add	a,8
;	jr	._set_angle
	
._set_angle:
	and	a,$0F
	ld	hl,plasma_lines_curr_angle
	ld	[hl],a
	call	plasma_lines_set_map_angle
	
	ld	hl,plasma_lines_next_angle_time
	ld	a,[plasma_lines_default_time_to_change]
	ld	[hl],a
	
	ret
	
;----------------------------------------------

plasma_lines_update_map_attr_dma:

	ld	a,[plasma_lines_ready_dma_copy]
	and	a,a
	ret	z
	
	ld	a,0
	ld	[plasma_lines_ready_dma_copy],a

	ld	a,0
	ld	[rVBK],a
	DMA_COPY MAP_TEMP,$9800,(32*32),0

	ld	a,1
	ld	[rVBK],a
	DMA_COPY ATTR_MAP_TEMP,$9800,(32*32),0
	
	ret

;----------------------------------------------

plasma_lines_set_map_angle: ; a = angle
	
	and	a,$0F
	
	ld	[plasma_lines_curr_angle],a
	
	ld	hl,plasma_lines_function_pointers_array
	sla	a
	ld	e,a
	ld	d,0
	add	hl,de
	ld	e,[hl]
	inc	hl
	ld	d,[hl]
	
	ld	h,d
	ld	l,e
	
	call	plasma_lines_set_function_ptr
	
	; Create tile maps...
	
	call	plasma_lines_create_temp_map
	call	plasma_lines_create_temp_attr_map
	
	; Copy them...
	
;	ld	a,0
;	ld	[rVBK],a
	
;	ld	bc,32*32
;	ld	hl,MAP_TEMP
;	ld	de,$9800
;	call	vram_copy
	
;	ld	a,1
;	ld	[rVBK],a
	
;	ld	bc,32*32
;	ld	hl,ATTR_MAP_TEMP
;	ld	de,$9800
;	call	vram_copy

;	call	wait_vbl

;	ld	a,0
;	ld	[rVBK],a
;	DMA_COPY MAP_TEMP,$9800,(32*32),1

;	ld	hl,rHDMA5
;._not_finished:	
;	bit	7,[hl]
;	jr	z,._not_finished

;	ld	a,1
;	ld	[rVBK],a
;	DMA_COPY ATTR_MAP_TEMP,$9800,(32*32),1
	
	ld	a,1
	ld	[plasma_lines_ready_dma_copy],a
	
	; Handle new scroll speeds and these things...
	
	ld	a,[plasma_lines_curr_angle]
	
	ld	e,a
	ld	d,0
	
	ld	hl,plasma_lines_scroll_x_speed_array
	add	hl,de
	ld	b,[hl] ; b = scx
	
	ld	hl,plasma_lines_scroll_y_speed_array
	add	hl,de
	ld	c,[hl] ; c = scy
	
	push	bc
	
	ld	hl,plasma_lines_scroll_x_time_array
	add	hl,de
	ld	b,[hl] ; b = time x
	
	ld	hl,plasma_lines_scroll_y_time_array
	add	hl,de
	ld	e,[hl] ; e = time y
	
	ld	d,b ; d = time x
	
	pop	bc
	
	call	plasma_lines_set_scroll_speeds
	
	ret

;-------------------------------------------------------------------
;-                         COLOR CONTROL                           -
;-------------------------------------------------------------------

plasma_lines_palette_set_fading:  ; b = red, c = green, l = blue
	
	push	bc
	push	hl
	
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
	
	ld	hl,plasma_lines_palette
	ld	[hl],e
	inc	hl
	ld	[hl],d ; set first color...
	
	pop	hl
	pop	bc
	
	ld	a,l
	sub	a,8
	jr	nc,._001
	xor	a,a
._001:
	ld	l,a
	
	ld	a,c
	sub	a,8
	jr	nc,._002
	xor	a,a
._002:
	ld	c,a
	
	ld	a,b
	sub	a,8
	jr	nc,._003
	xor	a,a
._003:
	ld	b,a
	
	push	bc
	push	hl
	
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
	
	ld	hl,plasma_lines_palette + 2
	ld	[hl],e
	inc	hl
	ld	[hl],d ; set second color...
	
	pop	hl
	pop	bc
	
	ld	a,l
	sub	a,8
	jr	nc,._004
	xor	a,a
._004:
	ld	l,a
	
	ld	a,c
	sub	a,8
	jr	nc,._005
	xor	a,a
._005:
	ld	c,a
	
	ld	a,b
	sub	a,8
	jr	nc,._006
	xor	a,a
._006:
	ld	b,a
	
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
	
	ld	hl,plasma_lines_palette + 4
	ld	[hl],e
	inc	hl
	ld	[hl],d ; set third color...
	
	ret
	
;----------------------------------------------

plasma_lines_palette_load: ; a =  palette number
	
	ld	b,a
	call	wait_screen_blank
	ld	a,b
	
	ld	hl,plasma_lines_palette
	call	bg_set_palette

	ret
	
;----------------------------------------------

plasma_lines_handle_values:  ; e = array index   a = returned value
	
	ld	d,0 ; de = array index
	
	ld	hl,plasma_lines_pal_speed
	add	hl,de
	ld	b,[hl] ; b = speed
	
	ld	hl,plasma_lines_pal_value
	add	hl,de
	ld	c,[hl] ; c = base
	
	ld	a,c
	add	a,b
	
	ld	c,a ; save new value
	; check if lower than 0...
	bit	7,a
	jr	z,._not_negative
	ld	c,0 ; value = 0
	ld	a,b
	cpl
	inc	a
	ld	b,a	; speed = -speed
	jr ._save_values ; value can only be >31 or <0, but both it's impossible
._not_negative
	and	a,31 ; check if greater than 31
	cp	a,c
	jr	z,._save_values ; not greater
	ld	c,31 ; value = 31
	ld	a,b
	cpl
	inc	a
	ld	b,a	; speed = -speed
._save_values
	
	ld	hl,plasma_lines_pal_speed
	add	hl,de
	ld	[hl],b ; b = speed
	
	ld	hl,plasma_lines_pal_value
	add	hl,de
	ld	[hl],c ; c = base
	
	ld	a,c
	
	ret
	
;----------------------------------------------

plasma_lines_update_palettes:
	
	ld	e,0
	ld	a,0
	
._repeat:
	
	push	af
	
	call	plasma_lines_handle_values
	ld	[plasma_lines_pal_red],a
	inc	e
	call	plasma_lines_handle_values
	ld	[plasma_lines_pal_green],a
	inc	e
	call	plasma_lines_handle_values
	ld	[plasma_lines_pal_blue],a
	inc	e
	
	ld	a,[plasma_lines_pal_red]
	ld	b,a
	ld	a,[plasma_lines_pal_green]
	ld	c,a
	ld	a,[plasma_lines_pal_blue]
	ld	l,a
	
	push	de
	call	plasma_lines_palette_set_fading
	pop	de
	
	pop	af
	push	af
	push	de
	call	plasma_lines_palette_load
	pop	de
	pop	af
	
	inc	a
	cp	a,4
	
	jr	nz,._repeat
	
	ret

;----------------------------------------------

plasma_lines_reset_palettes:

	ld	bc,(4 * 3)
	ld	de,plasma_lines_pal_speed
	ld	hl,plasma_lines_handler_start_speeds
	call	memcopy ; set initial speeds
	
	ld	bc,(4 * 3)
	ld	de,plasma_lines_pal_value
	ld	hl,plasma_lines_handler_start_values
	call	memcopy ; set initial values
	
	ret

;-------------------------------------------------------------------
;-                            TEXT BAR                             -
;-------------------------------------------------------------------

plasma_lines_reset_bar:
	xor	a,a
	ld	[plasma_lines_ly_sine_index],a
	ld	[plasma_lines_text_scroll_x],a 
	ld	[plasma_lines_text_array_index],a
	
	ld	a,20
	ld	[plasma_lines_text_next_position],a
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,44
	ld	de,$0000
	ld	hl,plasma_lines_text_bar_font
	call	vram_copy_tiles
	
	ld	bc,3
	ld	de,$0070 ; 128 - 16
	ld	hl,plasma_lines_text_bar_tiles
	call	vram_copy_tiles
	
	ld	bc,32*3
	ld	de,$9C00 + (32*29)
	ld	hl,plasma_lines_text_bar_map
	call	vram_copy
	
	ld	a,1
	ld	[rVBK],a
	
	ld	bc,32*3
	ld	d,$07
	ld	hl,$9C00 + (32*29)
	call	vram_memset

	ld	a,0
	ld	[rVBK],a
	
	ret

;----------------------------------------------

plasma_lines_font_get_ascii: ; a = ascii character
	
	cp	a,"!"
	jr	nz,.__1
	ld	a,26
	ret
.__1:
	cp	a,"?"
	jr	nz,.__2
	ld	a,27
	ret
.__2:
	cp	a,"."
	jr	nz,.__3
	ld	a,28
	ret
.__3:
	cp	a,","
	jr	nz,.__4
	ld	a,29
	ret
.__4:
	cp	a,"Ñ"
	jr	nz,.__5
	ld	a,30
	ret
.__5:
	cp	a,"@"
	jr	nz,.__6
	ld	a,31
	ret
.__6:
	cp	a,"_"
	jr	nz,.__7
	ld	a,32
	ret
.__7:
	cp	a," "
	jr	nz,.__8
	ld	a,33
	ret
.__8:
	cp	a,"0"
	jr	c,.__9
	cp	a,"9"+1
	jr	nc,.__9
	
	sub	a,"0"
	add	a,34
	ret
.__9:

	; We could check if it is actually a normal character, but we aren't going to write anything strange...
	
	; Characters A to Z
	sub	a,"A"
	
	ret

;----------------------------------------------

plasma_lines_update_bar:
	
	; change position
	
	ld	hl,plasma_lines_ly_sine_index
	ld	a,[hl]
	inc	[hl]
	inc	[hl]
	
	ld	h,Sine >> 8
	ld	l,a
	
	ld	a,[hl]
	sra	a
	sra	a
	add	a,(144-TEXT_BAR_HEIGHT)/2
	dec	a
	
	ld	[rLYC],a
	
	; text...
	
	ld	hl,plasma_lines_text_scroll_x
	ld	a,[hl]
	inc	[hl]
	
	and	a,7
	
	ret	nz ; only put a char every 8 steps

._get_char:
	ld	hl,plasma_lines_text_array_index
	ld	e,[hl]
	inc	[hl]
	ld	d,0
	ld	hl,plasma_lines_text_message
	add	hl,de
	
	ld	a,[hl]
	
	cp	a,123
	jr	nz,._not_end
	
	ld	a,1
	ld	[plasma_lines_exit_flag],a ; Exit
	ld	a," " ; output space
	;xor	a,a
	;ld	[text_array_index],a ; Repeat from the begining
	;jr	._get_char ; get another character
	
._not_end:
	call	plasma_lines_font_get_ascii
	
	push	af
	
	ld	hl,plasma_lines_text_next_position
	ld	a,[hl]
	ld	b,a
	inc	a
	and	a,31
	ld	[hl],a
	
	ld	d,0
	ld	e,b ; de = x
	ld	hl,$9C00 + (30*32)  ; hl = base + (y*32)
	add	hl,de ; hl = base + x + (y * 32)
	
	ld	a,[rVBK]
	ld	e,a ; push value
	
	ld	a,0
	ld	[rVBK],a
	
	call	wait_screen_blank
	
	pop	af
	
	ld	[hl],a
	
	ld	a,e ; pop value
	ld	[rVBK],a
	
	ret
	
;----------------------------------------------

plasma_lines_lcd_handler:
	
	ld	a,[rSCX]
	ld	e,a
	ld	a,[rSCY]
	ld	d,a
	push	de
	
	;Change bg for bar
	
	call	wait_screen_blank
	
	ld	a,[rLCDC]
	or	a,LCDCF_BG9C00|LCDCF_BG8000  ; Change to other map
	ld	[rLCDC],a

	;change scrolls
	
	ld	a,[rLY]
	inc	a ; get first line affected by change
	
	cpl ; change sign
	inc	a
	
	add	a,256-24+4
	ld	[rSCY],a
	
	ld	a,[plasma_lines_text_scroll_x]
	ld	[rSCX],a
	
	;Show bar for a few lines...
	
	ld	a,[rLY]
	add	a,TEXT_BAR_HEIGHT
	
	cp	a,$90
	jr	c,._not_end_in_vblank
	
	; End in vblank, so force it before
	
	ld	a,$90
	
._not_end_in_vblank:
	ld	b,a
	
._not_yet:
	ld	a,[rLY]
	cp	a,b
	jr	nz,._not_yet
	
	;Restore bg
	
	call	wait_screen_blank
	
	ld	a,[rLCDC]
	and	a,~(LCDCF_BG9C00|LCDCF_BG8000) ; Change to 'main' map
	ld	[rLCDC],a
	
	pop	de
	ld	a,d
	ld	[rSCY],a
	ld	a,e
	ld	[rSCX],a
	
	ret

;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

plasma_lines_vbl_handler:
	
	call	plasma_lines_update_map_attr_dma
	
	call	plasma_lines_update_palettes
	
	call	plasma_lines_update_bar

	ld	hl,plasma_lines_elapsed_x
	inc	[hl]
	ld	b,[hl]
	
	ld	a,[plasma_lines_wait_x]
	cp	a,b
	jr	nc,._check_y
	
	ld	[hl],0
	
	ld	a,[plasma_lines_scroll_x_speed]
	ld	hl,rSCX
	add	a,[hl]
	ld	[hl],a
	
._check_y:
	
	ld	hl,plasma_lines_elapsed_y
	inc	[hl]
	ld	b,[hl]
	
	ld	a,[plasma_lines_wait_y]
	cp	a,b
	jr	nc,._exit_checks
	
	ld	[hl],0
	
	ld	a,[plasma_lines_scroll_y_speed]
	ld	hl,rSCY
	add	a,[hl]
	ld	[hl],a

._exit_checks:

	LONG_CALL	gbt_update
	
	ret

;----------------------------------------------
	
	GLOBAL Plasma_Lines
	
Plasma_Lines:
	
	xor	a,a
	ld	[rWX],a
	ld	[rWY],a
	ld	[rSCY],a
	ld	[rSCX],a
	
	ld	a,LCDCF_ON|LCDCF_WINON|LCDCF_WIN9C00
	ld	[rLCDC],a
	
	ld	a,1
	ld	[rVBK],a
	
	ld	bc,$1000
	ld	d,0
	ld	hl,$9000 ; clear map attributes
	call	vram_memset ; bc = size    d = value    hl = dest address

	ld	a,0
	ld	[rVBK],a
	
	ld	bc,$1000
	ld	d,0
	ld	hl,$9000 ; clear maps
	call	vram_memset ; bc = size    d = value    hl = dest address
	
	ld	bc,4
	ld	hl,plasma_lines_tiles
	ld	de,$0100 ;  de = start index
	call	vram_copy_tiles
	
	ld	b,$90
	call	wait_ly
	
	call	plasma_lines_reset_palettes
	
	call	plasma_lines_reset_angle_handler

	call	plasma_lines_handle_angle
	
	call	plasma_lines_reset_bar
	call	plasma_lines_update_bar
	
	ld	b,$90
	call	wait_ly
	
	ld	a,7 ; this loads bar palette
	ld	hl,plasma_lines_text_bar_pal
	call	bg_set_palette
	
	ld	a,255
	ld	[rWY],a
	ld	[rWX],a
	
	ld	a,LCDCF_ON|LCDCF_BG8800|LCDCF_BG9800
	ld	[rLCDC],a
	
	ld	a,0
	ld	[rIF],a ; clear interrupt flags before enabling them
	
	ld	a,STATF_LYC
	ld	[rSTAT],a
	
	ld	bc,plasma_lines_vbl_handler
	call	irq_set_VBL
	
	ld	bc,plasma_lines_lcd_handler
	call	irq_set_LCD
	
	ld	a,$03
	ld	[rIE],a
	
	; Start loop
	
	ld	a,0
	ld	[plasma_lines_exit_flag],a
	
.loop:
	call	plasma_lines_handle_angle
	
	call	wait_vbl
	
	ld	a,[plasma_lines_exit_flag]
	and	a,a
	jr	z,.loop


	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

