;
; Copyright (c) 2014-2018, Antonio Ni�o D�az (AntonioND)
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

;----------------------------------------------------------
;-                                                        -
;-                SINE AND COSINE LUTS                    -
;-                                                        -
;----------------------------------------------------------

	SECTION "SineLUT", ROM0[$3E00]

_Sine:
	DB	$00,$03,$06,$09,$0c,$0f,$12,$15,$18,$1b,$1e,$21,$24,$27,$2a,$2d
	DB	$30,$33,$36,$39,$3b,$3e,$41,$43,$46,$49,$4b,$4e,$50,$52,$55,$57
	DB	$59,$5b,$5e,$60,$62,$64,$66,$67,$69,$6b,$6c,$6e,$70,$71,$72,$74
	DB	$75,$76,$77,$78,$79,$7a,$7b,$7b,$7c,$7d,$7d,$7e,$7e,$7e,$7e,$7e
	DB	$7f,$7e,$7e,$7e,$7e,$7e,$7d,$7d,$7c,$7b,$7b,$7a,$79,$78,$77,$76
	DB	$75,$74,$72,$71,$70,$6e,$6c,$6b,$69,$67,$66,$64,$62,$60,$5e,$5b
	DB	$59,$57,$55,$52,$50,$4e,$4b,$49,$46,$43,$41,$3e,$3b,$39,$36,$33
	DB	$30,$2d,$2a,$27,$24,$21,$1e,$1b,$18,$15,$12,$0f,$0c,$09,$06,$03
	DB	$00,$fd,$fa,$f7,$f4,$f1,$ee,$eb,$e8,$e5,$e2,$df,$dc,$d9,$d6,$d3
	DB	$d0,$cd,$ca,$c7,$c5,$c2,$bf,$bd,$ba,$b7,$b5,$b2,$b0,$ae,$ab,$a9
	DB	$a7,$a5,$a2,$a0,$9e,$9c,$9a,$99,$97,$95,$94,$92,$90,$8f,$8e,$8c
	DB	$8b,$8a,$89,$88,$87,$86,$85,$85,$84,$83,$83,$82,$82,$82,$82,$82
	DB	$81,$82,$82,$82,$82,$82,$83,$83,$84,$85,$85,$86,$87,$88,$89,$8a
	DB	$8b,$8c,$8e,$8f,$90,$92,$94,$95,$97,$99,$9a,$9c,$9e,$a0,$a2,$a5
	DB	$a7,$a9,$ab,$ae,$b0,$b2,$b5,$b7,$ba,$bd,$bf,$c2,$c5,$c7,$ca,$cd
	DB	$d0,$d3,$d6,$d9,$dc,$df,$e2,$e5,$e8,$eb,$ee,$f1,$f4,$f7,$fa,$fd

	SECTION "CosineLUT", ROM0[$3F00]

_Cosine:
	DB	$7f,$7e,$7e,$7e,$7e,$7e,$7d,$7d,$7c,$7b,$7b,$7a,$79,$78,$77,$76
	DB	$75,$74,$72,$71,$70,$6e,$6c,$6b,$69,$67,$66,$64,$62,$60,$5e,$5b
	DB	$59,$57,$55,$52,$50,$4e,$4b,$49,$46,$43,$41,$3e,$3b,$39,$36,$33
	DB	$30,$2d,$2a,$27,$24,$21,$1e,$1b,$18,$15,$12,$0f,$0c,$09,$06,$03
	DB	$00,$fd,$fa,$f7,$f4,$f1,$ee,$eb,$e8,$e5,$e2,$df,$dc,$d9,$d6,$d3
	DB	$d0,$cd,$ca,$c7,$c5,$c2,$bf,$bd,$ba,$b7,$b5,$b2,$b0,$ae,$ab,$a9
	DB	$a7,$a5,$a2,$a0,$9e,$9c,$9a,$99,$97,$95,$94,$92,$90,$8f,$8e,$8c
	DB	$8b,$8a,$89,$88,$87,$86,$85,$85,$84,$83,$83,$82,$82,$82,$82,$82
	DB	$81,$82,$82,$82,$82,$82,$83,$83,$84,$85,$85,$86,$87,$88,$89,$8a
	DB	$8b,$8c,$8e,$8f,$90,$92,$94,$95,$97,$99,$9a,$9c,$9e,$a0,$a2,$a5
	DB	$a7,$a9,$ab,$ae,$b0,$b2,$b5,$b7,$ba,$bd,$bf,$c2,$c5,$c7,$ca,$cd
	DB	$d0,$d3,$d6,$d9,$dc,$df,$e2,$e5,$e8,$eb,$ee,$f1,$f4,$f7,$fa,$fd
	DB	$00,$03,$06,$09,$0c,$0f,$12,$15,$18,$1b,$1e,$21,$24,$27,$2a,$2d
	DB	$30,$33,$36,$39,$3b,$3e,$41,$43,$46,$49,$4b,$4e,$50,$52,$55,$57
	DB	$59,$5b,$5e,$60,$62,$64,$66,$67,$69,$6b,$6c,$6e,$70,$71,$72,$74
	DB	$75,$76,$77,$78,$79,$7a,$7b,$7b,$7c,$7d,$7d,$7e,$7e,$7e,$7e,$7e

