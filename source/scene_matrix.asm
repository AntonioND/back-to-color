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

;-------------------------------------------------------------------------------------------------

	SECTION "MATRIX_DATA", DATA, BANK[7]

matrix_palettes:
	DW $0000,$0000,$0000,$0000
	DW $0000,$00A0,$0140,$01E0
	DW $0000,$0120,$0240,$0360
	DW $0000,$0140,$02A0,$03E0
	DW $0000,$0140,$02A0,$03E0
	DW $0000,$0140,$06A1,$07E1
	DW $0000,$0D43,$1AA6,$27E9
	DW $0000,$2549,$4AB2,$6FFB

matrix_tiles: ; 162 tiles
DB $00,$00,$7E,$3C,$42,$42,$3E,$3E
DB $42,$42,$42,$42,$7E,$3E,$00,$00
DB $40,$40,$40,$40,$7E,$5C,$72,$62
DB $62,$42,$42,$42,$7E,$7C,$00,$00
DB $00,$00,$00,$00,$7E,$3C,$42,$42
DB $40,$40,$42,$42,$7E,$3C,$00,$00
DB $02,$02,$02,$02,$7E,$3A,$46,$46
DB $42,$42,$42,$42,$7E,$3E,$00,$00
DB $00,$00,$00,$00,$7E,$3C,$42,$42
DB $7E,$7E,$40,$40,$7E,$3E,$00,$00
DB $3C,$1C,$20,$20,$20,$20,$7C,$7C
DB $20,$20,$20,$20,$20,$20,$00,$00
DB $00,$00,$7E,$3E,$42,$42,$42,$42
DB $7E,$3E,$02,$02,$7E,$7C,$00,$00
DB $40,$40,$40,$40,$7E,$5C,$62,$62
DB $42,$42,$42,$42,$42,$42,$00,$00
DB $08,$08,$00,$00,$08,$08,$08,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $04,$04,$00,$00,$04,$04,$04,$04
DB $04,$04,$04,$04,$0C,$08,$00,$00
DB $20,$20,$20,$20,$26,$22,$2C,$24
DB $38,$38,$2C,$24,$26,$22,$00,$00
DB $08,$08,$08,$08,$08,$08,$08,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $00,$00,$00,$00,$76,$52,$7F,$6D
DB $49,$49,$49,$49,$49,$49,$00,$00
DB $00,$00,$00,$00,$7E,$5C,$62,$62
DB $42,$42,$42,$42,$42,$42,$00,$00
DB $00,$00,$00,$00,$7E,$3C,$42,$42
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $00,$00,$00,$00,$7E,$7C,$42,$42
DB $42,$42,$7E,$7C,$40,$40,$00,$00
DB $00,$00,$00,$00,$7E,$3E,$42,$42
DB $42,$42,$7E,$3E,$02,$02,$00,$00
DB $00,$00,$00,$00,$7E,$5C,$62,$62
DB $40,$40,$40,$40,$40,$40,$00,$00
DB $00,$00,$00,$00,$7C,$3C,$40,$40
DB $7E,$3C,$02,$02,$3E,$3C,$00,$00
DB $00,$00,$20,$20,$7C,$7C,$20,$20
DB $20,$20,$24,$24,$38,$1C,$00,$00
DB $00,$00,$00,$00,$42,$42,$42,$42
DB $42,$42,$42,$42,$7E,$3E,$00,$00
DB $00,$00,$00,$00,$42,$42,$42,$42
DB $66,$42,$7E,$24,$3C,$18,$00,$00
DB $00,$00,$00,$00,$49,$49,$49,$49
DB $49,$49,$49,$49,$7E,$37,$00,$00
DB $00,$00,$00,$00,$66,$42,$7E,$24
DB $3C,$18,$7E,$24,$66,$42,$00,$00
DB $00,$00,$00,$00,$C6,$82,$EE,$44
DB $7C,$28,$38,$10,$30,$20,$00,$00
DB $00,$00,$00,$00,$7E,$7E,$0E,$04
DB $1C,$08,$38,$10,$7E,$7E,$00,$00
DB $1C,$08,$14,$14,$36,$14,$36,$22
DB $63,$22,$7F,$7F,$41,$41,$00,$00
DB $7F,$7E,$41,$41,$41,$41,$7F,$7E
DB $41,$41,$41,$41,$7F,$7E,$00,$00
DB $7F,$3E,$41,$41,$40,$40,$40,$40
DB $40,$40,$41,$41,$7F,$3E,$00,$00
DB $7F,$7E,$41,$41,$41,$41,$41,$41
DB $41,$41,$41,$41,$7F,$7E,$00,$00
DB $7E,$7E,$40,$40,$40,$40,$7E,$7E
DB $40,$40,$40,$40,$7E,$7E,$00,$00
DB $7E,$7E,$40,$40,$40,$40,$7E,$7E
DB $40,$40,$40,$40,$40,$40,$00,$00
DB $7F,$3E,$41,$41,$40,$40,$47,$47
DB $41,$41,$41,$41,$7F,$3E,$00,$00
DB $41,$41,$41,$41,$41,$41,$7F,$7F
DB $41,$41,$41,$41,$41,$41,$00,$00
DB $08,$08,$08,$08,$08,$08,$08,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $02,$02,$02,$02,$02,$02,$02,$02
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $46,$42,$4E,$44,$5C,$48,$78,$70
DB $5C,$48,$4E,$44,$46,$42,$00,$00
DB $40,$40,$40,$40,$40,$40,$40,$40
DB $40,$40,$40,$40,$7E,$7E,$00,$00
DB $63,$41,$63,$63,$77,$63,$77,$55
DB $5D,$55,$5D,$49,$49,$49,$00,$00
DB $61,$41,$71,$61,$79,$51,$5D,$49
DB $4F,$45,$47,$43,$43,$41,$00,$00
DB $7F,$3E,$41,$41,$41,$41,$41,$41
DB $41,$41,$41,$41,$7F,$3E,$00,$00
DB $7E,$7C,$42,$42,$42,$42,$7E,$7C
DB $40,$40,$40,$40,$40,$40,$00,$00
DB $7E,$3C,$42,$42,$42,$42,$42,$42
DB $4E,$4A,$4E,$46,$7F,$3D,$00,$00
DB $7E,$7C,$42,$42,$42,$42,$7E,$7C
DB $4C,$46,$46,$42,$42,$42,$00,$00
DB $7F,$3E,$41,$41,$40,$40,$7F,$3E
DB $01,$01,$41,$41,$7F,$3E,$00,$00
DB $7F,$7F,$08,$08,$08,$08,$08,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $41,$41,$41,$41,$41,$41,$41,$41
DB $41,$41,$41,$41,$7F,$3E,$00,$00
DB $41,$41,$41,$41,$63,$41,$63,$22
DB $36,$22,$3E,$14,$1C,$08,$00,$00
DB $49,$49,$5D,$49,$55,$5D,$7F,$55
DB $55,$77,$77,$22,$22,$22,$00,$00
DB $63,$41,$77,$22,$3E,$14,$1C,$08
DB $3E,$14,$77,$22,$63,$41,$00,$00
DB $63,$41,$77,$22,$3E,$14,$1C,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $7F,$7F,$07,$02,$0E,$04,$1C,$08
DB $38,$10,$70,$20,$7F,$7F,$00,$00
DB $7E,$3C,$42,$42,$42,$42,$42,$42
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $38,$18,$78,$28,$68,$48,$08,$08
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $7E,$3C,$42,$42,$02,$02,$7E,$3C
DB $40,$40,$40,$40,$7E,$7E,$00,$00
DB $7E,$3C,$42,$42,$42,$42,$1E,$1C
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $0C,$04,$1C,$0C,$3C,$14,$74,$24
DB $64,$44,$7E,$7E,$04,$04,$00,$00
DB $7E,$7E,$40,$40,$7E,$7C,$02,$02
DB $02,$02,$02,$02,$7E,$7C,$00,$00
DB $7E,$3C,$42,$42,$40,$40,$7E,$7C
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $7E,$7E,$06,$02,$06,$04,$0C,$04
DB $0C,$08,$18,$08,$18,$10,$00,$00
DB $7E,$3C,$42,$42,$42,$42,$7E,$3C
DB $42,$42,$42,$42,$7E,$3C,$00,$00
DB $7E,$3C,$42,$42,$42,$42,$7E,$3E
DB $02,$02,$42,$42,$7E,$3C,$00,$00
DB $00,$00,$7F,$7F,$0E,$04,$1C,$08
DB $18,$10,$18,$10,$1C,$0C,$00,$00
DB $20,$20,$20,$20,$36,$26,$3C,$18
DB $70,$20,$60,$40,$60,$40,$7E,$3E
DB $10,$10,$7A,$7A,$31,$11,$34,$24
DB $64,$64,$3F,$3E,$25,$25,$38,$38
DB $00,$00,$5E,$5C,$42,$42,$40,$40
DB $40,$40,$50,$50,$5F,$4F,$40,$40
DB $04,$04,$24,$24,$3F,$3E,$6F,$69
DB $69,$69,$53,$57,$55,$55,$73,$26
DB $10,$10,$10,$10,$7F,$7E,$11,$19
DB $11,$11,$73,$37,$F5,$55,$D3,$96
DB $1C,$1C,$3F,$2A,$6B,$49,$49,$49
DB $49,$49,$49,$49,$7B,$32,$06,$04
DB $00,$00,$42,$42,$5F,$5F,$42,$42
DB $42,$42,$5E,$5E,$53,$53,$3F,$6E
DB $10,$10,$7E,$7E,$10,$10,$1F,$1E
DB $73,$33,$5D,$55,$5D,$49,$7B,$32
DB $00,$00,$42,$42,$43,$42,$43,$41
DB $41,$41,$41,$41,$78,$48,$78,$30
DB $1C,$1C,$00,$00,$7F,$3E,$63,$41
DB $01,$01,$03,$01,$07,$02,$1E,$1C
DB $18,$18,$00,$00,$7F,$7F,$1C,$0C
DB $3C,$18,$7C,$24,$64,$44,$43,$47
DB $10,$10,$7B,$7A,$11,$11,$1F,$1E
DB $73,$31,$51,$51,$53,$51,$77,$26
DB $00,$00,$78,$78,$33,$12,$63,$23
DB $62,$42,$42,$42,$66,$42,$7E,$3C
DB $00,$00,$1C,$1C,$0C,$04,$0C,$08
DB $2C,$24,$65,$45,$55,$55,$08,$1C
DB $10,$10,$10,$10,$7F,$7F,$70,$20
DB $67,$27,$60,$40,$48,$48,$47,$4F
DB $00,$00,$00,$00,$78,$30,$FC,$48
DB $CE,$84,$87,$82,$03,$01,$00,$00
DB $08,$08,$FE,$FE,$08,$08,$38,$78
DB $48,$48,$38,$78,$08,$08,$18,$10
DB $44,$44,$44,$44,$FE,$FE,$44,$44
DB $44,$44,$40,$40,$60,$40,$7C,$3C
DB $20,$20,$26,$24,$FA,$F2,$6A,$2A
DB $68,$48,$C8,$48,$D8,$88,$98,$90
DB $10,$10,$7E,$7E,$08,$08,$7E,$7E
DB $0C,$0C,$0C,$08,$60,$40,$7C,$3C
DB $0C,$04,$18,$08,$30,$10,$20,$20
DB $20,$20,$30,$10,$18,$08,$0C,$04
DB $84,$84,$84,$84,$BE,$BE,$84,$84
DB $84,$84,$84,$84,$CC,$84,$CC,$48
DB $00,$00,$7E,$7C,$06,$02,$00,$00
DB $00,$00,$40,$40,$40,$40,$3E,$7E
DB $00,$00,$9E,$9E,$84,$84,$9E,$9E
DB $84,$84,$9E,$BC,$A6,$A6,$DE,$5C
DB $10,$10,$FC,$FC,$10,$10,$FC,$FC
DB $10,$10,$7C,$F8,$9C,$94,$F0,$70
DB $00,$00,$70,$70,$12,$12,$12,$12
DB $FF,$FF,$A7,$A2,$AE,$A4,$6C,$C8
DB $10,$10,$7A,$7A,$13,$11,$10,$10
DB $70,$70,$51,$51,$71,$31,$1F,$0E
DB $04,$04,$24,$24,$7F,$3E,$67,$65
DB $75,$55,$5D,$4D,$5B,$49,$7B,$32
DB $10,$10,$10,$10,$7C,$7C,$10,$10
DB $7C,$7C,$11,$11,$13,$11,$0F,$1E
DB $24,$24,$24,$24,$7F,$7F,$21,$21
DB $2B,$29,$26,$27,$30,$20,$30,$10
DB $04,$04,$7F,$5E,$67,$65,$65,$45
DB $45,$45,$47,$45,$5F,$5E,$04,$04
DB $18,$18,$04,$0C,$20,$20,$3F,$3F
DB $29,$31,$21,$21,$03,$01,$1F,$1E
DB $22,$22,$22,$22,$22,$22,$32,$32
DB $32,$22,$06,$02,$02,$06,$1E,$1C
DB $08,$08,$0F,$0F,$08,$08,$08,$08
DB $7E,$3C,$6E,$4A,$4A,$4A,$78,$78
DB $1F,$1F,$0E,$06,$1E,$0C,$36,$12
DB $23,$21,$1D,$0D,$16,$13,$1C,$0E
DB $30,$10,$2E,$24,$FE,$EA,$32,$32
DB $36,$24,$E4,$64,$E7,$A5,$27,$22
DB $3E,$3E,$0E,$04,$1C,$08,$3F,$1E
DB $31,$21,$01,$01,$03,$01,$1F,$1E
DB $10,$10,$10,$10,$7F,$7F,$31,$11
DB $71,$31,$71,$51,$51,$51,$17,$16
DB $08,$08,$3E,$3E,$18,$10,$28,$38
DB $2F,$0F,$1C,$14,$14,$10,$1F,$0F
DB $00,$00,$30,$10,$30,$20,$70,$20
DB $58,$70,$F8,$48,$CF,$89,$8F,$86
DB $00,$00,$00,$00,$00,$00,$FC,$F8
DB $04,$0C,$0C,$04,$04,$0C,$7C,$78
DB $10,$10,$FE,$FE,$10,$10,$10,$10
DB $FE,$FE,$10,$10,$10,$10,$00,$00
DB $3E,$3E,$22,$22,$66,$42,$06,$02
DB $0E,$04,$1C,$08,$78,$70,$00,$00
DB $40,$40,$7F,$7F,$C4,$44,$C4,$84
DB $0C,$04,$1C,$08,$78,$70,$00,$00
DB $00,$00,$7E,$7E,$02,$02,$02,$02
DB $02,$02,$02,$02,$7E,$7E,$00,$00
DB $44,$44,$FF,$FF,$44,$44,$44,$44
DB $04,$04,$0C,$04,$3C,$38,$00,$00
DB $20,$20,$B2,$92,$C2,$42,$02,$02
DB $06,$02,$0E,$04,$FC,$F8,$00,$00
DB $00,$00,$7E,$7E,$06,$04,$0C,$08
DB $18,$18,$3C,$24,$66,$42,$00,$00
DB $40,$40,$FE,$FE,$42,$42,$46,$44
DB $4C,$48,$40,$40,$7E,$3E,$00,$00
DB $00,$00,$42,$42,$62,$22,$02,$02
DB $06,$02,$0E,$04,$7C,$78,$00,$00
DB $00,$00,$0C,$08,$0E,$04,$46,$42
DB $C6,$42,$C2,$42,$C2,$82,$00,$00
DB $20,$20,$7E,$3E,$E2,$42,$D2,$92
DB $0E,$0A,$16,$0C,$78,$78,$00,$00
DB $02,$02,$7E,$7C,$08,$08,$FF,$FF
DB $08,$08,$18,$08,$78,$70,$00,$00
DB $00,$00,$52,$52,$52,$52,$52,$52
DB $02,$02,$06,$02,$3E,$3C,$00,$00
DB $7E,$7E,$00,$00,$FF,$FF,$08,$08
DB $18,$08,$38,$10,$30,$20,$00,$00
DB $20,$20,$20,$20,$20,$20,$38,$38
DB $2E,$26,$20,$20,$20,$20,$00,$00
DB $40,$40,$40,$40,$7E,$7E,$40,$40
DB $40,$40,$60,$40,$7E,$3E,$00,$00
DB $08,$08,$08,$08,$FF,$FF,$08,$08
DB $08,$08,$18,$08,$78,$70,$00,$00
DB $00,$00,$7E,$7E,$00,$00,$00,$00
DB $00,$00,$00,$00,$FF,$FF,$00,$00
DB $00,$00,$7E,$7E,$02,$02,$16,$12
DB $1C,$0C,$1E,$0C,$7E,$72,$00,$00
DB $10,$10,$FE,$FE,$0E,$04,$1C,$18
DB $7C,$34,$F6,$D2,$10,$10,$00,$00
DB $00,$00,$02,$02,$02,$02,$06,$02
DB $0E,$04,$1C,$08,$78,$70,$00,$00
DB $00,$00,$FE,$FE,$02,$02,$02,$02
DB $06,$02,$0E,$04,$7C,$78,$00,$00
DB $00,$00,$FF,$FF,$03,$01,$17,$12
DB $16,$14,$30,$10,$30,$20,$00,$00
DB $03,$01,$0F,$06,$3C,$18,$78,$68
DB $08,$08,$08,$08,$08,$08,$00,$00
DB $10,$10,$FE,$FE,$82,$82,$02,$02
DB $06,$02,$0E,$04,$3C,$38,$00,$00
DB $00,$00,$7E,$7E,$10,$10,$10,$10
DB $10,$10,$10,$10,$FF,$FF,$00,$00
DB $00,$00,$7E,$7E,$20,$20,$FE,$FE
DB $20,$20,$20,$20,$3E,$3E,$00,$00
DB $40,$40,$40,$40,$FF,$FF,$66,$22
DB $36,$24,$30,$10,$18,$08,$00,$00
DB $00,$00,$7C,$7C,$04,$04,$04,$04
DB $04,$04,$04,$04,$FF,$FF,$00,$00
DB $00,$00,$7E,$7E,$02,$02,$7E,$7E
DB $02,$02,$02,$02,$7E,$7E,$00,$00
DB $7C,$7C,$00,$00,$FE,$FE,$02,$02
DB $02,$02,$06,$02,$7E,$7C,$00,$00
DB $44,$44,$44,$44,$44,$44,$44,$44
DB $0C,$04,$1C,$08,$38,$30,$00,$00
DB $08,$08,$28,$28,$28,$28,$28,$28
DB $2B,$29,$6F,$2A,$6E,$4C,$00,$00
DB $40,$40,$40,$40,$40,$40,$46,$42
DB $4E,$44,$5C,$48,$78,$70,$00,$00
DB $00,$00,$7E,$7E,$42,$42,$42,$42
DB $42,$42,$42,$42,$7E,$7E,$00,$00
DB $00,$00,$7E,$7E,$42,$42,$42,$42
DB $06,$02,$0E,$04,$1C,$18,$00,$00
DB $7E,$7E,$02,$02,$02,$02,$7E,$7E
DB $06,$02,$0E,$04,$3C,$38,$00,$00
DB $00,$00,$72,$72,$02,$02,$06,$02
DB $06,$02,$1E,$04,$7C,$78,$00,$00
DB $00,$00,$00,$00,$3C,$3C,$04,$04
DB $04,$04,$04,$04,$7E,$7E,$00,$00
DB $00,$00,$00,$00,$7E,$7E,$02,$02
DB $3E,$3E,$02,$02,$7E,$7E,$00,$00
DB $00,$00,$00,$00,$52,$52,$52,$52
DB $06,$02,$0E,$04,$3C,$38,$00,$00
DB $00,$00,$20,$20,$23,$21,$FF,$FE
DB $66,$22,$36,$24,$30,$10,$10,$10
DB $20,$20,$30,$20,$FC,$FC,$30,$10
DB $18,$18,$00,$00,$C0,$80,$F8,$78
DB $80,$80,$80,$80,$80,$80,$80,$80
DB $80,$80,$84,$84,$CC,$84,$FC,$78
DB $20,$20,$FE,$FE,$20,$20,$7E,$3C
DB $66,$42,$02,$02,$06,$02,$3E,$3C
DB $00,$00,$FE,$FC,$06,$02,$02,$02
DB $06,$02,$0E,$04,$3C,$38,$00,$00
DB $7E,$7E,$0E,$04,$1C,$08,$FE,$FE
DB $38,$10,$30,$20,$30,$20,$3C,$1C
DB $00,$00,$48,$48,$FE,$7E,$EE,$CA
DB $E2,$42,$6E,$2C,$20,$20,$00,$00
DB $00,$00,$00,$00,$78,$30,$FC,$48
DB $CE,$84,$07,$02,$03,$01,$00,$00
DB $10,$10,$10,$10,$FE,$FE,$10,$10
DB $10,$10,$54,$54,$D6,$92,$10,$10
DB $00,$00,$FE,$FE,$06,$02,$0E,$04
DB $3C,$28,$38,$10,$18,$08,$00,$00
DB $78,$70,$0C,$0C,$70,$60,$3C,$18
DB $04,$04,$78,$70,$1C,$0C,$00,$00
DB $04,$04,$FF,$FF,$0C,$04,$1C,$0C
DB $3C,$14,$F4,$E4,$04,$04,$00,$00
DB $10,$10,$7E,$7E,$12,$12,$32,$12
DB $32,$12,$76,$22,$66,$44,$00,$00
DB $00,$00,$30,$10,$70,$20,$E0,$40
DB $C6,$84,$C6,$82,$FE,$FE,$00,$00
DB $04,$04,$04,$04,$74,$64,$3C,$14
DB $1C,$0C,$14,$0C,$FE,$FA,$00,$00
DB $00,$00,$B8,$90,$FC,$B8,$FC,$D4
DB $DC,$94,$BC,$B8,$38,$10,$00,$00
DB $00,$00,$10,$10,$1C,$1C,$10,$10
DB $F8,$70,$9C,$98,$FC,$64,$00,$00

