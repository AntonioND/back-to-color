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
	INCLUDE	"gbt_player.inc"

	GLOBAL	demo_config_default
	
MAP_TEMP		EQU	$D000

;-------------------------------------------------------------------------------------------------

	SECTION "RGB_DATA", DATA[$4000], BANK[1]

rgb_scroller_sine_wave_data:  ; Aligned to $100

	DB	$0F,$10,$11,$11,$12,$13,$13,$14,$15,$16,$16,$17,$18,$18,$19,$19
	DB	$1A,$1A,$1B,$1B,$1C,$1C,$1D,$1D,$1D,$1E,$1E,$1E,$1E,$1E,$1E,$1E
	DB	$1F,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1D,$1D,$1D,$1C,$1C,$1B,$1B,$1A
	DB	$1A,$19,$19,$18,$18,$17,$16,$16,$15,$14,$13,$13,$12,$11,$11,$10
	DB	$0F,$0E,$0D,$0D,$0C,$0B,$0B,$0A,$09,$08,$08,$07,$06,$06,$05,$05
	DB	$04,$04,$03,$03,$02,$02,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$02,$02,$03,$03,$04
	DB	$04,$05,$05,$06,$06,$07,$08,$08,$09,$0A,$0B,$0B,$0C,$0D,$0D,$0E
	
	DB	$0F,$10,$11,$11,$12,$13,$13,$14,$15,$16,$16,$17,$18,$18,$19,$19
	DB	$1A,$1A,$1B,$1B,$1C,$1C,$1D,$1D,$1D,$1E,$1E,$1E,$1E,$1E,$1E,$1E
	DB	$1F,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1D,$1D,$1D,$1C,$1C,$1B,$1B,$1A
	DB	$1A,$19,$19,$18,$18,$17,$16,$16,$15,$14,$13,$13,$12,$11,$11,$10
	DB	$0F,$0E,$0D,$0D,$0C,$0B,$0B,$0A,$09,$08,$08,$07,$06,$06,$05,$05
	DB	$04,$04,$03,$03,$02,$02,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$02,$02,$03,$03,$04
	DB	$04,$05,$05,$06,$06,$07,$08,$08,$09,$0A,$0B,$0B,$0C,$0D,$0D,$0E

rgb_scroller_palette:
	DW	$0000,$7FFF,$3DEF,$0000