;----------------------------------------------------------
;-                                                        -
;-                       RANDOM                           -
;-                                                        -
;----------------------------------------------------------

	SECTION "RandomLUT", ROM0[$3D00]

_Random:
	DB	$29,$23,$be,$84,$e1,$6c,$d6,$ae,$52,$90,$49,$f1,$f1,$bb,$e9,$eb
	DB	$b3,$a6,$db,$3c,$87,$0c,$3e,$99,$24,$5e,$0d,$1c,$06,$b7,$47,$de
	DB	$b3,$12,$4d,$c8,$43,$bb,$8b,$a6,$1f,$03,$5a,$7d,$09,$38,$25,$1f
	DB	$5d,$d4,$cb,$fc,$96,$f5,$45,$3b,$13,$0d,$89,$0a,$1c,$db,$ae,$32
	DB	$20,$9a,$50,$ee,$40,$78,$36,$fd,$12,$49,$32,$f6,$9e,$7d,$49,$dc
	DB	$ad,$4f,$14,$f2,$44,$40,$66,$d0,$6b,$c4,$30,$b7,$32,$3b,$a1,$22
	DB	$f6,$22,$91,$9d,$e1,$8b,$1f,$da,$b0,$ca,$99,$02,$b9,$72,$9d,$49
	DB	$2c,$80,$7e,$c5,$99,$d5,$e9,$80,$b2,$ea,$c9,$cc,$53,$bf,$67,$d6
	DB	$bf,$14,$d6,$7e,$2d,$dc,$8e,$66,$83,$ef,$57,$49,$61,$ff,$69,$8f
	DB	$61,$cd,$d1,$1e,$9d,$9c,$16,$72,$72,$e6,$1d,$f0,$84,$4f,$4a,$77
	DB	$02,$d7,$e8,$39,$2c,$53,$cb,$c9,$12,$1e,$33,$74,$9e,$0c,$f4,$d5
	DB	$d4,$9f,$d4,$a4,$59,$7e,$35,$cf,$32,$22,$f4,$cc,$cf,$d3,$90,$2d
	DB	$48,$d3,$8f,$75,$e6,$d9,$1d,$2a,$e5,$c0,$f7,$2b,$78,$81,$87,$44
	DB	$0e,$5f,$50,$00,$d4,$61,$8d,$be,$7b,$05,$15,$07,$3b,$33,$82,$1f
	DB	$18,$70,$92,$da,$64,$54,$ce,$b1,$85,$3e,$69,$15,$f8,$46,$6a,$04
	DB	$96,$73,$0e,$d9,$16,$2f,$67,$68,$d4,$f7,$4a,$4a,$d0,$57,$68,$76

	SECTION	"RandomPtr", WRAM0

random_ptr:	DS	1

	SECTION "RandomFunction", ROM0

; ----------------------------------

GetRandom::

	ld	hl,random_ptr
	ld	l,[hl]
	ld	h,_Random>>8

	ldh	a,[rDIV]
	xor	a,[hl]

	inc	l
	add	a,[hl]

	ld	hl,random_ptr
	ld	[hl],a

	ret

; ----------------------------------

SetRandomSeed::

	ld	[random_ptr],a
	ret

; ----------------------------------

;Check if it generates every number
;----------------------------------
;
;	ld	b,0
;.next
;	call	GetRandom
;	cp	b
;	jr	nz,.next
;	inc b
;	xor	a,a
;	cp	b
;	jr	z,.end
;	jr	.next
;.end