matrix_sprite_tiles: ; 38 tiles
DB $FF,$FF,$FF,$80,$FF,$80,$FF,$F3
DB $1E,$12,$1E,$12,$1E,$12,$1E,$12
DB $1E,$12,$1E,$12,$1E,$12,$1E,$12
DB $1E,$12,$1E,$12,$1E,$12,$1E,$1E
DB $F9,$F9,$F9,$49,$F9,$49,$F9,$C9
DB $79,$49,$79,$49,$7F,$4F,$7F,$40
DB $7F,$40,$7F,$4F,$79,$49,$79,$49
DB $79,$49,$79,$49,$79,$49,$79,$79
DB $FF,$FF,$FF,$20,$FF,$20,$FF,$27
DB $FC,$24,$FC,$24,$FF,$27,$FF,$20
DB $FF,$20,$FF,$27,$FC,$24,$FC,$24
DB $FF,$27,$FF,$20,$FF,$20,$FF,$FF
DB $F0,$F0,$F0,$10,$F0,$10,$F0,$F0
DB $00,$00,$00,$00,$F0,$F0,$F0,$10
DB $F0,$10,$F0,$F0,$00,$00,$00,$00
DB $F0,$F0,$F0,$10,$F0,$10,$F0,$F0
DB $F3,$F3,$F3,$92,$F3,$92,$ED,$9E
DB $F3,$8C,$FF,$80,$FF,$80,$FF,$92
DB $F3,$9E,$FF,$9E,$F3,$92,$F3,$92
DB $F3,$92,$F3,$92,$F3,$92,$F3,$F3
DB $DF,$DF,$EF,$70,$DF,$60,$F6,$4F
DB $F9,$49,$F9,$49,$F9,$49,$F9,$49
DB $FF,$4F,$FF,$40,$FF,$40,$FF,$4F
DB $F9,$49,$F9,$49,$F9,$49,$F9,$F9
DB $BF,$BF,$7F,$E0,$BF,$60,$FF,$3C
DB $E7,$24,$E7,$24,$E7,$24,$E7,$24
DB $E7,$24,$E7,$24,$E7,$24,$E7,$24
DB $E7,$24,$E7,$24,$E7,$24,$E7,$E7
DB $FF,$FF,$FF,$10,$FF,$10,$FF,$F3
DB $9E,$92,$9E,$92,$9E,$92,$9F,$93
DB $9F,$90,$9F,$90,$9F,$93,$9F,$93
DB $9E,$92,$9E,$92,$9E,$92,$9E,$9E
DB $EF,$EF,$DF,$38,$EF,$18,$BF,$CF
DB $79,$49,$79,$49,$79,$49,$B9,$C9
DB $E9,$19,$D1,$31,$E1,$21,$51,$B1
DB $FF,$9F,$AF,$D8,$7F,$48,$7F,$7F
DB $FF,$FF,$FF,$04,$FD,$06,$FF,$3E
DB $E2,$23,$E1,$21,$E1,$21,$E0,$20
DB $E0,$20,$E1,$21,$E1,$21,$E2,$23
DB $FF,$3E,$FD,$06,$FF,$04,$FF,$FF
DB $9E,$9E,$9E,$92,$9A,$96,$6C,$F4
DB $94,$6C,$F8,$08,$68,$98,$F0,$90
DB $F0,$90,$68,$98,$F8,$08,$94,$6C
DB $6C,$F4,$9A,$96,$9E,$92,$9E,$9E
DB $F3,$F3,$F3,$92,$F3,$92,$F3,$92
DB $F3,$92,$F3,$92,$FF,$9E,$FF,$80
DB $FF,$80,$FF,$9E,$F3,$92,$F3,$92
DB $F3,$92,$F3,$92,$F3,$92,$F3,$F3
DB $DF,$DF,$EF,$70,$DF,$60,$F6,$4F
DB $F9,$49,$F9,$49,$F9,$49,$F9,$49
DB $FF,$4F,$FF,$40,$FF,$40,$FF,$4F
DB $F9,$49,$F9,$49,$F9,$49,$F9,$F9
DB $8F,$8F,$57,$D8,$AF,$70,$FB,$27
DB $FC,$24,$FC,$24,$FF,$27,$EF,$30
DB $F7,$38,$EF,$2F,$E0,$20,$FC,$3C
DB $FB,$27,$EF,$30,$F7,$38,$EF,$EF
DB $C0,$C0,$A0,$60,$D0,$30,$70,$90
DB $F0,$F0,$00,$00,$C0,$C0,$A0,$60
DB $D0,$30,$F0,$90,$F0,$90,$F0,$90
DB $70,$90,$D0,$30,$A0,$60,$C0,$C0
DB $F3,$F3,$F3,$92,$B3,$D2,$6D,$5E
DB $52,$6D,$3F,$21,$2D,$33,$1E,$12
DB $1E,$12,$1E,$12,$1E,$12,$1E,$12
DB $1E,$12,$1E,$12,$1E,$12,$1E,$1E
DB $DF,$DF,$EF,$70,$5F,$E0,$F6,$CF
DB $F9,$C9,$79,$49,$79,$49,$79,$49
DB $79,$49,$79,$49,$79,$49,$79,$49
DB $76,$4F,$5F,$60,$2F,$30,$1F,$1F
DB $BC,$BC,$7C,$E4,$BC,$64,$FC,$24
DB $FC,$24,$FC,$24,$FC,$24,$FC,$24
DB $FC,$24,$FC,$24,$FC,$24,$FC,$24
DB $FB,$27,$AF,$70,$57,$D8,$8F,$8F
DB $F0,$F0,$F0,$90,$F0,$90,$F0,$90
DB $F0,$90,$F0,$90,$F0,$90,$F0,$90
DB $F0,$90,$F0,$90,$F0,$90,$F0,$90
DB $70,$90,$D0,$30,$A0,$60,$C0,$C0