rgb_scroller_tiles: ; 29 tiles
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $5A,$66,$DB,$E7,$18,$E7,$FF,$00
DB $FF,$00,$18,$E7,$DB,$E7,$5A,$66
DB $5A,$66,$DA,$E6,$1A,$E6,$FA,$06
DB $FA,$06,$1A,$E6,$DA,$E6,$5A,$66
DB $5A,$66,$DB,$E7,$18,$E7,$FF,$00
DB $FF,$00,$00,$FF,$FF,$FF,$00,$00
DB $5A,$66,$5B,$67,$58,$67,$5F,$60
DB $5F,$60,$58,$67,$5B,$67,$5A,$66
DB $00,$00,$FF,$FF,$00,$FF,$FF,$00
DB $FF,$00,$18,$E7,$DB,$E7,$5A,$66
DB $5A,$66,$DA,$E6,$1A,$E6,$FA,$06
DB $FA,$06,$02,$FE,$FE,$FE,$00,$00
DB $5A,$66,$5B,$67,$58,$67,$5F,$60
DB $5F,$60,$40,$7F,$7F,$7F,$00,$00
DB $00,$00,$7F,$7F,$40,$7F,$5F,$60
DB $5F,$60,$58,$67,$5B,$67,$5A,$66
DB $00,$00,$FE,$FE,$02,$FE,$FA,$06
DB $FA,$06,$1A,$E6,$DA,$E6,$5A,$66
DB $5A,$66,$DA,$E6,$1A,$E6,$FA,$06
DB $FA,$06,$02,$FE,$FE,$FE,$00,$00
DB $5A,$66,$5A,$66,$5A,$66,$5A,$66
DB $5A,$66,$5A,$66,$5A,$66,$5A,$66
DB $00,$00,$FF,$FF,$00,$FF,$FF,$00
DB $FF,$00,$00,$FF,$FF,$FF,$00,$00
DB $00,$00,$FE,$FE,$02,$FE,$FA,$06
DB $FA,$06,$02,$FE,$FE,$FE,$00,$00
DB $5A,$66,$5A,$66,$5A,$66,$5A,$66
DB $5A,$66,$42,$7E,$7E,$7E,$00,$00
DB $00,$00,$7F,$7F,$40,$7F,$5F,$60
DB $5F,$60,$40,$7F,$7F,$7F,$00,$00
DB $00,$00,$7E,$7E,$42,$7E,$5A,$66
DB $5A,$66,$5A,$66,$5A,$66,$5A,$66
DB $00,$00,$7E,$7E,$42,$7E,$5A,$66
DB $5A,$66,$42,$7E,$7E,$7E,$00,$00
DB $5A,$66,$2D,$33,$16,$19,$0B,$0C
DB $05,$06,$02,$03,$01,$01,$00,$00
DB $00,$00,$01,$01,$02,$03,$05,$06
DB $0B,$0C,$16,$19,$2D,$33,$5A,$66
DB $00,$00,$80,$80,$40,$C0,$A0,$60
DB $D0,$30,$68,$98,$B4,$CC,$5A,$66
DB $5A,$66,$B4,$CC,$68,$98,$D0,$30
DB $A0,$60,$40,$C0,$80,$80,$00,$00
DB $00,$00,$81,$81,$42,$C3,$A5,$66
DB $DB,$3C,$66,$99,$BD,$C3,$5A,$66
DB $5A,$66,$B4,$CC,$68,$98,$D0,$30
DB $D0,$30,$68,$98,$B4,$CC,$5A,$66
DB $00,$00,$0F,$0F,$18,$1F,$27,$38
DB $6F,$70,$5C,$63,$5B,$67,$5A,$66
DB $00,$00,$F0,$F0,$18,$F8,$E4,$1C
DB $F6,$0E,$3A,$C6,$DA,$E6,$5A,$66
DB $5A,$66,$5B,$67,$5C,$63,$6F,$70
DB $27,$38,$18,$1F,$0F,$0F,$00,$00
DB $5A,$66,$DA,$E6,$3A,$C6,$F6,$0E
DB $E4,$1C,$18,$F8,$F0,$F0,$00,$00
DB $00,$00,$FE,$FE,$82,$FE,$BA,$C6
DB $BA,$C6,$9A,$E6,$DA,$E6,$5A,$66
	
