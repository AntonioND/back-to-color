;
; Copyright (c) 2014-2018, Antonio Niño Díaz (AntonioND)
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
HEADER_INC	=	1

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                                MACROS                                   | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

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

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                                 LUTS.ASM                                | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

Sine	EQU	$3E00 ; \ Aligned to $100 to improve speed when
Cosine	EQU	$3F00 ; / reading from them. :)

;--------------------------------------------------------------------------
;- GetRandom()    a = returned value    hl is destroyed                   -
;- SetRandomSeed()    a = new seed                                        -
;--------------------------------------------------------------------------

	EXPORT	GetRandom
	EXPORT	SetRandomSeed

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                                 INIT.ASM                                | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

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

	EXPORT irq_set_VBL
	EXPORT irq_set_LCD
	EXPORT irq_set_TIM
	EXPORT irq_set_SIO
	EXPORT irq_set_JOY
	EXPORT irq_clear_all
	EXPORT irq_set_VBL_no_ei
	EXPORT irq_set_LCD_no_ei
	EXPORT irq_set_TIM_no_ei
	EXPORT irq_set_SIO_no_ei
	EXPORT irq_set_JOY_no_ei
	EXPORT irq_clear_all_no_ei

;--------------------------------------------------------------------------
;- CPU_fast()                                                             -
;- CPU_slow()                                                             -
;--------------------------------------------------------------------------

	EXPORT CPU_fast
	EXPORT CPU_slow

;--------------------------------------------------------------------------
;- wait_vbl()                                                             -
;--------------------------------------------------------------------------

	EXPORT wait_vbl

;--------------------------------------------------------------------------
;- Reset()                                                                -
;--------------------------------------------------------------------------

	EXPORT	Reset

;--------------------------------------------------------------------------
;-                                Variables                               -
;--------------------------------------------------------------------------

	EXPORT Init_Reg_A
	EXPORT Init_Reg_B

	EXPORT VBL_handler
	EXPORT LCD_handler
	EXPORT TIM_handler
	EXPORT SIO_handler
	EXPORT JOY_handler

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                                 MAIN.ASM                                | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

;--------------------------------------------------------------------------
;- Main()                                                                 -
;--------------------------------------------------------------------------

	EXPORT	Main

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                            UTILITIES.ASM                                | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

;--------------------------------------------------------------------------
;- mul_u8u8u16()    hl = returned value    a,c = initial values           -
;- mul_s8u8s16()    hl = returned value    a,c = values (a is signed)     -
;- div_u8u8u8()     c = a / b     a = a % b                               -
;- div_s8s8s8()     a / b -> c     a % b -> a     destroys e              -
;--------------------------------------------------------------------------

	EXPORT	mul_u8u8u16
	EXPORT	mul_s8u8s16
	EXPORT	div_u8u8u8
	EXPORT	div_s8s8s8

;--------------------------------------------------------------------------
;- memset()    d = value    hl = start address    bc = size               -
;- memset_fast()    a = value    hl = start address    b = size           -
;- memset_rand()    hl = start address    bc = size                       -
;- memcopy()    bc = size    hl = source address    de = dest address     -
;- memcopy_fast()    b = size    hl = source address    de = dest address -
;- memcopy_inc()    b = size    c = increase_src    hl = src    de = dst  -
;--------------------------------------------------------------------------

	EXPORT memset
	EXPORT memset_fast
	EXPORT memset_rand
	EXPORT memcopy
	EXPORT memcopy_fast
	EXPORT memcopy_inc


;--------------------------------------------------------------------------
;- scan_keys()                                                            -
;--------------------------------------------------------------------------

	EXPORT	scan_keys

	EXPORT	joy_held
	EXPORT	joy_pressed

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

	EXPORT	rom_handler_init
	EXPORT	rom_bank_pop
	EXPORT	rom_bank_push
	EXPORT	rom_bank_set
	EXPORT	rom_bank_push_set
	EXPORT	___long_call
	EXPORT	___long_call_args ; can use de and bc for passing arguments

;--------------------------------------------------------------------------

;+-----------------------------------------------------------------------------+
;| +-------------------------------------------------------------------------+ |
;| |                              VIDEO.ASM                                  | |
;| +-------------------------------------------------------------------------+ |
;+-----------------------------------------------------------------------------+

	EXPORT OAM_Copy ; OAM copy for DMA

;--------------------------------------------------------------------------
;- wait_ly()    b = ly to wait for                                        -
;- wait_frames()    e = frames to wait                                    -
;- wait_screen_blank()                                                    -
;- screen_off()                                                           -
;- vram_clear_palettes()                                                  -
;--------------------------------------------------------------------------

	EXPORT wait_ly
	EXPORT wait_frames
	EXPORT wait_screen_blank
	EXPORT screen_off
	EXPORT vram_clear_palettes

;--------------------------------------------------------------------------
;- vram_copy()    bc = size    hl = source address    de = dest address   -
;- vram_memset()    bc = size    d = value    hl = dest address           -
;- vram_copy_tiles()    bc = tiles    de = start index    hl = source     -
;--------------------------------------------------------------------------

	EXPORT vram_copy
	EXPORT vram_memset
	EXPORT vram_copy_tiles

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

	EXPORT OAM_Copy

	EXPORT init_OAM
	EXPORT refresh_OAM
	EXPORT refresh_custom_OAM
	EXPORT sprite_get_base_pointer
	EXPORT sprite_set_xy
	EXPORT sprite_set_tile
	EXPORT sprite_set_params
	EXPORT spr_set_palette
	EXPORT spr_set_palette_black

;--------------------------------------------------------------------------
;- bg_set_tile()    b = x    c = y    a = tile index                      -
;- bg_set_tile_wrap()    b = x    c = y    a = tile index                 -
;-                                                                        -
;- bg_set_palette()    a = palette number    hl = pointer to data         -
;- bg_set_palette_black()    a = palette number                           -
;--------------------------------------------------------------------------

	EXPORT bg_set_tile
	EXPORT bg_set_tile_wrap
	EXPORT bg_set_palette
	EXPORT bg_set_palette_black

	ENDC	;HEADER_INC