matrix_sprites_palette:
	DW	$0000,$7FFF,$3DEF,$0000

matrix_rain_code_init_values: ; speed,ticks to change,x,y
	DB	22,22, 0,2
	DB	11,11, 1,0
	DB	 7, 7, 2,1
	DB	20,20, 3,3
	DB	17,17, 4,0
	DB	 5, 5, 5,5
	DB	19,19, 6,2
	DB	 6, 6, 7,2
	DB	 9, 9, 8,5
	DB	18,18, 9,3
	
	DB	22,22,10,3
	DB	14,14,11,1
	DB	 6, 6,12,2
	DB	21,21,13,4
	DB	19,19,14,3
	DB	 5, 5,15,0
	DB	13,13,16,1
	DB	 6, 6,17,1
	DB	 8, 8,18,0
	DB	18,18,19,0

	DB	 5, 5, 0,10
	DB	21,21, 1,7
	DB	12,12, 2,10
;	DB	13,13, 3,15
	DB	21,21, 4,15
	DB	16,16, 5,13
;	DB	15,15, 6,15
	DB	22,22, 7,9
	DB	18,18, 8,8
	DB	13,13, 9,13

	DB	 6, 6,10,10
;	DB	21,21,11,6
	DB	11,11,12,15
	DB	 5, 5,13,16