rgb_scroller_bg_map:
DB $00,$00,$10,$10,$08,$0D,$10,$00,$10,$00
DB $18,$19,$00,$10,$00,$10,$00,$10,$00,$00
DB $00,$00,$04,$02,$04,$0D,$0B,$00,$0B,$00
DB $0B,$0B,$00,$0E,$00,$0E,$00,$0E,$00,$00
DB $00,$00,$0E,$0E,$07,$0D,$07,$0D,$07,$0D
DB $1A,$1B,$00,$11,$00,$11,$00,$11,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$10,$10,$10,$08,$0D,$10,$00,$18
DB $0D,$18,$19,$08,$05,$19,$08,$0D,$00,$00
DB $00,$00,$0B,$0B,$0B,$04,$0D,$0B,$00,$0B
DB $00,$0B,$0B,$0B,$0B,$0B,$04,$0D,$00,$00
DB $00,$00,$07,$03,$06,$07,$0D,$07,$0D,$1A
DB $0D,$1A,$1B,$0E,$0E,$0E,$07,$0D,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$0F,$05,$0D,$18,$19,$00,$00
DB $00,$08,$05,$19,$10,$00,$10,$00,$00,$00
DB $00,$00,$00,$00,$0B,$00,$0B,$0B,$00,$00
DB $00,$0B,$0B,$0B,$12,$05,$15,$00,$00,$00
DB $00,$00,$00,$00,$0E,$00,$1A,$1B,$00,$00
DB $00,$0E,$0E,$0E,$00,$0E,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$08,$0D,$10,$08,$0C,$19,$18,$0D,$0F
DB $05,$0D,$00,$18,$0D,$08,$19,$18,$0D,$00
DB $00,$04,$0D,$0B,$04,$05,$1B,$1A,$19,$00
DB $0B,$00,$00,$0B,$1C,$04,$02,$0B,$00,$00
DB $00,$0E,$00,$0E,$0E,$12,$0D,$0F,$1B,$00
DB $0E,$00,$00,$1A,$1B,$07,$1B,$1A,$0D,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$08,$19,$08,$0D,$08,$05
DB $19,$18,$19,$00,$00,$11,$00,$00,$00,$00
DB $00,$00,$00,$00,$0B,$0B,$04,$0D,$0B,$0B
DB $0B,$0B,$0B,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$07,$1B,$07,$0D,$0E,$0E
DB $0E,$1A,$1B,$00,$00,$11,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$08,$19,$18,$19,$18,$0D,$10,$10
DB $00,$00,$00,$0F,$05,$0D,$18,$19,$00,$00
DB $00,$00,$04,$02,$04,$02,$0B,$00,$04,$17
DB $00,$00,$00,$00,$0B,$00,$0B,$0B,$00,$00
DB $00,$00,$07,$1B,$0E,$0E,$1A,$0D,$0E,$0E
DB $00,$00,$00,$00,$0E,$00,$1A,$1B,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$11,$00,$00,$00,$18,$0D,$18,$19,$10
DB $00,$18,$19,$08,$0C,$19,$00,$00,$11,$00
DB $00,$00,$00,$00,$00,$0B,$00,$0B,$0B,$0B
DB $00,$0B,$0B,$04,$05,$1B,$00,$00,$00,$00
DB $00,$00,$11,$00,$00,$1A,$0D,$1A,$1B,$07
DB $0D,$1A,$1B,$0E,$12,$0D,$00,$11,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$11,$00,$00,$0F,$0C,$0C,$0C,$0C,$0C
DB $0C,$0C,$0C,$0C,$0C,$0D,$00,$00,$11,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$0F,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
DB $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0D,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$10,$00,$10,$10,$18,$19,$08,$19,$08
DB $0D,$00,$10,$00,$10,$18,$19,$10,$10,$00
DB $00,$0B,$00,$04,$02,$0B,$0B,$04,$1B,$04
DB $0D,$00,$12,$05,$15,$0B,$0B,$0B,$0B,$00
DB $00,$0E,$00,$0E,$0E,$1A,$1B,$0E,$00,$07
DB $0D,$00,$00,$0E,$00,$1A,$1B,$1A,$1B,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$10,$00,$10,$10,$10,$08,$0D,$00,$00
DB $00,$10,$0F,$05,$0D,$00,$10,$00,$10,$00
DB $00,$0B,$00,$0B,$04,$17,$04,$0D,$00,$00
DB $00,$0B,$00,$0B,$00,$00,$0E,$00,$0E,$00
DB $00,$07,$0D,$0E,$0E,$0E,$07,$0D,$00,$00
DB $00,$0E,$00,$0E,$00,$00,$11,$00,$11,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	
;-------------------------------------------------------------------------------------------------

	SECTION	"RGB_Vars",BSS

; Intro/End
; ---------
rgb_scroller_start_ly:	DS	1
rgb_scroller_end_ly:		DS	1

; Scroll
; ------

rgb_scroller_current_y:	DS	1   ; backgound line to draw next line
rgb_scroller_wait_scr:	DS	1   ; frames to wait to continue scrolling
rgb_scroller_inc_scroll:	DS	1   ; value to add to scroll each time (0-8)
rgb_scroller_scroll_pos:	DS	2   ; last drawn line
rgb_scroller_next_data:	DS	2   ; pointer to next line data

; Wave effect
; -----------

rgb_scroller_sine_pos:		DS	1
rgb_scroller_sine_pos_old:	DS	1
rgb_scroller_inc_sine:		DS	1
rgb_scroller_inc_sine_line:	DS	1

; RGB handler
; -----------

rgb_scroller_inc_red:	DS	1
rgb_scroller_inc_green:	DS	1
rgb_scroller_inc_blue:	DS	1

rgb_scroller_inc_red_line:	DS	1
rgb_scroller_inc_green_line:	DS	1
rgb_scroller_inc_blue_line:	DS	1

rgb_scroller_component_pos:	; This = The next 3 together
rgb_scroller_red_pos:	DS	1
rgb_scroller_green_pos:	DS	1
rgb_scroller_blue_pos:	DS	1

rgb_scroller_component_pos_old: ; This = The next 3 together
rgb_scroller_red_pos_old:	DS	1
rgb_scroller_green_pos_old:	DS	1
rgb_scroller_blue_pos_old:	DS	1

