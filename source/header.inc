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


	IF	!DEF(HEADER_INC)
HEADER_INC	SET	1

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                                  MACROS                                     | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

DMA_COPY: MACRO   ;   src, dst, size, is_hdma
	ld	a, ( \1 >> 8 )& $FF
	ld	[rHDMA1],a
	ld	a, \1 & $F0 ; Lower 4 bits ignored
	ld	[rHDMA2],a
	
	ld	a, ( \2 >> 8 )& $1F ; Upper 3 bits ignored
	ld	[rHDMA3],a
	ld	a, \2 & $F0 ; Lower 4 bits ignored
	ld	[rHDMA4],a
	
	ld	a, ( ( ( \3 >> 4 ) - 1 ) | ( \4 << 7 ) ) ; ( Size / $10 ) - 1
	ld	[rHDMA5],a
ENDM

LONG_CALL: MACRO  ;  function
	ld	b,BANK(\1)
	ld	hl,\1
	call	___long_call
ENDM

LONG_CALL_ARGS: MACRO  ;  function
	ld	a,BANK(\1)
	ld	hl,\1
	call	___long_call_args ; a bit slower, but it can use bc and de for arguments
ENDM

CALL_HL: MACRO
	rst	$08
ENDM

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                                   LUTS.ASM                                  | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

Sine	EQU	$3E00 ; \ Aligned to $100 to improve speed when
Cosine	EQU	$3F00 ; / reading from them. :)

;--------------------------------------------------------------------------
;- GetRandom()    a = returned value    hl is destroyed                   -
;- SetRandomSeed()    a = new seed                                        -
;--------------------------------------------------------------------------
	
	GLOBAL	GetRandom
	GLOBAL	SetRandomSeed

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                                   INIT.ASM                                  | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

;--------------------------------------------------------------------------
;- irq_set_VBL()    bc = function pointer                                 -
;- irq_set_LCD()    bc = function pointer                                 -
;- irq_set_TIM()    bc = function pointer                                 -
;- irq_set_SIO()    bc = function pointer                                 -
;- irq_set_JOY()    bc = function pointer                                 -
;- irq_clear_all()    Enables IRQs when returning.                        -
;- irq_set_VBL_no_ei()    bc = function pointer                           -
;- irq_set_LCD_no_ei()    bc = function pointer                           -
;- irq_set_TIM_no_ei()    bc = function pointer                           -
;- irq_set_SIO_no_ei()    bc = function pointer                           -
;- irq_set_JOY_no_ei()    bc = function pointer                           -
;- irq_clear_all_no_ei()    Doesn't enable IRQs when returning.           -
;--------------------------------------------------------------------------

	GLOBAL irq_set_VBL
	GLOBAL irq_set_LCD
	GLOBAL irq_set_TIM
	GLOBAL irq_set_SIO
	GLOBAL irq_set_JOY
	GLOBAL irq_clear_all
	GLOBAL irq_set_VBL_no_ei
	GLOBAL irq_set_LCD_no_ei
	GLOBAL irq_set_TIM_no_ei
	GLOBAL irq_set_SIO_no_ei
	GLOBAL irq_set_JOY_no_ei
	GLOBAL irq_clear_all_no_ei

;--------------------------------------------------------------------------
;- CPU_fast()                                                             -
;- CPU_slow()                                                             -
;--------------------------------------------------------------------------

	GLOBAL CPU_fast
	GLOBAL CPU_slow

;--------------------------------------------------------------------------
;- wait_vbl()                                                             -
;--------------------------------------------------------------------------

	GLOBAL wait_vbl
	
;--------------------------------------------------------------------------
;- Reset()                                                                -
;--------------------------------------------------------------------------
	
	GLOBAL	Reset
	
;--------------------------------------------------------------------------
;-                                Variables                               -
;--------------------------------------------------------------------------

	GLOBAL Init_Reg_A
	GLOBAL Init_Reg_B

	GLOBAL VBL_handler
	GLOBAL LCD_handler
	GLOBAL TIM_handler
	GLOBAL SIO_handler
	GLOBAL JOY_handler

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                                   MAIN.ASM                                  | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

;--------------------------------------------------------------------------
;- Main()                                                                 -
;--------------------------------------------------------------------------
	
	GLOBAL	Main	

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                              UTILITIES.ASM                                  | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

;--------------------------------------------------------------------------
;- mul_u8u8u16()    hl = returned value    a,c = initial values           -
;- mul_s8u8s16()    hl = returned value    a,c = values (a is signed)     -
;- div_u8u8u8()     c = a / b     a = a % b                               -
;- div_s8s8s8()     a / b -> c     a % b -> a     destroys e              -
;--------------------------------------------------------------------------

	GLOBAL	mul_u8u8u16
	GLOBAL	mul_s8u8s16
	GLOBAL	div_u8u8u8
	GLOBAL	div_s8s8s8