;	DB	23,23,14,15
	DB	13,13,15,12
	DB	16,16,16,15
	DB	21,21,17,9
;	DB	20,20,18,6
	DB	12,12,19,13

;-------------------------------------------------------------------------------------------------

	SECTION	"Matrix_Vars",BSS

; ---------------------------

matrix_has_to_load_palettes_oam:	DS	1

matrix_exit_demo:	DS	1 ; when 1, exit this part of the demo

matrix_bg_copy_dma_ready:	DS	1

matrix_event_count:	DS	2
matrix_current_event:	DS	2 ; pointer to the next event

MATRIX_CHARACTERS_CHANGED_PER_FRAME	EQU	10

MATRIX_NUMBER_OF_RAIN_CODE	EQU	35
matrix_rain_code:	DS	4*MATRIX_NUMBER_OF_RAIN_CODE ; speed,ticks to change,x,y

matrix_current_number_of_rain_code:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Matrix", CODE, BANK[7]

;----------------------------------------------

matrix_init_variables:

	ld	a,0
	ld	[matrix_exit_demo],a
	ld	[matrix_bg_copy_dma_ready],a
	
	ld	a,MATRIX_NUMBER_OF_RAIN_CODE
	ld	[matrix_current_number_of_rain_code],a
	
	ld	a,0
	ld	[matrix_event_count],a
	ld	[matrix_event_count+1],a
	
	ld	hl,_event_table_matrix
	ld	a,h
	ld	[matrix_current_event],a
	ld	a,l
	ld	[matrix_current_event+1],a
	
	ld	b,4*MATRIX_NUMBER_OF_RAIN_CODE
	ld	hl,matrix_rain_code_init_values
	ld	de,matrix_rain_code
	call	memcopy_fast ; b = size    hl = source address    de = dest address -

	ret