rgb_scroller_red_enabled:	DS	1 ; FF = enabled, 00 = disabled
rgb_scroller_green_enabled:	DS	1
rgb_scroller_blue_enabled:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "RGB_Flasher", CODE, BANK[1]
	
rgb_scroller_vbl_handler:
	
	ld	a,$98 ; If this is 0, first lines will still use last line's palette
	ld	[rLYC],a
	
	; Handle colors
	; -------------
	
	ld	hl,rgb_scroller_component_pos_old
	
	ld	a,[rgb_scroller_inc_red]
	add	a,[hl]
	ld	[hl+],a	
	ld	[rgb_scroller_red_pos],a

	ld	a,[rgb_scroller_inc_green]
	add	a,[hl]
	ld	[hl+],a	
	ld	[rgb_scroller_green_pos],a
	
	ld	a,[rgb_scroller_inc_blue]
	add	a,[hl]
	ld	[hl],a	
	ld	[rgb_scroller_blue_pos],a

	; Wave effect
	; -----------
	
	ld	hl,rgb_scroller_sine_pos_old
	ld	a,[rgb_scroller_inc_sine]
	add	a,[hl]
	ld	[hl],a	
	ld	[rgb_scroller_sine_pos],a	

	; Scroll
	; ------
	
	ld	hl,rgb_scroller_wait_scr
	ld	a,[hl]
	and	a,a
	jr	z,.continue_scroll
	
	dec	[hl]
	jp .rgb_scroller_vbl_handler_end
	
.continue_scroll:
	ld	hl,rgb_scroller_inc_scroll
	ld	c,[hl] ; c = rgb_scroller_inc_scroll
	
	ld	a,[rSCY]
	ld	b,a ; save old scy
	add	a,c
	ld	[rSCY],a ; scroll bg...
	
	ld	a,b ; get old scy
	and	a,$7
	add	a,c
	cp	a,8
	; if greater, new line, else return
	jr	c,.rgb_scroller_vbl_handler_end

	ld	hl,rgb_scroller_scroll_pos ; increase line count...
	inc	[hl]
	jr	nz,._no_carry
	inc	hl
	inc	[hl]
._no_carry:

	ld	hl,rgb_scroller_current_y
	ld	a,[hl]
	inc	a
	and	a,31
	ld	[hl],a
	
	; copy next line to screen
	
	ld	b,a ; save tile line

	ld	hl,rgb_scroller_next_data
	ld	e,[hl]
	inc	hl
	ld	d,[hl]
	
	push	de ; source
	
	ld	h,d
	ld	l,e
	
	ld	de,20
	add	hl,de

	ld	de,rgb_scroller_next_data
	ld	a,l
	ld	[de],a
	inc	de
	ld	a,h
	ld	[de],a ; save next position to read from
	
	ld	de,$9800
	ld	h,$00
	ld	l,b  ; get tile line
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl ; * 32
	add	hl,de ; hl = dest
	
	ld	d,h
	ld	e,l ;de = dest
	pop	hl ; hl = source
	
	;ld	bc,20
	;call	memcopy ; vram_copy not needed, we're in vblank
	
	; make it copy fast
	REPT 20
	ld	a,[hl+]
	ld	[de],a
	inc	de
	ENDR

.rgb_scroller_vbl_handler_end
	
	LONG_CALL	gbt_update
	
	ret

;----------------------------------------------
	
rgb_scroller_lcd_handler:
	
	; handle color components' pointers
	; ---------------------------------
	
	ld	hl,rgb_scroller_component_pos
	
	ld	a,[rgb_scroller_inc_red_line]
	add	a,[hl]
	ld	[hl+],a	
	
	ld	a,[rgb_scroller_inc_green_line]
	add	a,[hl]
	ld	[hl+],a	
	
	ld	a,[rgb_scroller_inc_blue_line]
	add	a,[hl]
	ld	[hl],a
	
	; Check if this line has to be black...
	; -------------------------------------
	
	ld	a,[rgb_scroller_start_ly]
	cp	a,$98
	jr	z,._check_rgb_scroller_end_ly
	ld	b,a
	ld	a,[rLY]
	cp	a,b
	jr	c,._line_black
	
._check_rgb_scroller_end_ly:
	ld	a,[rgb_scroller_end_ly]
	ld	b,a
	ld	a,[rLY]
	cp	a,b
	jr	c,._line_colors	