;--------------------------------------------------------------------------
;- memset()    d = value    hl = start address    bc = size               -
;- memset_fast()    a = value    hl = start address    b = size           -
;- memset_rand()    hl = start address    bc = size                       -
;- memcopy()    bc = size    hl = source address    de = dest address     -
;- memcopy_fast()    b = size    hl = source address    de = dest address -
;- memcopy_inc()    b = size    c = increase_src    hl = src    de = dst  -
;--------------------------------------------------------------------------

	GLOBAL memset
	GLOBAL memset_fast
	GLOBAL memset_rand
	GLOBAL memcopy
	GLOBAL memcopy_fast
	GLOBAL memcopy_inc


;--------------------------------------------------------------------------
;- scan_keys()                                                            -
;--------------------------------------------------------------------------

	GLOBAL	scan_keys
    
    GLOBAL	joy_held
	GLOBAL	joy_pressed

PAD_START   EQU $80
PAD_SELECT  EQU $40
PAD_B       EQU $20
PAD_A       EQU $10
PAD_DOWN    EQU $08
PAD_UP      EQU $04
PAD_LEFT    EQU $02
PAD_RIGHT   EQU $01

;--------------------------------------------------------------------------
;- rom_handler_init()                                                     -
;- rom_bank_pop()                                                         -
;- rom_bank_push()                                                        -
;- rom_bank_set()    b = bank to change to                                -
;- rom_bank_push_set()    b = bank to change to                           -
;-                                                                        -
;- ___long_call()    hl = function    b = bank where it is located        -
;- ___long_call_args()    hl = function    a = bank where it is located   -
;--------------------------------------------------------------------------
	
	GLOBAL	rom_handler_init
	GLOBAL	rom_bank_pop	
	GLOBAL	rom_bank_push
	GLOBAL	rom_bank_set
	GLOBAL	rom_bank_push_set
	GLOBAL	___long_call
	GLOBAL	___long_call_args ; can use de and bc for passing arguments

;--------------------------------------------------------------------------

;+---------------------------------------------------------------------------------+
;| +-----------------------------------------------------------------------------+ |
;| |                                VIDEO.ASM                                    | |
;| +-----------------------------------------------------------------------------+ |
;+---------------------------------------------------------------------------------+

	GLOBAL OAM_Copy ; OAM copy for DMA
	
;--------------------------------------------------------------------------
;- wait_ly()    b = ly to wait for                                        -
;- wait_frames()    e = frames to wait                                    -
;- wait_screen_blank()                                                    -
;- screen_off()                                                           -
;- vram_clear_palettes()                                                  -
;--------------------------------------------------------------------------
	
	GLOBAL wait_ly
	GLOBAL wait_frames
	GLOBAL wait_screen_blank
	GLOBAL screen_off
	GLOBAL vram_clear_palettes
	
;--------------------------------------------------------------------------
;- vram_copy()    bc = size    hl = source address    de = dest address   -
;- vram_memset()    bc = size    d = value    hl = dest address           -
;- vram_copy_tiles()    bc = tiles    de = start index    hl = source     -
;--------------------------------------------------------------------------	
	
	GLOBAL vram_copy
	GLOBAL vram_memset
	GLOBAL vram_copy_tiles
	
;--------------------------------------------------------------------------
;- init_OAM()                                                             -
;- refresh_OAM()                                                          -
;- refresh_custom_OAM()    a = (oam copy >> 8), aligned to 100h           -
;-                                                                        -
;- sprite_get_base_pointer()    l = sprite    return = hl    destroys de  -
;-                                                                        -
;- sprite_set_xy()    b = x    c = y    l = sprite number                 -
;- sprite_set_tile()    a = tile    l = sprite number                     -
;- sprite_set_params()    a = params    l = sprite number                 -
;-                                                                        -
;- spr_set_palette()    a = palette number    hl = pointer to data        -
;- spr_set_palette_black()    a = palette number                          -
;--------------------------------------------------------------------------
	
	GLOBAL OAM_Copy
	
	GLOBAL init_OAM
	GLOBAL refresh_OAM
	GLOBAL refresh_custom_OAM
	GLOBAL sprite_get_base_pointer
	GLOBAL sprite_set_xy
	GLOBAL sprite_set_tile
	GLOBAL sprite_set_params
	GLOBAL spr_set_palette
	GLOBAL spr_set_palette_black
	
;--------------------------------------------------------------------------
;- bg_set_tile()    b = x    c = y    a = tile index                      -
;- bg_set_tile_wrap()    b = x    c = y    a = tile index                 -
;-                                                                        -
;- bg_set_palette()    a = palette number    hl = pointer to data         -
;- bg_set_palette_black()    a = palette number                           -
;--------------------------------------------------------------------------
	
	GLOBAL bg_set_tile
	GLOBAL bg_set_tile_wrap
	GLOBAL bg_set_palette
	GLOBAL bg_set_palette_black

	ENDC	;HEADER_INC
	
