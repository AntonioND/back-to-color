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
	

;--------------------------------------------------------------------------
;-                             RESTART VECTORS                            -
;--------------------------------------------------------------------------

	SECTION	"RST_00",HOME[$0000]
	ret ; Reserved for interrupt handler. If any interrupt vector is $0000 it jumps here and returns.
	
	SECTION	"RST_08",HOME[$0008]
	jp	hl ; Reserved for interrupt handler. (Or any other function that uses "call hl")

	SECTION	"RST_10",HOME[$0010]
	ret

	SECTION	"RST_18",HOME[$0018]
	ret

	SECTION	"RST_20",HOME[$0020]
	ret

	SECTION	"RST_28",HOME[$0028]
	ret

	SECTION	"RST_30",HOME[$0030]
	ret

	SECTION	"RST_38",HOME[$0038]
	ret
	
;--------------------------------------------------------------------------
;-                            INTERRUPT VECTORS                           -
;--------------------------------------------------------------------------
	
	SECTION	"Interrupt Vectors",HOME[$0040]
	
;	SECTION	"VBL Interrupt Vector",HOME[$0040]
	push	hl
	ld	hl,_is_vbl_flag
	ld	[hl],1
	jr	irq_VBlank
	
;	SECTION	"LCD Interrupt Vector",HOME[$0048]
	push	hl
	ld	hl,LCD_handler
	jr	irq_Common
	nop
	nop
	
;	SECTION	"TIM Interrupt Vector",HOME[$0050]
	push	hl
	ld	hl,TIM_handler
	jr	irq_Common
	nop
	nop
	
;	SECTION	"SIO Interrupt Vector",HOME[$0058]
	push	hl
	ld	hl,SIO_handler
	jr	irq_Common
	nop
	nop
	
;	SECTION	"JOY Interrupt Vector",HOME[$0060]
	push	hl
	ld	hl,JOY_handler
	jr	irq_Common
;	nop
;	nop

;--------------------------------------------------------------------------
;-                               IRQS HANDLER                             -
;--------------------------------------------------------------------------

irq_VBlank:
	ld	hl,VBL_handler
	
irq_Common:
	push	af
	
	ld	a,[hl+]
	ld	h,[hl]
	ld	l,a
	
	; If vector is $0000, it will jump there and return. Not needed to check here.
	
	push	bc
	push	de
	rst $08 ; call irq handler
	pop	de
	pop	bc
	pop	af
	pop	hl
	
	reti

;--------------------------------------------------------------------------
;- wait_vbl()                                                             -
;--------------------------------------------------------------------------
	
wait_vbl:
	
	ld	hl,_is_vbl_flag
	ld	[hl],0
	
._not_yet:	
	halt
	bit	0,[hl]
	jr	z,._not_yet
	
	ret

;--------------------------------------------------------------------------
;-                             CARTRIDGE HEADER                           -
;--------------------------------------------------------------------------
	
	SECTION	"Cartridge Header",HOME[$0100]
	
	nop
	jp	StartPoint

	NINTENDO_LOGO

	;    0123456789ABCDE
	DB  "BACK TO COLOR",0,0
	DB  $C0 ;GBC flag
	DB  0,0,0	;SGB
	DB	CART_ROM_MBC5 ;CARTTYPE (MBC5)
	DB	0	;ROMSIZE
	DB	0	;RAMSIZE

	DB	$01 ;Destination (0 = Japan, 1 = Non Japan)
	DB	$00	;Manufacturer

	DB	0	;Version
	DB	0	;Complement check
	DW	0	;Checksum

;--------------------------------------------------------------------------
;-                          INITIALIZE THE GAMEBOY                        -
;--------------------------------------------------------------------------

	SECTION	"Program Start",HOME[$0150]
	
StartPoint:

	di
	
	ld	sp,$FFFE ; Use this as stack for a while

	push	af ; Save CPU type
	push	bc
	
	xor	a,a
	ld	[rNR52],a ; Switch off sound

IF	0 ; Set to 1 to get a random seed from RAM values

	; Add all ram values to get a random seed
	ld	hl,_RAM
	ld	bc,$2000
	ld	e,$00
.random_seed_loop:
	ld	a,e
	add	a,[hl]
	ld	e,a
	inc	hl
	dec	bc
	ld	a,b
	or	a,c
	jr	nz,.random_seed_loop
	ld	a,e
	push	af ; Save seed
	
	ld	hl,_RAM ; Clear RAM
	ld	bc,$2000
	ld	d,$00
	call	memset
	
	pop	af ; Get random seed
	call	SetRandomSeed