;----------------------------------------------

_event_exit_matrix_demo:
	ld	a,1
	ld	[matrix_exit_demo],a
	ret

_event_matrix_turn_off_rain:
	xor	a,a
	ld	[matrix_current_number_of_rain_code],a
	ret

_event_matrix_clear_sprites:

	ld	b,4*40
	ld	a,0
	ld	hl,OAM_Copy
	call	memset_fast ; a = value    hl = start address    b = size

	ld	a,1
	ld	[matrix_has_to_load_palettes_oam],a
	ret

_event_matrix_turn_on_rain_half:
	ld	a,MATRIX_NUMBER_OF_RAIN_CODE/2
	ld	[matrix_current_number_of_rain_code],a
	ret

;-------------------

_event_table_matrix:
	
	DW	535,_event_matrix_turn_off_rain
	DW	535+64,_event_matrix_clear_sprites
	
	DW	697,_event_matrix_turn_on_rain_half
	DW	715,_event_matrix_turn_off_rain
	
	DW	715+64+16,_event_exit_matrix_demo ; it takes 64 frames to fade black. 16 extra black frames

	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

matrix_handle_events:
	
	; Handle events
	; -------------
	
	ld	a,[matrix_event_count]
	ld	e,a
	ld	a,[matrix_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[matrix_current_event]
	ld	h,a
	ld	a,[matrix_current_event+1]
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
	ld	[matrix_current_event],a
	ld	a,l
	ld	[matrix_current_event+1],a ; save pointer to next event
	
	ld	h,b
	ld	l,c ; hl = ptr to function
	
	CALL_HL
._exit_check_events:

	; Now, handle fire functions...
	; -----------------------------

	; More checks here
	
	; ...
	
	; Increase counter
	; ----------------
	
	ld	a,[matrix_event_count]
	ld	l,a
	ld	a,[matrix_event_count+1]
	ld	h,a
	
	inc	hl
	
	ld	a,l
	ld	[matrix_event_count],a
	ld	a,h
	ld	[matrix_event_count+1],a
	
	ret

;-------------------------------------------------------------------------------------

MATRIX_SET_TILE: MACRO ; b = x, c = y

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
	
ENDM

;----------------------------------------------

MATRIX_SET_COMBINED_TILE: MACRO ; b = x, c = y

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

;----------------------------------------------

matrix_map_handle:

	; Wait until maps are copied to VRAM
	
	ld	a,[matrix_bg_copy_dma_ready]
	and	a,a
	jr	z,.update
	
	halt
	jr	matrix_map_handle
	
.update:

	; Randomize new symbols
	; ---------------------
	
	ld	a,MATRIX_CHARACTERS_CHANGED_PER_FRAME
.loop_new_chars:
	push	af
	
	call	GetRandom
	and	31
	ld	b,a ; b = x
	call	GetRandom
	and	31
	ld	c,a ; c = y
	
	call	GetRandom
	
	MATRIX_SET_TILE	
	
	pop	af
	dec	a
	jr	nz,.loop_new_chars
	
	; Falling code
	; ------------
	
	ld	hl,matrix_rain_code
	ld	a,[matrix_current_number_of_rain_code]
	and	a,a
	jr	z,.no_rain
	
.loop_rain:
	push	af
	
	ld	a,[hl+]
	ld	b,[hl]
	; a = speed | b = ticks to change
	dec	b
	jr	nz,.dont_change_rain
	
	ld	[hl+],a ; set countdown again (ticks left = speed)
	
	; hl = ptr to x
	
	ld	b,[hl]
	inc	hl
	ld	c,[hl]
	
	; b = x, c = y, hl = ptr to y
	
	inc	c
	ld	a,c
	cp	a,18
	jr	nz,.no_screen_limit
	
	push	hl
.another_rand:
	call	GetRandom
	and	a,31
	cp	a,20
	jr	nc,.another_rand
	ld	b,a
	pop	hl
	
	ld	c,0 ; y = 0
	
	ld	[hl],c
	dec	hl
	ld	[hl],b
	inc	hl
	inc	hl
	
	ld	a,63
	
	push	hl
	push	bc
	MATRIX_SET_COMBINED_TILE
	pop	bc
	call	GetRandom
	MATRIX_SET_TILE
	pop	hl
	
	jr	.rain_changed
	
.no_screen_limit:

	ld	[hl],c
	inc	hl
	
	ld	a,63
	
	push	hl
	push	bc
	MATRIX_SET_COMBINED_TILE
	pop	bc
	call	GetRandom
	MATRIX_SET_TILE
	pop	hl

	jr	.rain_changed

	; -------

.dont_change_rain:

	ld	[hl],b
	inc	hl
	inc	hl
	inc	hl

.rain_changed:
	
	pop	af
	dec	a
	jr	nz,.loop_rain

.no_rain: ; if 0 "rain codes" enabled jump here

	; Handle palettes
	; ---------------
	
	
	ld	de,0 ; array index
.loop
	
	; Load combined tile
	
	ld	hl,COMBINED_MAP_TEMP
	
	add	hl,de
	ld	a,[hl]
	
	and	a,a
	jr	z,.skip_dec	
	dec	a

	ld	[hl],a
	
	sra	a
	sra	a
	sra	a

.skip_dec:

	; Save attr
	
	ld	hl,ATTR_MAP_TEMP
	add	hl,de
	ld	[hl],a

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
	; ----------------------------
	
	ld	a,1
	ld	[matrix_bg_copy_dma_ready],a
	
	ret
	
;----------------------------------------------

matrix_map_clear:
	
	ld	bc,32*18
	ld	hl,MAP_TEMP
	call	memset_rand ; start with random characters
	
	ld	bc,32*18
	ld	d,0
	ld	hl,ATTR_MAP_TEMP
	call	memset
	
	ld	bc,32*18
	ld	d,0
	ld	hl,COMBINED_MAP_TEMP
	call	memset

	ret
	
;----------------------------------------------

matrix_map_update_bg_attr:
	
	ld	a,[matrix_bg_copy_dma_ready]
	and	a,a
	ret	z
	
	ld	a,0
	ld	[matrix_bg_copy_dma_ready],a
	
	ld	a,1
	ld	[rVBK],a
	DMA_COPY	ATTR_MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ld	a,0
	ld	[rVBK],a
	DMA_COPY	MAP_TEMP,$9800,32*18,0 ; src, dst, size, is_hdma
	
	ret

;----------------------------------------------

matrix_bg_load_palettes_sprites:
	
	ld	a,[matrix_has_to_load_palettes_oam]
	and	a,a
	ret	z
	
	xor	a,a
	ld	[matrix_has_to_load_palettes_oam],a
	
	ld	hl,matrix_palettes
	
	ld	a,$80 ; auto increment
	ld	[rBCPS],a
	
	ld	b,8
.loop:

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
	ld	a,[hl+]
	ld	[rBCPD],a
	
	ld	a,[hl+]
	ld	[rBCPD],a
	ld	a,[hl+]
	ld	[rBCPD],a
	
	dec	b
	jr	nz,.loop
	
	ld	a,0
	ld	hl,matrix_sprites_palette
	call	spr_set_palette
	
	call	refresh_OAM
	
	ret

;----------------------------------------------

matrix_setup_sprites:
	
	; THE
	
	ld	bc,((8+2)<<8)|(112-2)
	ld	l,0
	call	sprite_set_xy
	ld	bc,((16+2)<<8)|(112-2)
	ld	l,1
	call	sprite_set_xy
	ld	bc,((24+2)<<8)|(112-2)
	ld	l,2
	call	sprite_set_xy
	ld	bc,((32+2)<<8)|(112-2)
	ld	l,3
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
	
	; MATRIX
	
	
	ld	bc,((8+2)<<8)|(128-2)
	ld	l,4
	call	sprite_set_xy
	ld	bc,((16+2)<<8)|(128-2)
	ld	l,5
	call	sprite_set_xy
	ld	bc,((24+2)<<8)|(128-2)
	ld	l,6
	call	sprite_set_xy
	ld	bc,((32+2)<<8)|(128-2)
	ld	l,7
	call	sprite_set_xy
	ld	bc,((40+2)<<8)|(128-2)
	ld	l,8
	call	sprite_set_xy
	ld	bc,((48+2)<<8)|(128-2)
	ld	l,9
	call	sprite_set_xy
	ld	bc,((56+2)<<8)|(128-2)
	ld	l,10
	call	sprite_set_xy
	
	ld	a,8
	ld	l,4
	call	sprite_set_tile
	ld	a,10
	ld	l,5
	call	sprite_set_tile
	ld	a,12
	ld	l,6
	call	sprite_set_tile
	ld	a,14
	ld	l,7
	call	sprite_set_tile
	ld	a,16
	ld	l,8
	call	sprite_set_tile
	ld	a,18
	ld	l,9
	call	sprite_set_tile
	ld	a,20
	ld	l,10
	call	sprite_set_tile

	; HAS YOU
	
	ld	bc,((8+2)<<8)|(144-2)
	ld	l,11
	call	sprite_set_xy
	ld	bc,((16+2)<<8)|(144-2)
	ld	l,12
	call	sprite_set_xy
	ld	bc,((24+2)<<8)|(144-2)
	ld	l,13
	call	sprite_set_xy
	ld	bc,((32+2)<<8)|(144-2)
	ld	l,14
	call	sprite_set_xy
	ld	bc,((40+2)<<8)|(144-2)
	ld	l,15
	call	sprite_set_xy
	ld	bc,((48+2)<<8)|(144-2)
	ld	l,16
	call	sprite_set_xy
	ld	bc,((56+2)<<8)|(144-2)
	ld	l,17
	call	sprite_set_xy
	ld	bc,((64+2)<<8)|(144-2)
	ld	l,18
	call	sprite_set_xy
	
	ld	a,22
	ld	l,11
	call	sprite_set_tile
	ld	a,24
	ld	l,12
	call	sprite_set_tile
	ld	a,26
	ld	l,13
	call	sprite_set_tile
	ld	a,28
	ld	l,14
	call	sprite_set_tile
	ld	a,30
	ld	l,15
	call	sprite_set_tile
	ld	a,32
	ld	l,16
	call	sprite_set_tile
	ld	a,34
	ld	l,17
	call	sprite_set_tile
	ld	a,36
	ld	l,18
	call	sprite_set_tile
	
	; Done!
	
	ret

;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

matrix_vbl_handler:
	
	call	matrix_bg_load_palettes_sprites
	
	call	matrix_map_update_bg_attr
	
	LONG_CALL	gbt_update
	
	ret

;----------------------------------------------
	
	GLOBAL Matrix
	
Matrix:

	call	matrix_init_variables
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,162
	ld	hl,matrix_tiles
	ld	de,128 ;  de = start index
	call	vram_copy_tiles
	
	ld	bc,256-162
	ld	hl,matrix_tiles+128*8
	ld	de,128+162 ;  de = start index
	call	vram_copy_tiles
	
	ld	bc,38
	ld	hl,matrix_sprite_tiles
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
	
	call	matrix_map_clear

	call	matrix_map_handle
	
	call	matrix_setup_sprites
	
	call	wait_vbl
	
	ld	a,LCDCF_ON|LCDCF_BG8800|LCDCF_BG9800|LCDCF_OBJ16|LCDCF_OBJON ; configuration
	ld	[rLCDC],a
	
	; Load palettes and configure IRQs
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,matrix_vbl_handler
	call	irq_set_VBL
	
	ld	a,1
	ld	[matrix_has_to_load_palettes_oam],a
	
	call	wait_vbl

	; START	
	
.loop: ; Main loop
	
	call	matrix_handle_events
	
	call	matrix_map_handle
	
	call	wait_vbl
	
	ld	a,[matrix_exit_demo]
	and	a,a
	jr	z,.loop

	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