._line_black
	; black line ...
	ld	hl,$0000 ; black
	; if black, we have to wait until we can change the palette...
	ld	c,rSTAT & $FF
._not_yet:
	ld	a,[$FF00+c]
	and	a,$02
	jr	nz,._not_yet
	jp	._load_palette
	
._line_colors:

	; get values from the pointers...
	; -------------------------------

	ld	h,rgb_scroller_sine_wave_data >> 8
	
	ld	a,[rgb_scroller_red_pos]
	ld	l,a	
	ld	b,[hl] ; b = red
	ld	a,[rgb_scroller_red_enabled]
	and a,b
	ld	b,a
	
	ld	a,[rgb_scroller_green_pos]
	ld	l,a
	ld	c,[hl] ; c = green
	ld	a,[rgb_scroller_green_enabled]
	and a,c
	ld	c,a
	
	ld	a,[rgb_scroller_blue_pos]
	ld	l,a
	ld	l,[hl] ; l = blue
	ld	a,[rgb_scroller_blue_enabled]
	and a,l
	ld	l,a
	
	; get rgb 16-bit value...
	; -----------------------
	
	; l = blue
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	
	ld	a,c ; c = green
	or	a,l
	ld	l,a
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	
	ld	a,b ; b = red
	or	a,l
	ld	l,a
	
	; don't test if screen blank... we should be there right now...
	
	
._load_palette:

	; hl = rgb value, load it...
	; --------------------------
	
	ld	a,$80 ; palette 0 * 8, autoincrement
	ld	[rBCPS],a
	
	ld	a,l
	ld	[rBCPD],a
	ld	a,h
	ld	[rBCPD],a

	; handle wave ...
	; ---------------
	
	; do this when hblank or it will sometimes make some lines appear bad
	
	ld	hl,rgb_scroller_sine_pos
	ld	a,[rgb_scroller_inc_sine_line]
	add	a,[hl]
	ld	[hl],a	
	
	ld	h,Sine >> 8
	ld	l,a
	ld	a,[hl]
	sra	a ; divide by 16 the resulting value...
	sra	a
	sra	a
	sra	a
	ld	[rSCX],a
	
	; prepare next interrupt
	; ----------------------
	
	; in this way, if the interrupt lasts more than one line, it will happen the next possible line.
	
	ld	a,[rLY]
	inc	a
	ld	[rLYC],a
	
	ret

;----------------------------------------------

	GLOBAL RGB_Scroller
	