ELSE

	ld	hl,_RAM ; Clear RAM
	ld	bc,$2000
	ld	d,$00
	call	memset
	
	ld	a,2+9+0+5
	call	SetRandomSeed

ENDC

	pop	bc ; Get CPU type
	pop	af
	
	ld	[Init_Reg_A],a  ; Save CPU type into RAM
	ld	a,b
	ld	[Init_Reg_B],a
	
	ld	sp,StackTop ; Real stack
	
	call	screen_off

	ld	hl,_VRAM ; Clear VRAM
	ld	bc,$2000
	ld	d,$00
	call	memset
	
	ld	hl,_HRAM ; Clear high RAM (and rIE)
	ld	bc,$0080
	ld	d,$00
	call	memset
	
	call	init_OAM ; Copy OAM refresh function to high ram
	call	refresh_OAM ; We filled RAM with $00, so this will clear OAM
	
	call	rom_handler_init
	
	; Real program starts here
	
	call	Main
	
	;Should never reach this point
	
	jp	Reset
	
;--------------------------------------------------------------------------
;- Reset()                                                                -
;--------------------------------------------------------------------------

Reset::
	ld	a,[Init_Reg_B]
	ld	b,a
	ld	a,[Init_Reg_A]
	jp	$0100

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
	
irq_set_VBL::

	ld	hl,VBL_handler
	jr	irq_set_handler

irq_set_LCD::

	ld	hl,LCD_handler
	jr	irq_set_handler

irq_set_TIM::

	ld	hl,TIM_handler
	jr	irq_set_handler
	
irq_set_SIO::

	ld	hl,SIO_handler
	jr	irq_set_handler
	
irq_set_JOY::

	ld	hl,JOY_handler
;	jr	irq_set_handler

irq_set_handler:  ; hl = dest handler    bc = function pointer
	di
	ld	[hl],c
	inc	hl
	ld	[hl],b
	ei
	
	ret

;--------------------------------------------------------------------------

irq_set_VBL_no_ei::

	ld	hl,VBL_handler
	jr	irq_set_handler_no_ei

irq_set_LCD_no_ei::

	ld	hl,LCD_handler
	jr	irq_set_handler_no_ei

irq_set_TIM_no_ei::

	ld	hl,TIM_handler
	jr	irq_set_handler_no_ei
	
irq_set_SIO_no_ei::

	ld	hl,SIO_handler
	jr	irq_set_handler_no_ei
	
irq_set_JOY_no_ei::

	ld	hl,JOY_handler
;	jr	irq_set_handler_no_ei

irq_set_handler_no_ei:  ; hl = dest handler    bc = function pointer
	di
	ld	[hl],c
	inc	hl
	ld	[hl],b
	
	ret

;--------------------------------------------------------------------------

irq_clear_all::
	
	di
	
	xor	a,a
	ld	hl,VBL_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,LCD_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,TIM_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,SIO_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,JOY_handler
	ld	[hl+],a
	ld	[hl+],a
	
	reti

irq_clear_all_irq_disabled::
	
	di
	
	xor	a,a
	ld	hl,VBL_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,LCD_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,TIM_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,SIO_handler
	ld	[hl+],a
	ld	[hl+],a
	ld	hl,JOY_handler
	ld	[hl+],a
	ld	[hl+],a
	
	ret
	
;--------------------------------------------------------------------------
;- CPU_fast()                                                             -
;- CPU_slow()                                                             -
;--------------------------------------------------------------------------
	
CPU_fast::

	ld	a,[rKEY1]
	bit	7,a
	jr	z,__CPU_switch
	ret
	
CPU_slow::

	ld	a,[rKEY1]
	bit	7,a
	jr	nz,__CPU_switch
	ret

__CPU_switch:
	
	ld	a,[rIE]
	ld	b,a ; save IE
	xor	a,a
	ld	[rIE],a
	ld	a,$30
	ld	[rP1],a
	ld	a,$01
	ld	[rKEY1],a
	
	stop
	
	ld	a,b
	ld	[rIE],a ; restore IE
	
	ret

;--------------------------------------------------------------------------
;-                               Variables                                -
;--------------------------------------------------------------------------	
	
	SECTION	"StartupVars",BSS
	
Init_Reg_A::	DS 1
Init_Reg_B::	DS 1

_is_vbl_flag:	DS 1

VBL_handler:	DS 2
LCD_handler:	DS 2
TIM_handler:	DS 2
SIO_handler:	DS 2
JOY_handler:	DS 2

	SECTION	"Stack",BSS[$CE00]

Stack:	DS	$200
StackTop: ; $D000
