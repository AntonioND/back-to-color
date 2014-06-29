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

HORIZONTAL_BARS_BAR_HEIGHT	EQU	8

;-------------------------------------------------------------------------------------------------

	SECTION "HORIZONTAL_BARS_DATA", DATA, BANK[1]

horizontal_bars_handler_start_speeds: ; ((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3)
	DB	1,0,2
	DB	1,2,1
	DB	2,1,1
	DB	1,0,2
	DB	1,1,2
	DB	0,1,1
	DB	1,2,0
	DB	1,2,1
	DB	1,1,2
	DB	1,0,1
	DB	1,2,0
	DB	1,1,2
	DB	1,2,1
	DB	1,0,1
	DB	2,1,1
	DB	1,1,2
	DB	1,0,2
	DB	0,1,2
	
horizontal_bars_handler_start_values: ; ((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3)
	DB	31,0,0
	DB	0,15,0
	DB	31,0,15
	DB	0,0,31
	DB	31,31,0
	DB	0,15,0
	DB	15,31,0
	DB	31,15,31
	DB	31,0,31
	DB	0,0,31
	DB	15,0,0
	DB	0,31,0
	DB	15,0,31
	DB	0,0,15
	DB	31,0,31
	DB	0,31,0
	DB	31,0,15
	DB	0,31,0

horizontal_bars_scroll_speeds: ; (144/HORIZONTAL_BARS_BAR_HEIGHT)
	DB	1,2, -1,2, -2,1, -1,1, 2,-1
	DB	2,1, -1,-2, -1,2, 1,-2

horizontal_bars_switch_off_order: ; (144/HORIZONTAL_BARS_BAR_HEIGHT)
	DB	3,7, 17,12, 9,15, 0,2, 5,13
	DB	1,10, 16,6, 11,4, 14,8

horizontal_bars_bg_tiles:
	DB $FF,$FF,$18,$FF,$C3,$3C,$7E,$00
	DB $00,$00,$00,$00,$FF,$00,$00,$FF
	DB $FF,$FF,$00,$FF,$FF,$00,$00,$00
	DB $00,$00,$7E,$00,$C3,$3C,$18,$FF

horizontal_bars_bg_map:
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	DB	1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
	DB	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	

horizontal_bars_screen_text:
	;DB	"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@          "
	DB	" 8 BITS FOREVER!      LONG LIVE THE GAME BOY!          "
	DB	123 ; end character

horizontal_bars_horizontal_bars_spr_font_pal:
	DW $0000,$7FFF,$3DEF,$0000

horizontal_bars_spr_font: ; 46 tiles
DB $7E,$7E,$7E,$42,$7E,$5A,$BD,$DB
DB $FF,$81,$FF,$BD,$E7,$A5,$E7,$E7
DB $FC,$FC,$FA,$86,$FE,$BA,$FA,$86
DB $FE,$BA,$FE,$BA,$FA,$86,$FC,$FC
DB $FF,$FF,$FF,$81,$FF,$BD,$E7,$A7
DB $E7,$A7,$FF,$BD,$FF,$81,$FF,$FF
DB $FC,$FC,$FA,$86,$F6,$BA,$EE,$AA
DB $EE,$AA,$F6,$BA,$FA,$86,$FC,$FC
DB $FE,$FE,$FE,$82,$FE,$BE,$FC,$84
DB $FC,$BC,$FE,$BE,$FE,$82,$FE,$FE
DB $FE,$FE,$FE,$82,$FE,$BE,$FC,$84
DB $FC,$BC,$E0,$A0,$E0,$A0,$E0,$E0
DB $FF,$FF,$FF,$81,$FF,$BD,$FF,$BF
DB $FF,$B1,$FF,$BD,$FF,$81,$FF,$FF
DB $E7,$E7,$E7,$A5,$E7,$A5,$FF,$BD
DB $FF,$81,$FF,$BD,$E7,$A5,$E7,$E7
DB $3E,$3E,$3E,$22,$3E,$36,$1C,$14
DB $1C,$14,$3E,$36,$3E,$22,$3E,$3E
DB $7F,$7F,$7F,$41,$7F,$7B,$0E,$0A
DB $7E,$7A,$7E,$5A,$7E,$42,$7E,$7E
DB $E0,$E0,$EE,$AE,$F6,$BA,$EE,$B6
DB $FC,$8C,$EE,$B6,$F6,$BA,$EE,$EE
DB $E0,$E0,$E0,$A0,$E0,$A0,$E0,$A0
DB $E0,$A0,$FC,$BC,$FC,$84,$FC,$FC
DB $E7,$E7,$DB,$BD,$E7,$99,$FF,$81
DB $FF,$A5,$FF,$BD,$E7,$A5,$E7,$E7
DB $E7,$E7,$D7,$B5,$EF,$9D,$F7,$8D
DB $EF,$B5,$F7,$B9,$EB,$AD,$E7,$E7
DB $7E,$7E,$BD,$C3,$DB,$BD,$E7,$A5
DB $E7,$A5,$DB,$BD,$BD,$C3,$7E,$7E
DB $FE,$FE,$FE,$82,$FE,$BA,$FE,$BA
DB $FE,$82,$FE,$BE,$E0,$A0,$E0,$E0
DB $FE,$FE,$FE,$82,$FE,$BA,$EE,$AA
DB $FE,$BA,$FF,$83,$FF,$F9,$0F,$0F
DB $FE,$FE,$FE,$82,$FE,$BA,$FE,$BA
DB $FE,$82,$FC,$B4,$EE,$AA,$E6,$E6
DB $FE,$FE,$FE,$82,$FE,$BE,$FE,$82
DB $FE,$FA,$FE,$FA,$FE,$82,$FE,$FE
DB $7F,$7F,$7F,$41,$7F,$77,$1C,$14
DB $1C,$14,$1C,$14,$1C,$14,$1C,$1C
DB $E7,$E7,$E7,$A5,$E7,$A5,$E7,$A5
DB $E7,$A5,$FF,$BD,$FF,$81,$FF,$FF
DB $E7,$E7,$E7,$A5,$E7,$A5,$DB,$BD
DB $BD,$DB,$66,$5A,$5A,$66,$3C,$3C
DB $E7,$E7,$E7,$A5,$FF,$BD,$FF,$A5
DB $FF,$81,$E7,$99,$DB,$BD,$E7,$E7
DB $E7,$E7,$DB,$BD,$A5,$DB,$5A,$66
DB $5A,$66,$A5,$DB,$DB,$BD,$E7,$E7
DB $77,$77,$77,$55,$6B,$5D,$55,$6B
DB $2A,$36,$1C,$14,$1C,$14,$1C,$1C
DB $FF,$FF,$FF,$81,$F5,$FB,$2A,$36
DB $54,$6C,$AF,$DF,$FF,$81,$FF,$FF
DB $1E,$1E,$1E,$12,$1A,$16,$1C,$14
DB $1C,$14,$1C,$1C,$1C,$14,$1C,$1C
DB $7F,$7F,$7F,$41,$7F,$5D,$7F,$71
DB $1F,$17,$1C,$1C,$1C,$14,$1C,$1C
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $3C,$3C,$3C,$24,$3C,$24,$3C,$3C
DB $00,$00,$00,$00,$00,$00,$1C,$1C
DB $1C,$14,$2C,$34,$34,$2C,$38,$38
DB $7E,$7E,$7E,$42,$FF,$FF,$D7,$B5
DB $EF,$9D,$F7,$AD,$FF,$B1,$EF,$EF
DB $FF,$FF,$FF,$81,$FF,$BD,$FF,$A5
DB $FF,$A1,$FF,$BF,$FF,$81,$FF,$FF
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$FF,$FF,$FF,$81,$FF,$FF
DB $7C,$7C,$BA,$C6,$D6,$BA,$EE,$AA
DB $EE,$AA,$D6,$BA,$BA,$C6,$7C,$7C
DB $1C,$1C,$3C,$24,$6C,$54,$7C,$74
DB $1C,$14,$7E,$76,$7E,$42,$7E,$7E
DB $3C,$3C,$5A,$66,$BE,$DA,$FE,$FA
DB $2C,$34,$DE,$EE,$FE,$82,$FE,$FE
DB $FE,$FE,$FE,$82,$FE,$FA,$7E,$42
DB $7E,$7A,$F6,$FA,$FE,$82,$FE,$FE
DB $EE,$EE,$EE,$AA,$EE,$AA,$FE,$BA
DB $FE,$82,$FE,$FA,$0E,$0A,$0E,$0E
DB $FE,$FE,$FE,$82,$FE,$BE,$FE,$82
DB $FE,$FA,$FE,$BA,$FE,$82,$FE,$FE
DB $FE,$FE,$FE,$82,$FE,$BE,$FE,$82
DB $FE,$BA,$FE,$BA,$FE,$82,$FE,$FE
DB $FE,$FE,$FE,$82,$FE,$BA,$EE,$EA
DB $0E,$0A,$0E,$0A,$0E,$0A,$0E,$0E
DB $FE,$FE,$FE,$82,$FE,$BA,$FE,$82
DB $FE,$BA,$FE,$BA,$FE,$82,$FE,$FE
DB $FE,$FE,$FE,$82,$FE,$BA,$FE,$82
DB $FE,$FA,$FE,$FA,$FE,$82,$FE,$FE
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$38,$38,$38,$28,$38,$38
DB $00,$00,$38,$38,$38,$28,$38,$38
DB $38,$38,$34,$2C,$3C,$34,$1C,$14
DB $1C,$14,$3C,$34,$34,$2C,$38,$38

;-------------------------------------------------------------------------------------------------

	SECTION	"Horizontal_Bars_Vars",BSS

; ly handler
; ----------
horizontal_bars_next_ly:	DS	1
horizontal_bars_next_index:	DS	1
horizontal_bars_next_scroll_index:	DS	1

; palettes
; --------

horizontal_bars_pal_red:	DS	1 ; colors of next palette
horizontal_bars_pal_green:	DS	1
horizontal_bars_pal_blue:	DS	1

horizontal_bars_palette:	DS (2*3) ; 3 colors, the last one is black
horizontal_bars_pal_value:	DS ((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3) ; number of lines * color components
horizontal_bars_pal_speed:	DS ((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3)

; scroll
; ------

horizontal_bars_bar_scroll:	DS (144/HORIZONTAL_BARS_BAR_HEIGHT)

; text
; ----

horizontal_bars_next_sprite:	DS	1
horizontal_bars_next_char:		DS	2
horizontal_bars_sprites_active:	DS	1
horizontal_bars_change_count:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Horizontal_Bars", CODE, BANK[1]

;----------------------------------------------

horizontal_bars_font_get_ascii: ; a = ascii character
	
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
	ld	a,43
	ret
.__8:
	cp	a,"0"
	jr	c,.__9
	cp	a,"9"+1
	jr	nc,.__9
	
	sub	a,"0"
	add	a,33
	ret
.__9:
	cp	a,":"
	jr	nz,.__10
	ld	a,44
	ret
.__10:
	cp	a,")"
	jr	nz,.__11
	ld	a,45
	ret
.__11:

	; We could check if it is actually a normal character, but we aren't going to write anything strange...
	
	; Characters A to Z
	sub	a,"A"
	
	ret

;----------------------------------------------

horizontal_bars_update_sprites:
	
	ld	a,[horizontal_bars_sprites_active]
	and	a,a
	ret	z
	
	ld	a,[horizontal_bars_change_count]
	inc	a
	ld	[horizontal_bars_change_count],a
	cp	a,16
	jr	nz,._no_change
	xor	a,a
	ld	[horizontal_bars_change_count],a

	; change next sprite...
	ld	hl,horizontal_bars_next_char
	ld	e,[hl]
	inc	hl
	ld	d,[hl]
	inc	de
	ld	[hl],d
	dec	hl
	ld	[hl],e ; de = horizontal_bars_next_char
	dec	de
	
	ld	hl,horizontal_bars_screen_text
	add	hl,de ; hl = pointer to next character
	ld	b,[hl] ; b = next character
	
	ld	hl,horizontal_bars_next_sprite
	ld	a,[hl]
	inc	a
	cp	a,16
	jr	nz,._no_limit
	xor	a,a
._no_limit:	
	ld	[hl],a
	
	ld	l,a
	ld	a,b
	cp	a,123
	jr	nz,._dont_stop_text
	xor	a,a
	ld	[horizontal_bars_sprites_active],a
	jr	._no_change
._dont_stop_text:
	call	horizontal_bars_font_get_ascii
	call	sprite_set_tile

._no_change:
	
	ld	hl,OAM_Copy
	ld	b,0
	
._next

	inc	hl
	dec	[hl]
	ld	e,[hl]
	sla	e
	dec	hl
	ld	d,Sine >> 8
	ld	a,[de]
	
	sra	a
	sra	a
	sra	a
	add	a,(144/2)+16-4
	
	ld	[hl],a

	ld	de,4
	add	hl,de
	
	inc	b
	ld	a,b
	cp	a,16
	jr	nz,._next
	
	ret

;----------------------------------------------

horizontal_bars_palette_set_fading:  ; b = red, c = green, l = blue
	
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
	
	ld	hl,horizontal_bars_palette
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
	
	ld	hl,horizontal_bars_palette + 2
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
	
	ld	hl,horizontal_bars_palette + 4
	ld	[hl],e
	inc	hl
	ld	[hl],d ; set third color...
	
	ret
	
;----------------------------------------------

horizontal_bars_palette_load:
	
	call	wait_screen_blank
	
	ld	a,$80 ; auto increment
	ld	[rBCPS],a
	
	ld	hl,horizontal_bars_palette
	
	ld	a,[hl+]
	ld	[rBCPD],a
	ld	a,[hl+]
	ld	[rBCPD],a
	
	ld	a,[hl+]
	ld	[rBCPD],a
	ld	a,[hl+]
	ld	[rBCPD],a
	
	ld	a,[hl+]
	ld	[rBCPD],a
	ld	a,[hl]
	ld	[rBCPD],a
	
	ret

;----------------------------------------------

horizontal_bars_handle_values:  ; e = array index   a = returned value
	
	ld	d,0 ; de = array index
	
	ld	hl,horizontal_bars_pal_speed
	add	hl,de
	ld	b,[hl] ; b = speed
	
	ld	hl,horizontal_bars_pal_value
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
	
	ld	hl,horizontal_bars_pal_speed
	add	hl,de
	ld	[hl],b ; b = speed
	
	ld	hl,horizontal_bars_pal_value
	add	hl,de
	ld	[hl],c ; c = base
	
	ld	a,c
	
	ret
	
;----------------------------------------------

horizontal_bars_bar_set_black: ; a = bar number
	
	ld	b,a
	sla	a
	add	a,b ; a *= 3
	ld	e,a
	ld	d,0 ; de = array index
	xor	a,a
	
	ld	hl,horizontal_bars_pal_value
	add	hl,de
	ld	[hl+],a
	ld	[hl+],a
	ld	[hl+],a
	
	ld	hl,horizontal_bars_pal_speed
	add	hl,de
	ld	[hl+],a
	ld	[hl+],a
	ld	[hl+],a

	ret

;----------------------------------------------
	
horizontal_bars_lcd_handler:
	
	call	horizontal_bars_palette_load
	
	ld	a,[horizontal_bars_next_ly]
	add	a,HORIZONTAL_BARS_BAR_HEIGHT
	cp	a,143
	jr	c,._not_next_line_vbl
	xor	a,a
	ld	[horizontal_bars_next_index],a
	ld	[horizontal_bars_next_scroll_index],a
	;xor	a,a ; next line = 0
._not_next_line_vbl:
	ld	[rLYC],a
	ld	[horizontal_bars_next_ly],a
	
	ld	hl,horizontal_bars_next_scroll_index
	ld	e,[hl]
	inc	[hl]
	ld	d,0
	ld	hl,horizontal_bars_bar_scroll
	add	hl,de
	ld	a,[hl]
	ld	[rSCX],a
	push	hl
	ld	hl,horizontal_bars_scroll_speeds
	add	hl,de
	add	a,[hl]
	pop	hl
	ld	[hl],a
	
	ld	hl,horizontal_bars_next_index
	ld	e,[hl]
	inc	[hl]
	
	push	hl
	call	horizontal_bars_handle_values
	pop	hl
	ld	[horizontal_bars_pal_red],a
	ld	e,[hl]
	inc	[hl]
	push	hl
	call	horizontal_bars_handle_values
	pop	hl
	ld	[horizontal_bars_pal_green],a
	ld	e,[hl]
	inc	[hl]
	call	horizontal_bars_handle_values
	ld	[horizontal_bars_pal_blue],a
	
	ld	a,[horizontal_bars_pal_red]
	ld	b,a
	ld	a,[horizontal_bars_pal_green]
	ld	c,a
	ld	a,[horizontal_bars_pal_blue]
	ld	l,a
	
	call	horizontal_bars_palette_set_fading	
	
	ret

;----------------------------------------------

horizontal_bars_vbl_handler:
	
	call	refresh_OAM
	
	call	horizontal_bars_update_sprites
	
	LONG_CALL	gbt_update
	
	ret
	
;----------------------------------------------
	
	GLOBAL Horizontal_Bars
	
Horizontal_Bars:
	
	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_WINON|LCDCF_WIN9C00|LCDCF_ON
	ld	[rLCDC],a	
	
	; clear screen...
	
	xor	a,a
	ld	[rWY],a
	ld	[rWX],a
	
	ld	a,0
	ld	[rVBK],a
	
	ld	hl,$8000 + (16 * 256) ; clear tile 0
	ld	bc,16
	ld	d,$00
	call	vram_memset
	
	ld	hl,$9C00 
	ld	bc,32*32
	ld	d,$00	
	call	vram_memset	
	
	ld	a,1
	ld	[rVBK],a
	
	ld	hl,$9C00 
	ld	bc,32*32
	ld	d,$07	; window use palette 7 (black)
	call	vram_memset	
	
	ld	hl,$9800
	ld	bc,32*32
	ld	d,$00
	call	vram_memset
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,32*18 ; size
	ld	hl,horizontal_bars_bg_map ;src
	ld	de,$9800 ;dst
	call	vram_copy
	
	ld	bc,2
	ld	hl,horizontal_bars_bg_tiles
	ld	de,$0101 ;  de = start index
	call	vram_copy_tiles     
	
	ld	bc,46
	ld	hl,horizontal_bars_spr_font
	ld	de,$0000 ;  de = start index
	call	vram_copy_tiles     

	xor	a,a
	ld	[rSCY],a
	ld	[rSCX],a
	ld	[rWY],a
	inc	a ; to avoid the window + bg scroll bug
	ld	[rWX],a
	
	ld	bc,((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3)
	ld	de,horizontal_bars_pal_speed
	ld	hl,horizontal_bars_handler_start_speeds
	call	memcopy ; set initial speeds
	
	ld	bc,((144/HORIZONTAL_BARS_BAR_HEIGHT) * 3)
	ld	de,horizontal_bars_pal_value
	ld	hl,horizontal_bars_handler_start_values
	call	memcopy ; set initial values
	
	; setup sprites
	; -------------
	
	ld	b,168 ; x coordinate
	ld	c,0 ; sprite number
._setup_sprites	
	push	bc
	ld	l,c
	ld	c,0
	push	hl
	call	sprite_set_xy
	pop	hl
	push	hl
	xor	a,a
	call	sprite_set_params
	pop	hl
	ld	a,43 ; space
	call	sprite_set_tile
	pop	bc
	inc	c
	ld	a,b
	add	a,16
	ld	b,a
	cp	a,168
	jr	nz,._setup_sprites
	
	ld	a,1
	ld	[horizontal_bars_sprites_active],a
	xor	a,a
	ld	[horizontal_bars_next_sprite],a
	ld	[horizontal_bars_next_char],a
	ld	[horizontal_bars_change_count],a
	
	; Setup palette and IRQs
	
	ld b,144
	call	wait_ly
	xor	a,a
	ld	hl,horizontal_bars_horizontal_bars_spr_font_pal
	call	spr_set_palette
	
	ld	bc,horizontal_bars_vbl_handler
	call	irq_set_VBL
	
	ld	bc,horizontal_bars_lcd_handler
	call	irq_set_LCD
	
	ld	a,$03
	ld	[rIE],a
	
	ld	a,STATF_LYC
	ld	[rSTAT],a

	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_WINON|LCDCF_WIN9C00|LCDCF_ON|LCDCF_OBJ8|LCDCF_OBJON
	ld	[rLCDC],a
	
	; Start...
	; --------
	
._show_bars:
	ld	e,15 ; frames to wait to turn on a bar
	call	wait_frames
	ld	a,[rWY]
	add	a,HORIZONTAL_BARS_BAR_HEIGHT
	ld	[rWY],a
	cp	a,144
	jr	nz,._show_bars
	
	
._wait_end:
	call	wait_vbl
	ld	a,[horizontal_bars_sprites_active]
	and	a,a
	jr	nz,._wait_end
	
	
	ld	b,18
	ld	hl,horizontal_bars_switch_off_order
._next_bar:
	ld	a,[hl+]
	push	bc
	push	hl
	call	horizontal_bars_bar_set_black
	ld	e,15 ; frames to wait to turn off a bar
	call	wait_frames
	pop	hl
	pop	bc
	dec	b
	jr	nz,._next_bar
	
	xor	a,a
	ld	[rWY],a
	ld	[rWX],a

	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