RGB_Scroller:
	
	; Use window to hide screen
	
	ld	b,$90
	call	wait_ly
	
	call	vram_clear_palettes
	
	ld	a,LCDCF_ON
	ld	[rLCDC],a
	
	; load data...
	; ------------
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,29
	ld	de,256
	ld	hl,rgb_scroller_tiles
	call	vram_copy_tiles
	
	ld	bc,32*32
	ld	d,0
	ld	hl,MAP_TEMP
	call	memset
	
	ld	a,1
	ld	[rVBK],a

	ld	bc,32*32
	ld	hl,MAP_TEMP
	ld	de,$9800
	call	vram_copy ; clear attribute map

	ld	a,0
	ld	[rVBK],a
	
	ld	bc,32*32
	ld	hl,MAP_TEMP
	ld	de,$9800
	call	vram_copy ; clear tile index map
	
	; Configure some things...
	; ------------------------

	; rgb handler
	
	ld	a,$0
	ld	[rgb_scroller_red_pos],a
	ld	[rgb_scroller_green_pos],a
	ld	[rgb_scroller_blue_pos],a
	ld	[rgb_scroller_red_pos_old],a
	ld	[rgb_scroller_green_pos_old],a
	ld	[rgb_scroller_blue_pos_old],a
	
	ld	a,-3
	ld	[rgb_scroller_inc_red_line],a
	ld	a,-2
	ld	[rgb_scroller_inc_green_line],a
	ld	a,1
	ld	[rgb_scroller_inc_blue_line],a
	ld	a,3
	ld	[rgb_scroller_inc_red],a
	ld	a,-1
	ld	[rgb_scroller_inc_green],a
	ld	a,2
	ld	[rgb_scroller_inc_blue],a
	
	; wave effect
	
	ld	a,$0
	ld	[rgb_scroller_sine_pos],a
	ld	[rgb_scroller_sine_pos_old],a
	
	ld	a,$8
	ld	[rgb_scroller_inc_sine],a
	ld	a,$4
	ld	[rgb_scroller_inc_sine_line],a
	
	; scroller
	
	ld	a,18 ; start drawing outside the screen
	ld	[rgb_scroller_current_y],a
	ld	a,0
	ld	[rgb_scroller_wait_scr],a
	ld	hl,rgb_scroller_scroll_pos
	ld	a,$00
	ld	[hl+],a
	ld	[hl],a
	ld	hl,rgb_scroller_next_data
	ld	a,rgb_scroller_bg_map & $FF 
	ld	[hl+],a
	ld	[hl],rgb_scroller_bg_map >> 8
	
	ld	a,$1
	ld	[rgb_scroller_inc_scroll],a
	
	; Setup scrolls
	
	ld	a,0
	ld	[rSCX],a
	ld	[rSCY],a
	ld	[rWY],a
	ld	a,7
	ld	[rWX],a
	
	; Set up window...
	
	call	wait_screen_blank
	
	ld	a,(7*8) | $80 ; palette 7 * 8, autoincrement
	ld	[rBCPS],a
	
	xor	a,a
	ld	[rBCPD],a
	ld	[rBCPD],a
	
	ld	[rBCPD],a
	ld	[rBCPD],a
	
	ld	[rBCPD],a
	ld	[rBCPD],a
	
	ld	[rBCPD],a
	ld	[rBCPD],a
	
	ld	a,1
	ld	[rVBK],a
	ld	hl,$9C00
	ld	bc,32*32
	ld	d,$07 ; palette 7
	call	vram_memset
	ld	a,0
	ld	[rVBK],a
	
	; Load palette
	
	ld	b,145
	call	wait_ly
	
	ld	a,0
	ld	hl,rgb_scroller_palette
	call	bg_set_palette
	
	; Power on LCD...
	
	ld	a,LCDCF_BG8800|LCDCF_BG9800|LCDCF_WINON|LCDCF_WIN9C00|LCDCF_ON
	ld	[rLCDC],a
	
	; Set up interrupts...
	; --------------------
	
	ld	b,$90
	call	wait_ly
	
	ld	bc,rgb_scroller_vbl_handler
	call	irq_set_VBL
	
	ld	bc,rgb_scroller_lcd_handler
	call	irq_set_LCD
	
	ld	a,0
	ld	[rIF],a
	
	ld	a,$03
	ld	[rIE],a
	
	ld	a,STATF_LYC
	ld	[rSTAT],a
	
	; Begin ...
	; ---------

	ld	a,$91
	ld	[rgb_scroller_start_ly],a 
	ld	[rgb_scroller_end_ly],a
	
	ld  a,$FF ; enable all colors
	ld	[rgb_scroller_red_enabled],a
	ld	[rgb_scroller_green_enabled],a
	ld	[rgb_scroller_blue_enabled],a
	
	;-------------------------
	; INTRO - BLACK TO COLORS
	;-------------------------
	
._black_to_colors:		; show screen...
	ld	a,255
	ld	[rgb_scroller_wait_scr],a ; don't let the scroller start...	
	
	call	wait_vbl
	
	ld	hl,rWX
	inc [hl]
	
	ld	hl,rgb_scroller_start_ly
	dec	[hl]
	ld	a,[hl]
	and	a,a
	jr	nz,._black_to_colors
	
._hide_window:		; hide the rest of the window...
	ld	a,255
	ld	[rgb_scroller_wait_scr],a ; don't let the scroller start...
	
	call	wait_vbl
	
	ld	hl,rWX
	inc [hl]
	
	ld	a,168
	cp	a,[hl]
	jr	nc,._hide_window
	
	ld  a,$FF 
	ld	[rgb_scroller_red_enabled],a
	ld	a,0
	ld	[rgb_scroller_green_enabled],a
	ld  a,0 
	ld	[rgb_scroller_blue_enabled],a
	
	; start scroller
	
	ld	a,30
	ld	[rgb_scroller_wait_scr],a ; wait half a second before starting the scroller

	ld	a,$98 ; this is ready now
	ld	[rgb_scroller_start_ly],a
	
	;-----------------
	; MAIN LOOP START
	;-----------------
	
	; Wait until "hello" is in the screen
._hello:
	call	wait_vbl
	ld	hl,rgb_scroller_scroll_pos
	ld	a,[hl]
	cp	a,$0C	
	jr	nz,._hello
	
	ld  a,0 
	ld	[rgb_scroller_red_enabled],a
	ld	a,$FF
	ld	[rgb_scroller_green_enabled],a
	ld  a,0 
	ld	[rgb_scroller_blue_enabled],a
	
	ld	a,$4         ; wait 1 second ...
	ld	[rgb_scroller_inc_sine],a
	ld	a,60
	ld	[rgb_scroller_wait_scr],a
	ld	e,60
	call	wait_frames
	ld	a,$8
	ld	[rgb_scroller_inc_sine],a
	
	ld  a,0 
	ld	[rgb_scroller_red_enabled],a
	ld	a,0
	ld	[rgb_scroller_green_enabled],a
	ld  a,$FF
	ld	[rgb_scroller_blue_enabled],a
	
	ld	a,$4         ; wait 1 second ...
	ld	[rgb_scroller_inc_sine],a
	ld	a,60
	ld	[rgb_scroller_wait_scr],a
	ld	e,60
	call	wait_frames
	
	ld	a,$8
	ld	[rgb_scroller_inc_sine],a
	
	ld  a,0 
	ld	[rgb_scroller_red_enabled],a
	ld	a,$FF
	ld	[rgb_scroller_green_enabled],a
	ld  a,$FF
	ld	[rgb_scroller_blue_enabled],a
	
	; Start scrolling after "hello" and stop at "Back to color" title
	
._rgb_scroller_title:
	call	wait_vbl
	ld	a,[rgb_scroller_scroll_pos]
	cp	a,$3D
	jr	nz,._rgb_scroller_title
	
	ld	a,$4          ; wait 2 seconds ...
	ld	[rgb_scroller_inc_sine],a
	ld	a,120
	ld	[rgb_scroller_wait_scr],a
	ld	e,120
	call	wait_frames
	
	ld  a,$FF
	ld	[rgb_scroller_red_enabled],a
	ld	a,$FF
	ld	[rgb_scroller_green_enabled],a
	ld  a,0
	ld	[rgb_scroller_blue_enabled],a
	
	ld	a,$4          ; wait 1 second ...
	ld	[rgb_scroller_inc_sine],a
	ld	a,60
	ld	[rgb_scroller_wait_scr],a
	ld	e,60
	call	wait_frames
	
	ld  a,$FF
	ld	[rgb_scroller_red_enabled],a
	ld	a,0
	ld	[rgb_scroller_green_enabled],a
	ld  a,$FF
	ld	[rgb_scroller_blue_enabled],a
	
	ld	a,$4          ; wait 1 second ...
	ld	[rgb_scroller_inc_sine],a
	ld	a,60
	ld	[rgb_scroller_wait_scr],a
	ld	e,60
	call	wait_frames
	
	ld	a,$8
	ld	[rgb_scroller_inc_sine],a
	
	ld  a,$FF
	ld	[rgb_scroller_red_enabled],a
	ld	a,$FF
	ld	[rgb_scroller_green_enabled],a
	ld  a,$FF
	ld	[rgb_scroller_blue_enabled],a
	
	; Start moving after "Back to color" title

	ld	a,0
	ld	[rgb_scroller_inc_scroll],a  ; stop scroller
	ld	a,$4
	ld	[rgb_scroller_inc_sine],a
	

	ld	a,1
	ld	[rgb_scroller_inc_scroll],a  ; stop scroller
	ld	a,$8
	ld	[rgb_scroller_inc_sine],a
	
	; Wait for the end of the scroller
	
._not_end:
	call	wait_vbl
	ld	a,[rgb_scroller_scroll_pos]
	cp	a,$5F
	jr	nz,._not_end

	ld	a,0
	ld	[rgb_scroller_inc_scroll],a  ; stop scroller
	
	;-----------------------
	; END - COLORS TO BLACK
	;-----------------------

	ld	e,50
	call	wait_frames
	
._colors_to_black:		; hide screen...

	call	wait_vbl
	ld	hl,rWX
	dec [hl]
	
	ld	hl,rgb_scroller_end_ly
	dec	[hl]
	ld	a,[hl]
	and	a,a
	jr	nz,._colors_to_black
	
	ld	a,$98
	ld	[rgb_scroller_start_ly],a ; black
	
	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

