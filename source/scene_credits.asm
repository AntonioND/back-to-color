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

	SECTION "CREDITS_DATA", DATA, BANK[2]

jordi_city_palettes:
	DW	32767,22197,12684,0
	DW	17373,21151,31,0
	DW	15294,16288,8576,0
	DW	9023,28095,28683,0
	DW	31667,31839,29704,0
	DW	19455,28319,28854,13351
	DW	6076,8935,6596,5344
	DW	6076,8935,6596,5344

jordi_city_map:
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$00,$01,$02,$03,$04,$05,$06,$07,$08
DB $09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11,$B5
DB $B5,$12,$13,$14,$15,$16,$17,$18,$19,$1A
DB $1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23,$B5
DB $B5,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C
DB $2D,$2E,$2F,$30,$31,$32,$33,$34,$35,$B5
DB $B5,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E
DB $3F,$40,$41,$42,$43,$44,$45,$46,$47,$B5
DB $B5,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,$50
DB $51,$52,$53,$54,$55,$56,$57,$58,$59,$B5
DB $B5,$5A,$5B,$5C,$5D,$5E,$5F,$60,$61,$62
DB $63,$64,$65,$66,$67,$68,$69,$6A,$6B,$B5
DB $B5,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74
DB $75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$B5
DB $B5,$7E,$7F,$80,$81,$82,$83,$84,$85,$86
DB $87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,$B5
DB $B5,$90,$91,$92,$93,$94,$95,$96,$97,$98
DB $99,$9A,$9B,$9C,$9D,$9E,$9F,$A0,$A1,$B5
DB $B5,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA
DB $AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
DB $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5

jordi_city_attr:
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DB $00,$01,$01,$03,$03,$01,$05,$05,$01,$03
DB $01,$05,$01,$05,$05,$03,$03,$04,$01,$00
DB $00,$01,$01,$03,$03,$03,$05,$05,$03,$03
DB $03,$05,$05,$05,$05,$03,$03,$04,$04,$00
DB $00,$05,$01,$03,$03,$03,$03,$03,$03,$03
DB $03,$05,$05,$05,$05,$03,$03,$04,$04,$00
DB $00,$03,$03,$03,$03,$03,$03,$03,$01,$03
DB $03,$01,$03,$01,$01,$01,$03,$03,$01,$02
DB $00,$04,$04,$05,$05,$01,$03,$03,$04,$03
DB $03,$03,$02,$01,$01,$01,$03,$03,$01,$00
DB $00,$04,$02,$01,$01,$02,$03,$01,$04,$01
DB $01,$03,$05,$03,$03,$03,$01,$01,$01,$00
DB $00,$03,$02,$02,$02,$02,$03,$02,$02,$02
DB $02,$03,$02,$01,$02,$02,$04,$03,$03,$00
DB $00,$03,$01,$02,$03,$02,$05,$02,$03,$02
DB $02,$05,$02,$01,$02,$02,$02,$03,$03,$00
DB $02,$03,$02,$03,$03,$02,$02,$03,$02,$02
DB $02,$02,$02,$03,$02,$02,$03,$02,$01,$00
DB $02,$02,$02,$02,$03,$02,$02,$02,$02,$02
DB $02,$02,$02,$02,$02,$01,$03,$02,$02,$00
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

jordi_city_tiles: ; 256 tiles
DB $E0,$FF,$E8,$F3,$E1,$FF,$FF,$FF
DB $FE,$FF,$D0,$DF,$F3,$DF,$D7,$DF
DB $D0,$0F,$07,$FD,$FD,$F8,$F8,$F0
DB $05,$F8,$F2,$FD,$E8,$FF,$F4,$FF
DB $FF,$F0,$EF,$FE,$85,$A7,$C0,$6C
DB $A8,$B5,$A1,$F4,$C8,$A5,$B4,$3C
DB $80,$00,$F0,$00,$FF,$80,$FE,$F1
DB $1E,$DF,$1A,$AF,$04,$B9,$00,$AA
DB $7F,$FF,$7F,$FF,$6F,$FF,$BB,$FF
DB $FF,$BF,$AF,$1F,$FB,$BF,$BE,$FF
DB $A2,$DF,$FF,$FF,$FF,$FF,$93,$EE
DB $FF,$FF,$B6,$CB,$FF,$FF,$FF,$FF
DB $33,$CF,$FF,$FF,$FF,$FF,$83,$7F
DB $FF,$FF,$0B,$F7,$FF,$FF,$FF,$FF
DB $FF,$FF,$DF,$FF,$FC,$FE,$EB,$F0
DB $EF,$F3,$FF,$FF,$7E,$7F,$F0,$FE
DB $FF,$FF,$E5,$8B,$91,$26,$7E,$7F
DB $E7,$FF,$C3,$FF,$52,$EF,$C3,$5A
DB $FF,$FF,$FF,$FF,$3F,$7F,$97,$4F
DB $CF,$F7,$FF,$FF,$7E,$FE,$0F,$FF
DB $FF,$FF,$BF,$FF,$EB,$F4,$F8,$FF
DB $E5,$EA,$F8,$FF,$F3,$E8,$FF,$FF
DB $FF,$F7,$F7,$E3,$FF,$F7,$FE,$FF
DB $9F,$FF,$FF,$FF,$A7,$FF,$FF,$FE
DB $FF,$FF,$FF,$FE,$77,$FB,$AF,$7F
DB $7F,$FF,$FE,$FC,$B4,$B3,$E0,$CF
DB $FF,$FF,$6B,$FF,$EB,$FF,$7F,$7F
DB $FF,$FF,$6B,$FF,$EB,$FF,$EB,$FF
DB $FF,$FF,$7F,$FF,$DB,$FF,$5B,$7F
DB $E6,$FF,$A7,$FE,$E2,$FC,$F7,$EE
DB $E6,$F9,$90,$E6,$A0,$99,$91,$E7
DB $E7,$9F,$9E,$FF,$F9,$7E,$E4,$F9
DB $6F,$F3,$FC,$7F,$6B,$F7,$FD,$FE
DB $FF,$FF,$63,$EF,$E0,$6F,$63,$EC
DB $AF,$DF,$FD,$7F,$9A,$ED,$75,$F8
DB $EA,$9D,$FD,$FF,$7F,$FF,$8F,$7F
DB $F3,$FB,$FA,$F0,$D5,$D1,$F5,$F5
DB $FF,$FF,$FE,$FE,$DF,$DE,$F8,$FA
DB $F4,$FB,$FA,$FF,$AE,$8D,$06,$07
DB $02,$03,$C6,$C5,$00,$29,$C4,$C5
DB $CE,$BF,$8F,$FF,$BB,$81,$8F,$BE
DB $CF,$FF,$B7,$C1,$0E,$BE,$8F,$FF
DB $80,$C8,$EA,$F8,$E8,$FE,$5E,$2F
DB $DF,$E7,$FD,$D8,$3F,$5F,$EF,$86
DB $CE,$FF,$F3,$FF,$FF,$FF,$CF,$FF
DB $F3,$7F,$7F,$3F,$FB,$7F,$FB,$FF
DB $96,$EB,$7F,$FF,$0F,$F2,$BE,$FF
DB $BF,$FF,$93,$EB,$DF,$FF,$CB,$A6
DB $8B,$77,$FF,$FF,$8F,$73,$7F,$FF
DB $9F,$FF,$E3,$FF,$FE,$F9,$1F,$FE
DB $C9,$F7,$6E,$DF,$71,$FE,$45,$F3
DB $6E,$DF,$70,$FF,$4D,$F1,$CE,$3F
DB $CB,$D3,$66,$DB,$46,$DB,$DB,$C3
DB $7A,$C3,$D7,$42,$DB,$C3,$7A,$C3
DB $93,$AF,$76,$FB,$8E,$7F,$A2,$CF
DB $76,$FB,$0E,$FF,$E2,$9F,$77,$FA
DB $BF,$FF,$EA,$F0,$F8,$FF,$E1,$F8
DB $F8,$FF,$F5,$E0,$FF,$FF,$BB,$FF
DB $C7,$FF,$FF,$FC,$FF,$FF,$9F,$FF
DB $FE,$FF,$A7,$FE,$FA,$FC,$FF,$FE
DB $C2,$FC,$C0,$F3,$E0,$CF,$C3,$FC
DB $CC,$F3,$D0,$CF,$82,$7C,$CC,$F3
DB $6B,$FF,$EB,$FF,$FF,$EB,$6B,$FF
DB $FF,$EB,$FF,$EB,$6B,$EB,$EB,$EB
DB $B6,$EF,$F3,$EF,$FF,$CB,$AD,$DB
DB $FD,$DB,$FB,$9D,$9E,$BD,$BE,$3D
DB $81,$E6,$A6,$99,$99,$E7,$E7,$9F
DB $9E,$FF,$F9,$FE,$E6,$F9,$89,$E6
DB $67,$68,$61,$E8,$E6,$EE,$E7,$EF
DB $63,$EF,$61,$6F,$64,$EB,$60,$68
DB $CC,$3B,$EF,$1F,$6F,$1F,$09,$1E
DB $EF,$FF,$CF,$FF,$0C,$FB,$8F,$7F
DB $58,$F8,$08,$DC,$9E,$FE,$BE,$DE
DB $F6,$DF,$F3,$CE,$D2,$AE,$90,$C6
DB $AA,$01,$00,$01,$0A,$01,$02,$01
DB $08,$13,$B0,$03,$C0,$07,$77,$0F
DB $F7,$C1,$8F,$BE,$CF,$FF,$B3,$40
DB $00,$BE,$B0,$40,$B2,$BC,$B1,$BC
DB $3B,$B9,$3F,$BF,$66,$06,$79,$78
DB $3F,$3F,$8F,$46,$01,$79,$48,$86
DB $FF,$FF,$EF,$FF,$FF,$EF,$AB,$C7
DB $FF,$EF,$FF,$F0,$E2,$F0,$A6,$F0
DB $DF,$EF,$FF,$EE,$DB,$A7,$FE,$F7
DB $AF,$D3,$FA,$33,$5B,$39,$92,$39
DB $FB,$FF,$15,$7B,$FB,$FF,$5F,$BF
DB $FF,$FF,$9F,$3F,$FF,$FF,$1F,$FF
DB $91,$0E,$62,$41,$58,$60,$6E,$44
DB $FD,$6E,$79,$7C,$78,$7F,$6B,$5C
DB $6A,$C2,$1B,$C3,$5A,$23,$3E,$1F
DB $41,$3F,$B3,$44,$00,$FF,$2A,$44
DB $8F,$7E,$E3,$9E,$76,$EA,$AE,$46
DB $F2,$EE,$3A,$72,$3F,$FE,$AE,$76
DB $F3,$E8,$E0,$FF,$CD,$F0,$E0,$DF
DB $E0,$AC,$FF,$3F,$5F,$7E,$FA,$DC
DB $86,$FF,$FF,$FF,$EF,$B7,$FF,$FF
DB $FF,$A7,$FD,$FF,$9F,$07,$05,$03
DB $E0,$CF,$C2,$FC,$C0,$F3,$5F,$FF
DB $FF,$EF,$FF,$FF,$FF,$7F,$FB,$F0
DB $EB,$EB,$6A,$EB,$EB,$EA,$EA,$EA
DB $F8,$AA,$FA,$E8,$FC,$F8,$3F,$1F
DB $2F,$3C,$7D,$3E,$2E,$7E,$7E,$7C
DB $F8,$7D,$78,$F0,$F8,$FD,$7F,$85
DB $E2,$99,$80,$E7,$C0,$9F,$80,$FF
DB $80,$FE,$86,$79,$99,$E6,$A2,$99
DB $65,$E8,$60,$E3,$7C,$FC,$7F,$FF
DB $7F,$7F,$77,$EB,$FF,$7C,$6F,$F3
DB $4F,$1F,$0A,$9D,$0F,$7F,$8F,$8F
DB $F8,$FF,$FC,$F8,$F8,$7F,$9A,$E8
DB $D1,$B7,$DB,$D3,$DB,$DA,$F8,$F1
DB $E4,$F9,$38,$FC,$1E,$E6,$C7,$F9
DB $FF,$FF,$F9,$F8,$90,$0F,$00,$FF
DB $06,$F8,$F0,$0F,$00,$7F,$C1,$FF
DB $FC,$F9,$79,$F9,$6B,$D9,$49,$F2
DB $70,$F3,$77,$E3,$7F,$FF,$83,$FC
DB $0B,$F0,$81,$FF,$E3,$FF,$EF,$FF
DB $6D,$BF,$28,$FD,$ED,$FF,$2F,$F8
DB $E2,$F0,$E5,$FA,$EA,$F0,$E2,$F0
DB $40,$FF,$07,$57,$57,$FF,$FB,$03
DB $9D,$39,$5D,$BC,$9C,$3C,$5E,$3C
DB $1E,$FE,$D4,$FA,$7F,$FE,$F1,$7F
DB $F7,$F7,$FF,$DF,$DF,$8F,$FF,$DF
DB $FB,$7D,$7F,$7F,$79,$3F,$3F,$3F
DB $78,$7F,$DA,$CC,$F8,$FF,$6F,$DF
DB $F7,$F7,$F5,$60,$C0,$C1,$F4,$E3
DB $00,$FF,$AB,$44,$00,$FF,$FF,$FF
DB $FF,$00,$00,$FF,$50,$82,$08,$80
DB $3D,$FC,$30,$69,$3B,$F3,$E7,$F3
DB $E7,$27,$2F,$C2,$11,$2F,$85,$33
DB $DA,$8C,$8A,$05,$DF,$8F,$FE,$DF
DB $DB,$7F,$7E,$3F,$FB,$7F,$FE,$FF
DB $05,$03,$65,$FB,$FF,$FF,$97,$FF
DB $FD,$FF,$A7,$7F,$FB,$F7,$7F,$CF
DB $D0,$DF,$DF,$BF,$BD,$7E,$7E,$F1
DB $F9,$D6,$D6,$B1,$18,$57,$79,$B6
DB $7B,$FC,$BC,$C3,$C0,$25,$05,$A0
DB $A0,$05,$01,$A4,$86,$20,$62,$04
DB $8F,$77,$07,$F7,$FF,$07,$0F,$F7
DB $07,$F7,$FF,$04,$8F,$74,$05,$74
DB $89,$E7,$A7,$9F,$9F,$FF,$FD,$F2
DB $FA,$87,$CB,$06,$12,$0F,$02,$9E
DB $FE,$FD,$F3,$EF,$FF,$FC,$FF,$7F
DB $7F,$8F,$8F,$73,$73,$8E,$0E,$70
DB $78,$FF,$EF,$9F,$7F,$FF,$FC,$BF
DB $E3,$FF,$FC,$7F,$63,$3F,$3C,$1F
DB $F9,$FE,$F8,$C8,$0B,$F8,$F8,$C8
DB $CF,$F8,$D8,$E8,$CB,$F8,$F8,$C8
DB $FB,$3E,$3F,$46,$47,$7A,$7B,$7E
DB $FF,$7E,$9F,$7E,$67,$7E,$7E,$7F
DB $FC,$00,$FD,$02,$FE,$01,$FC,$01
DB $FC,$01,$FC,$01,$FC,$00,$03,$FC
DB $EE,$19,$1C,$03,$07,$80,$80,$61
DB $00,$59,$25,$5A,$00,$6D,$05,$0B
DB $19,$E0,$08,$F0,$F8,$00,$08,$F0
DB $58,$A0,$F8,$00,$04,$F8,$FE,$FC
DB $7F,$3F,$2B,$1D,$7F,$3F,$F1,$7F
DB $7F,$FF,$FF,$FF,$C5,$FB,$7F,$FF
DB $1F,$3B,$3F,$9E,$9E,$9C,$DC,$8C
DB $CC,$CC,$CC,$C4,$C5,$E5,$63,$E7
DB $84,$77,$7C,$07,$7D,$06,$7C,$07
DB $7C,$07,$FD,$FE,$FE,$FE,$2E,$E5
DB $28,$80,$AA,$00,$46,$20,$01,$FC
DB $00,$FF,$FF,$00,$00,$00,$00,$FF
DB $8D,$3F,$4F,$3F,$8D,$7B,$0B,$F9
DB $0D,$F9,$EB,$1C,$14,$18,$13,$E1
DB $FB,$EF,$BE,$BE,$F9,$F9,$F7,$E2
DB $CF,$8F,$33,$3F,$FE,$FF,$DB,$F7
DB $3D,$9F,$7F,$7F,$FE,$F7,$95,$63
DB $E3,$C1,$F7,$E3,$9E,$76,$F8,$F8
DB $F7,$70,$D8,$D6,$98,$B6,$B6,$51
DB $38,$B2,$F9,$F2,$F4,$11,$F0,$15
DB $41,$26,$06,$61,$30,$CE,$80,$2C
DB $49,$24,$10,$45,$02,$55,$AF,$50
DB $7C,$05,$2C,$D4,$04,$D5,$8C,$57
DB $0F,$54,$27,$57,$F4,$0F,$7C,$FF
DB $A2,$1F,$42,$3F,$0E,$F3,$7F,$8F
DB $F2,$7E,$82,$FE,$92,$4E,$43,$0E
DB $03,$8E,$03,$F3,$02,$FE,$8A,$F0
DB $72,$68,$12,$08,$12,$08,$92,$08
DB $63,$3F,$FF,$7F,$47,$BF,$40,$B7
DB $40,$A1,$50,$AD,$40,$B9,$44,$B3
DB $DB,$E8,$CE,$F8,$DA,$E8,$DA,$E8
DB $38,$C8,$CF,$F8,$F8,$C8,$DB,$E8
DB $51,$71,$5C,$71,$59,$71,$54,$71
DB $50,$71,$DD,$71,$95,$71,$5D,$71
DB $FF,$FF,$03,$FD,$FF,$FE,$03,$FD
DB $01,$FE,$F8,$FF,$FF,$FF,$FF,$FF
DB $E0,$03,$F9,$E1,$BF,$39,$C7,$C7
DB $F9,$39,$3F,$C7,$07,$F9,$E3,$FF
DB $0F,$F6,$FF,$FB,$FD,$FD,$DA,$4E
DB $FD,$4B,$FE,$FB,$DB,$4E,$FB,$4B
DB $79,$A3,$7F,$BF,$7F,$BF,$EB,$BD
DB $FF,$FF,$A9,$FF,$BF,$FF,$F7,$FF
DB $F6,$E3,$B1,$72,$F3,$F1,$73,$FB
DB $FA,$8B,$89,$0A,$7B,$7D,$CF,$BE
DB $CC,$06,$8C,$86,$8C,$86,$9C,$9E
DB $A4,$BE,$FC,$DE,$E4,$BE,$DC,$FE
DB $0C,$00,$00,$0C,$52,$2D,$00,$3F
DB $00,$1E,$0C,$33,$21,$00,$00,$00
DB $07,$11,$05,$13,$8F,$17,$0D,$1F
DB $0F,$1F,$0F,$19,$09,$19,$09,$19
DB $BF,$FF,$F2,$BF,$BF,$FF,$D3,$FF
DB $FE,$FE,$72,$FE,$BF,$FF,$EB,$7E
DB $F0,$F0,$70,$B0,$F1,$F1,$77,$17
DB $7F,$1E,$FF,$FA,$AB,$6B,$FF,$EE
DB $F9,$16,$F6,$11,$FF,$FF,$F5,$F3
DB $77,$73,$FF,$7F,$F3,$FF,$7F,$7F
DB $F7,$0F,$FA,$F9,$AB,$99,$BF,$9F
DB $F9,$FF,$9F,$FF,$FF,$FF,$0B,$D3
DB $D4,$CF,$DC,$CF,$FC,$FF,$CE,$FC
DB $FC,$FE,$EC,$F7,$FF,$FF,$EC,$F7
DB $93,$0E,$02,$9E,$02,$F6,$0A,$A6
DB $8F,$7F,$72,$F3,$82,$A3,$02,$A3
DB $F3,$09,$7E,$1E,$11,$11,$0F,$0E
DB $95,$90,$65,$E1,$26,$EF,$29,$FE
DB $F8,$FF,$3F,$07,$FE,$F9,$47,$BF
DB $40,$BF,$F8,$FF,$06,$FF,$99,$67
DB $FF,$FF,$FF,$FF,$ED,$D8,$D8,$E8
DB $CC,$F8,$D8,$E8,$0C,$F8,$D8,$E8
DB $D0,$F1,$DC,$F1,$59,$71,$D1,$71
DB $7E,$7F,$FE,$7F,$7C,$7C,$8B,$7B
DB $98,$EB,$9F,$E8,$FF,$FF,$FF,$FF
DB $9C,$EB,$9F,$E8,$7F,$7F,$BF,$BF
DB $FF,$FF,$1F,$DF,$FF,$1F,$F3,$F3
DB $F3,$F3,$13,$D3,$F3,$13,$F3,$F3
DB $FA,$FA,$DA,$4E,$F8,$4A,$FA,$FA
DB $DB,$4E,$F9,$4A,$FB,$FB,$DA,$4F
DB $2B,$7F,$F7,$7E,$63,$7F,$22,$7F
DB $63,$7F,$6A,$77,$B7,$EB,$FF,$E3
DB $FE,$7D,$BD,$CF,$FF,$7E,$E7,$BD
DB $DD,$7F,$E7,$FF,$DD,$FD,$65,$FD
DB $A4,$FE,$FC,$DE,$E4,$FE,$1C,$3E
DB $66,$3D,$3D,$1E,$25,$3E,$9C,$3E
DB $01,$D6,$48,$B7,$92,$6D,$00,$00
DB $00,$FF,$FF,$00,$68,$00,$AD,$00
DB $49,$99,$89,$59,$09,$D9,$0F,$19
DB $1F,$EF,$EF,$1F,$AB,$1F,$4D,$1F
DB $B7,$FF,$6A,$FF,$A3,$BF,$22,$BF
DB $A3,$BF,$B7,$AA,$2B,$B7,$FE,$E2
DB $7F,$BA,$FB,$EB,$7F,$AE,$FF,$FA
DB $2F,$EB,$FF,$EE,$FF,$FA,$7F,$6B
DB $F2,$7F,$F2,$FF,$7E,$7F,$FA,$73
DB $E3,$E3,$63,$63,$EB,$73,$F3,$EB
DB $51,$AD,$D2,$28,$C6,$39,$04,$FA
DB $39,$FE,$FD,$FE,$FE,$FF,$0B,$D3
DB $FC,$FF,$EC,$F7,$7F,$3C,$BC,$1F
DB $9C,$4F,$2C,$87,$67,$97,$47,$AF
DB $0E,$A3,$72,$83,$82,$23,$02,$A3
DB $0F,$AF,$7F,$FF,$F1,$F1,$FB,$F1
DB $2F,$F8,$2F,$F8,$2B,$F8,$2B,$F8
DB $E9,$F8,$E9,$F8,$E9,$F8,$A8,$78
DB $DF,$21,$BF,$41,$9D,$61,$DD,$21
DB $F9,$01,$99,$61,$D9,$21,$91,$61
DB $CC,$F8,$D8,$E8,$CC,$F8,$D8,$E8
DB $0C,$F8,$88,$18,$EC,$18,$E8,$18
DB $76,$77,$E0,$60,$6F,$6F,$E0,$60
DB $12,$77,$DA,$3B,$5C,$3C,$9F,$7F
DB $DC,$CA,$0C,$0A,$EF,$EE,$0F,$0E
DB $DC,$CA,$9C,$AA,$7E,$7E,$FE,$FE
DB $73,$73,$37,$53,$17,$73,$73,$73
DB $53,$33,$1F,$7F,$7F,$7F,$33,$51
DB $FA,$4A,$FA,$FB,$0E,$FE,$FA,$F3
DB $F3,$F3,$16,$F3,$37,$F3,$7F,$FC
DB $BE,$E3,$DD,$E1,$DE,$C0,$94,$A1
DB $E8,$C2,$92,$A1,$A1,$40,$63,$18
DB $DD,$DD,$47,$DF,$FD,$FF,$A7,$BF
DB $FD,$FF,$27,$FF,$0D,$37,$82,$25
DB $E4,$FE,$DD,$FE,$A6,$25,$05,$27
DB $3E,$3F,$A4,$3E,$7B,$3F,$A4,$1F
DB $A5,$00,$FF,$00,$00,$FF,$FF,$FF
DB $AA,$55,$AA,$00,$FF,$FF,$00,$FF
DB $4B,$1F,$ED,$1F,$1F,$EF,$E9,$FF
DB $BF,$5E,$A8,$1E,$F1,$FC,$0A,$FD
DB $3E,$E2,$FE,$E2,$BE,$A2,$37,$A1
DB $A9,$00,$42,$80,$31,$80,$A0,$42
DB $3F,$6E,$7F,$7A,$7F,$6B,$FF,$EE
DB $3F,$FA,$7F,$EB,$3F,$FF,$BC,$7F
DB $62,$6B,$E2,$6B,$EA,$F3,$E2,$73
DB $F3,$6B,$E3,$EB,$E3,$E3,$F7,$EF
DB $51,$AD,$D2,$28,$C6,$39,$04,$FA
DB $39,$FE,$FD,$FE,$FE,$FF,$0B,$D3
DB $9F,$EE,$9E,$EE,$4E,$3E,$A6,$1E
DB $96,$4E,$2E,$86,$66,$96,$46,$AE
DB $51,$71,$51,$71,$5B,$71,$51,$71
DB $5B,$71,$D1,$71,$DB,$71,$5F,$7F
DB $28,$F8,$28,$F8,$A8,$78,$29,$F8
DB $AF,$79,$2F,$FF,$BE,$6F,$FE,$E8
DB $F1,$01,$41,$21,$61,$01,$F9,$01
DB $FF,$F9,$FF,$FF,$F7,$0F,$6B,$01
DB $CC,$38,$08,$F8,$3D,$F8,$FF,$FF
DB $FF,$F8,$FE,$01,$E0,$1F,$07,$F8
DB $1E,$7F,$FE,$7F,$7F,$7B,$FB,$C7
DB $E7,$1F,$07,$FB,$3F,$C1,$F3,$0D
DB $D8,$EA,$DC,$EA,$FE,$FE,$FC,$FF
DB $F2,$FC,$FC,$F0,$FC,$F0,$FC,$F0
DB $39,$51,$7F,$7F,$17,$6F,$6B,$97
DB $8D,$13,$8F,$10,$8B,$16,$8A,$16
DB $FE,$F0,$D3,$E0,$D3,$E0,$D4,$E0
DB $D0,$E0,$00,$FF,$E7,$DF,$CF,$FF
DB $40,$0F,$8E,$7F,$E3,$1F,$1F,$3F
DB $3F,$7F,$7F,$FF,$FF,$FF,$83,$7F
DB $26,$C0,$5C,$80,$E4,$E0,$FB,$F8
DB $C4,$BC,$FC,$FE,$32,$33,$FF,$FF
DB $D6,$0D,$92,$0D,$B6,$09,$A0,$1F
DB $70,$0F,$01,$1E,$03,$FC,$04,$F8
DB $82,$21,$D2,$21,$84,$21,$DF,$AD
DB $8D,$FF,$FF,$CF,$EF,$CF,$CF,$CF
DB $5A,$2D,$D1,$2E,$58,$27,$DE,$30
DB $18,$FF,$F9,$BF,$BF,$BF,$FE,$FF
DB $41,$14,$1C,$7F,$3F,$FF,$5F,$BF
DB $FF,$FF,$FF,$FF,$FF,$FF,$1F,$EF
DB $C2,$3D,$4E,$81,$DA,$E1,$FB,$FD
DB $2F,$DF,$17,$EF,$FF,$BB,$BB,$11
DB $FE,$FF,$12,$FF,$66,$9F,$BE,$17
DB $FF,$3F,$FF,$FF,$FF,$FF,$FF,$FF
DB $51,$AD,$D2,$28,$C6,$39,$04,$FA
DB $39,$FE,$FD,$FE,$FE,$FF,$FF,$FF
DB $9E,$EE,$9F,$EE,$4F,$3F,$A7,$1F
DB $97,$4F,$2C,$87,$E5,$9E,$DC,$FF
DB $53,$73,$51,$71,$F9,$F9,$FF,$FF
DB $00,$FF,$60,$04,$F9,$84,$DB,$EC
DB $7D,$E8,$7E,$E9,$FF,$EF,$FE,$ED
DB $3B,$EF,$EE,$2F,$28,$EE,$AB,$EC
DB $CB,$01,$F7,$F9,$FF,$FF,$13,$6B
DB $FD,$FF,$07,$FF,$65,$13,$6F,$11
DB $7E,$80,$E4,$08,$24,$08,$24,$08
DB $24,$08,$24,$08,$24,$08,$24,$08
DB $53,$85,$52,$85,$52,$85,$53,$84
DB $53,$84,$53,$84,$53,$84,$56,$80
DB $FC,$F0,$FD,$F1,$FD,$F3,$7F,$F3
DB $3F,$F3,$D3,$3F,$23,$1F,$13,$0F
DB $B7,$0F,$47,$8F,$8F,$8F,$9F,$8F
DB $E7,$9F,$8F,$FF,$BF,$FF,$FF,$FF
DB $EF,$FE,$EF,$FC,$EF,$FF,$F9,$F8
DB $F8,$FE,$FF,$FF,$FF,$FF,$FF,$FF
DB $85,$7B,$02,$FD,$03,$FF,$FE,$FC
DB $84,$FD,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$7F,$7F
DB $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $E1,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $CF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FC,$FF,$F8,$FF,$FC,$FF,$FD,$F8
DB $F0,$F8,$FD,$F8,$FD,$FF,$FF,$FF
DB $0F,$F7,$2F,$D3,$27,$DF,$F7,$E3
DB $41,$E3,$F7,$E3,$F7,$FF,$FF,$FF
DB $FF,$BB,$FF,$FF,$FE,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $E0,$FF,$71,$BE,$30,$DF,$18,$FF
DB $BF,$FE,$FE,$FC,$F8,$FC,$FE,$FC
DB $FF,$FF,$3F,$FF,$DF,$2F,$6F,$97
DB $13,$EF,$FF,$7E,$7C,$3E,$FF,$7E
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$7F,$7F,$3F,$3F,$1F,$7F,$3F
DB $CD,$FF,$EF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FB,$FE,$FF,$FE,$FE,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $EF,$35,$B7,$7F,$3F,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $F3,$F3,$E3,$F3,$E3,$E7,$C7,$E7
DB $C7,$CF,$CF,$CF,$FF,$FF,$FF,$FF
DB $C7,$C7,$93,$93,$C7,$C7,$10,$92
DB $39,$39,$00,$82,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $CF,$CF,$CF,$CF,$9F,$9F,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $9F,$9F,$9F,$9F,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$C3,$C3
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $83,$C7,$39,$BB,$65,$45,$5D,$5D
DB $65,$45,$39,$BB,$83,$C7,$FF,$FF
DB $83,$C7,$39,$BB,$65,$45,$55,$55
DB $69,$43,$3F,$BF,$83,$C7,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$81,$81,$FF,$FF
DB $E7,$E7,$E7,$E7,$CF,$CF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$F9,$F9,$E7,$E7
DB $FF,$FF,$E7,$E7,$FF,$FF,$FF,$FF
DB $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
DB $FF,$FF,$CF,$CF,$FF,$FF,$FF,$FF
DB $C3,$C3,$FF,$FF,$83,$A3,$99,$99
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$99,$99,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $E7,$E7,$C7,$C7,$E7,$E7,$E7,$E7
DB $E7,$E7,$C3,$C3,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$F9,$F9,$E3,$E3
DB $CF,$CF,$81,$81,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$F3,$F3,$F9,$F9
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $F3,$F3,$E3,$E3,$D3,$D3,$B3,$B3
DB $81,$81,$F3,$F3,$FF,$FF,$FF,$FF
DB $83,$83,$9F,$9F,$83,$83,$F9,$F9
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $C3,$C3,$9F,$9F,$83,$83,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $C1,$C1,$F9,$F9,$F3,$F3,$E7,$E7
DB $E7,$E7,$E7,$E7,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$C3,$C3,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$81,$81,$F9,$F9
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$99,$99,$81,$81
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $83,$83,$99,$99,$83,$83,$99,$99
DB $99,$99,$83,$83,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$9F,$9F,$9F,$9F
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $83,$83,$99,$99,$99,$99,$99,$99
DB $99,$99,$83,$83,$FF,$FF,$FF,$FF
DB $81,$81,$9F,$9F,$87,$87,$9F,$9F
DB $9F,$9F,$81,$81,$FF,$FF,$FF,$FF
DB $81,$81,$9F,$9F,$87,$87,$9F,$9F
DB $9F,$9F,$9F,$9F,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$9F,$9F,$91,$91
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $99,$99,$99,$99,$81,$81,$99,$99
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $C3,$C3,$E7,$E7,$E7,$E7,$E7,$E7
DB $E7,$E7,$C3,$C3,$FF,$FF,$FF,$FF
DB $F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $99,$99,$93,$93,$87,$87,$87,$83
DB $93,$91,$99,$99,$FF,$FF,$FF,$FF
DB $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
DB $9F,$9F,$81,$81,$FF,$FF,$FF,$FF
DB $88,$9C,$80,$88,$94,$80,$9C,$94
DB $9C,$9C,$9C,$9C,$FF,$FF,$FF,$FF
DB $89,$99,$81,$89,$91,$81,$99,$91
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$99,$99,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $83,$83,$99,$99,$99,$99,$83,$83
DB $9F,$9F,$9F,$9F,$FF,$FF,$FF,$FF
DB $C3,$C3,$99,$99,$99,$99,$99,$99
DB $99,$99,$C1,$C3,$F1,$F9,$FF,$FF
DB $83,$83,$99,$99,$99,$99,$83,$83
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $C1,$C1,$9F,$9F,$83,$83,$C1,$C1
DB $F9,$F9,$83,$83,$FF,$FF,$FF,$FF
DB $81,$81,$E7,$E7,$E7,$E7,$E7,$E7
DB $E7,$E7,$E7,$E7,$FF,$FF,$FF,$FF
DB $99,$99,$99,$99,$99,$99,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $99,$99,$99,$99,$99,$99,$DB,$DB
DB $C3,$C3,$E7,$E7,$FF,$FF,$FF,$FF
DB $3C,$3C,$3C,$3C,$3C,$3C,$A5,$A5
DB $81,$81,$DB,$DB,$FF,$FF,$FF,$FF
DB $99,$99,$99,$99,$C3,$C3,$C3,$C3
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $99,$99,$99,$99,$C3,$C3,$E7,$E7
DB $E7,$E7,$E7,$E7,$FF,$FF,$FF,$FF
DB $81,$81,$F1,$F1,$E3,$E3,$C7,$C7
DB $8F,$8F,$81,$81,$FF,$FF,$FF,$FF
DB $FF,$FF,$C3,$C3,$F9,$F9,$C1,$C1
DB $99,$99,$81,$C1,$FF,$FF,$FF,$FF
DB $9F,$9F,$83,$83,$99,$99,$99,$99
DB $99,$99,$83,$83,$FF,$FF,$FF,$FF
DB $FF,$FF,$C1,$C3,$99,$99,$9F,$9F
DB $99,$99,$C1,$C3,$FF,$FF,$FF,$FF
DB $F9,$F9,$C1,$C1,$99,$99,$99,$99
DB $98,$99,$C0,$C4,$FF,$FF,$FF,$FF
DB $FF,$FF,$C3,$C3,$99,$99,$81,$81
DB $9F,$9F,$C1,$C1,$FF,$FF,$FF,$FF
DB $E1,$E3,$CD,$CD,$CF,$CF,$83,$83
DB $CF,$CF,$CF,$CF,$FF,$FF,$FF,$FF
DB $FF,$FF,$C3,$C3,$99,$99,$99,$99
DB $C1,$C1,$F9,$F9,$83,$83,$FF,$FF
DB $9F,$9F,$83,$83,$99,$99,$99,$99
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $C7,$E7,$FF,$FF,$C7,$C7,$E7,$E7
DB $E7,$E7,$C3,$C3,$FF,$FF,$FF,$FF
DB $E3,$F3,$FF,$FF,$E3,$E3,$F3,$F3
DB $F3,$F3,$E3,$E7,$C7,$CF,$FF,$FF
DB $9F,$9F,$99,$99,$83,$93,$83,$87
DB $83,$93,$91,$99,$FF,$FF,$FF,$FF
DB $C7,$C7,$E7,$E7,$E7,$E7,$E7,$E7
DB $E7,$E7,$C3,$C3,$FF,$FF,$FF,$FF
DB $FF,$FF,$11,$11,$24,$24,$24,$24
DB $24,$24,$24,$24,$FF,$FF,$FF,$FF
DB $FF,$FF,$83,$A3,$99,$99,$99,$99
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $FF,$FF,$C3,$C3,$99,$99,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $FF,$FF,$83,$83,$99,$99,$99,$99
DB $99,$99,$83,$83,$9F,$9F,$FF,$FF
DB $FF,$FF,$C0,$C4,$98,$99,$99,$99
DB $99,$99,$C1,$C1,$F9,$F9,$FF,$FF
DB $FF,$FF,$C1,$C9,$C1,$C7,$CF,$CF
DB $CF,$CF,$CF,$CF,$FF,$FF,$FF,$FF
DB $FF,$FF,$81,$C1,$9F,$9F,$C3,$81
DB $F9,$F9,$81,$83,$FF,$FF,$FF,$FF
DB $CF,$CF,$83,$83,$CF,$CF,$CF,$CF
DB $CF,$CF,$E3,$E3,$FF,$FF,$FF,$FF
DB $FF,$FF,$99,$99,$99,$99,$99,$99
DB $99,$99,$C3,$C3,$FF,$FF,$FF,$FF
DB $FF,$FF,$99,$99,$99,$99,$99,$DB
DB $C3,$C3,$E7,$E7,$FF,$FF,$FF,$FF
DB $FF,$FF,$9C,$9C,$9C,$9C,$80,$94
DB $80,$C1,$C1,$C9,$FF,$FF,$FF,$FF
DB $FF,$FF,$99,$99,$99,$99,$C3,$C3
DB $99,$99,$99,$99,$FF,$FF,$FF,$FF
DB $FF,$FF,$99,$99,$99,$99,$99,$99
DB $C1,$C1,$F1,$F1,$83,$83,$FF,$FF
DB $FF,$FF,$C1,$C1,$F1,$F1,$E3,$E3
DB $C7,$C7,$C1,$C1,$FF,$FF,$FF,$FF

;-------------------------------------------------------------------------------------------------

	; Copyright symbol mapped to "%"
	; "ñ" mapped to "~"
	; "\n" = newline
	; "*" = clear text
	; "\t" = wait 1 second

WAIT_HALFSEC	EQU	"\t"
NEWLINE			EQU	"\n"
CLEAR_SCR		EQU	"*"

credits_text:
	DB	"Credits.",WAIT_HALFSEC,".",WAIT_HALFSEC,".",WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Code, music & gfx"
	DB	"  AntonioND",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"Train & City art",NEWLINE
	DB	"  jordirafel",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	WAIT_HALFSEC,WAIT_HALFSEC,CLEAR_SCR

	DB	"Email",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"antonio_nd@",NEWLINE
	DB	"       outlook.com",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Email",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"antonionidi@",NEWLINE
	DB	"         gmail.com",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Email",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"jordirafel@",NEWLINE
	DB	"         gmail.com",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Twitter",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"  @antonionidi",NEWLINE
	DB	NEWLINE
	DB	"  @jordirafel",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Webpage",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"antoniond_blog.",NEWLINE
	DB	"drunkencoders.com",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Webpage",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"antoniond.",NEWLINE
	DB	"drunkencoders.com",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Tools",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"RGBDS, GBTK & GBMB"
	DB	"BGB, GBT Player",NEWLINE
	DB	"VBA-M, OpenMPT",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC
	DB	CLEAR_SCR
	
	DB	"Thanks to all the",NEWLINE
	DB	"Game Boy scene!",WAIT_HALFSEC,NEWLINE
	DB	NEWLINE
	DB	"And thank you",NEWLINE
	DB	"for watching!",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,NEWLINE
	DB	CLEAR_SCR
	
	DB	"Keep the Game Boy",NEWLINE
	DB	"forever alive!",WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,WAIT_HALFSEC,NEWLINE
	DB	CLEAR_SCR

	DB	"Back to Color",NEWLINE
	DB	NEWLINE
	DB	NEWLINE
	DB	"Copyright % 2014",NEWLINE
	DB	"Antonio Ni~o Diaz",WAIT_HALFSEC,NEWLINE

	DB	0 ; End and halt
	
; ---------------------------

not_cgb_text:

	DB	"Back to Color",NEWLINE
	DB	"Only for GBC!",NEWLINE
	DB	NEWLINE
	DB	"Copyright % 2014",NEWLINE
	DB	"Antonio Ni~o Diaz",WAIT_HALFSEC,NEWLINE
	
	DB	0 ; End and halt
	
;-------------------------------------------------------------------------------------------------

	SECTION	"Credits_Vars",BSS

; ---------------------------

credits_write_tile_x:			DS	1 ; 1 to 18
credits_write_tile_y:			DS	1 ; 12 to 16
credits_text_next_char_ptr:		DS	2
credits_text_newchar_countdown:	DS	1 ; frames to wait for a new character

FRAMES_TO_WAIT_FOR_CHARACTER	EQU	2

;-------------------------------------------------------------------------------------------------

	SECTION "Credits", CODE, BANK[2]

;----------------------------------------------

credits_init_variables:

	ld	a,1
	ld	[credits_write_tile_x],a
	ld	a,12
	ld	[credits_write_tile_y],a
	
	ld	hl,credits_text
	ld	a,h
	ld	[credits_text_next_char_ptr],a
	ld	a,l
	ld	[credits_text_next_char_ptr+1],a
	
	ld	a,FRAMES_TO_WAIT_FOR_CHARACTER
	ld	[credits_text_newchar_countdown],a
	
	ret

;----------------------------------------------

credits_set_bg_tile: ; b = x, c = y, a = tile
	
	ld	d,$9800 >> 8
	ld	e,b ; de = base + x
	
	ld	l,c
	ld	h,$00 ; hl = y
	
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl ; hl = y *  32
	
	add	hl,de ; hl = base + x + (y * 32)
	
	push	af
	call	wait_screen_blank
	pop	af
	
	ld	[hl],a
	
	ret

;----------------------------------------------------------------------------
;----------------------------------------------------------------------------

; Offsets
O_SPACE			EQU	181
O_BAR			EQU	182
O_AMPERSAND		EQU	183
O_COMMA			EQU	184
O_DASH			EQU	186
O_DOT			EQU	185
O_COPYRIGHT		EQU	187 ; Mapped to "%"
O_AT			EQU	188
O_UNDERSCORE	EQU	189
O_APOSTROPHE	EQU	190
O_EXCLAMATION	EQU	192
O_QUESTION		EQU	191
O_ZERO			EQU	194
O_A_UPPERCASE	EQU	204
O_A_LOWERCASE	EQU	230
O_NTILDE		EQU	193 ; La eñe, coño XD - Mapped to "~"
O_NONE			EQU	O_QUESTION

;-----------------------------------

credits_ascii_to_tiles_table:

	;   /---Space is here!
	; ##  ! " # $ % & ' ( ) * + , - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ?##
	; ##@ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ \ ] ^ _##
	; ##` a b c d e f g h i j k l m n o p q r s t u v w x y z { | } ~  ##

	;   ' '     !             "      #      $      %           &           '            (      )
	DB	O_SPACE,O_EXCLAMATION,O_NONE,O_NONE,O_NONE,O_COPYRIGHT,O_AMPERSAND,O_APOSTROPHE,O_NONE,O_NONE
	;   *      +      ,       -      .     /
	DB	O_NONE,O_NONE,O_COMMA,O_DASH,O_DOT,O_BAR
	;   0 1 2 3 4 5 6 7 8 9
CHARACTER	SET	0
	REPT	10
	DB	O_ZERO+CHARACTER
CHARACTER	SET	CHARACTER+1
	ENDR
	;   :      ;      <      =      >      ?          @
	DB	O_NONE,O_NONE,O_NONE,O_NONE,O_NONE,O_QUESTION,O_AT
	;   A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
CHARACTER	SET	0
	REPT	26
	DB	O_A_UPPERCASE+CHARACTER
CHARACTER	SET	CHARACTER+1
	ENDR
	;   [      \      ]      ^      _            `
	DB	O_NONE,O_NONE,O_NONE,O_NONE,O_UNDERSCORE,O_NONE
	; a b c d e f g h i j k l m n o p q r s t u v w x y z
CHARACTER	SET	0
	REPT	26
	DB	O_A_LOWERCASE+CHARACTER
CHARACTER	SET	CHARACTER+1
	ENDR
	;   {      |      }      ~
	DB	O_NONE,O_NONE,O_NONE,O_NTILDE

;----------------------------------------------------------------------------
;----------------------------------------------------------------------------

credits_convert_ascii_to_tiles: ; a = ascii code. returns tile number in a
	
	sub	a,32 ; Non-printing characters
	ld	hl,credits_ascii_to_tiles_table
	ld	d,0
	ld	e,a
	add	hl,de
	ld	a,[hl]

	ret
	
;----------------------------------------------

credits_handle_text:
	
	ld	a,[credits_text_newchar_countdown]
	dec	a
	ld	[credits_text_newchar_countdown],a
	and	a,a
	ret	nz ; if not 0, return
	
	ld	a,FRAMES_TO_WAIT_FOR_CHARACTER
	ld	[credits_text_newchar_countdown],a
	
	ld	a,[credits_write_tile_x]
	ld	b,a
	ld	a,[credits_write_tile_y]
	ld	c,a
	
	ld	a,[credits_text_next_char_ptr]
	ld	h,a
	ld	a,[credits_text_next_char_ptr+1]
	ld	l,a
	
	ld	a,[hl]
	
	and	a,a
	ret	z ; if character = 0, return (stop text)
	
	inc	hl
	
	push	af
	ld	a,h
	ld	[credits_text_next_char_ptr],a
	ld	a,l
	ld	[credits_text_next_char_ptr+1],a
	pop	af
	
	; handle special characters...
	
	cp	a,NEWLINE ; newline
	jr	z,.newline
	
	cp	a,CLEAR_SCR ; clear text
	jr	nz,.dontclear
	call	credits_clear_text
	ret
.dontclear
	
	cp	a,WAIT_HALFSEC ; wait 1/2 second
	jr	nz,.dontwait
	ld	a,30
	ld	[credits_text_newchar_countdown],a
	ret
.dontwait:
	
	; end handle special characters...
	
	call	credits_convert_ascii_to_tiles
	
	call	credits_set_bg_tile  ; b = x, c = y, a = tile
	
	; increase x position
	
	ld	a,[credits_write_tile_x]
	inc	a
	cp	a,19
	ld	[credits_write_tile_x],a
	ret	nz
	
.newline:

	ld	a,1
	ld	[credits_write_tile_x],a

	; increase y position

	ld	a,[credits_write_tile_y]
	inc	a
	cp	a,17
	ld	[credits_write_tile_y],a
	ret	nz
	
	ld	a,12
	ld	[credits_write_tile_y],a
	
	ret

;----------------------------------------------

credits_palette_load:
	
	ld	b,$90
	call	wait_ly ; destroys register A
	
	ld	hl,jordi_city_palettes
	
	ld	a,0
	call	bg_set_palette
	ld	a,1
	call	bg_set_palette
	ld	a,2
	call	bg_set_palette
	ld	a,3
	call	bg_set_palette
	ld	a,4
	call	bg_set_palette
	ld	a,5
	call	bg_set_palette
	ld	a,6
	call	bg_set_palette
	ld	a,7
	call	bg_set_palette
	
	ret

;----------------------------------------------

credits_clear_text:
	
	ld	a,1
	ld	[credits_write_tile_x],a
	ld	a,12
	ld	[credits_write_tile_y],a
	
	; rVBK should be 0
	
	ld	d,O_SPACE
	ld	bc,6*32
	ld	hl,$9800+12*32
	call	vram_memset ; bc = size    d = value    hl = dest address
	
	ret
	
;----------------------------------------------

credits_load_maps:
	
	ld	a,0
	ld	[rVBK],a
	
	ld	hl,jordi_city_map
	ld	de,$9800
	ld	a,18
.loop_tiles:
	push	af
	
	ld	bc,20
	call	vram_copy
	
	; now increase dst by 12 to align columns
	
	push	hl
	
	ld	hl,12
	add	hl,de
	
	ld	d,h
	ld	e,l
	
	pop	hl
	
	pop	af
	dec	a
	jr	nz,.loop_tiles
	
	; ----------------
	
	ld	a,1
	ld	[rVBK],a
	
	ld	hl,jordi_city_attr
	ld	de,$9800
	ld	a,18
.loop_attr:
	push	af
	
	ld	bc,20
	call	vram_copy
	
	; now increase dst by 12 to align columns
	
	push	hl
	
	ld	hl,12
	add	hl,de
	
	ld	d,h
	ld	e,l
	
	pop	hl
	
	pop	af
	dec	a
	jr	nz,.loop_attr
	
	; ----------------
	
	ld	a,0
	ld	[rVBK],a

	ret
	
;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

credits_vbl_handler:
	
	LONG_CALL	gbt_update

	call	credits_handle_text
	
	ret

;----------------------------------------------
	
	GLOBAL Credits
	
Credits:
	
	ld	a,LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800 ; configuration
	ld	[rLCDC],a
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,256
	ld	hl,jordi_city_tiles
	ld	de,$0000 ;  de = start index
	call	vram_copy_tiles

	call	credits_load_maps

	call	credits_init_variables
	
	call	wait_vbl
	
	call	credits_palette_load
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,credits_vbl_handler
	call	irq_set_VBL
	
	; START	
	
.loop: ; Main loop

	call	wait_vbl

	jr	.loop

	; Exit...
	; -------
	
	;call	demo_config_default
	
	;ret

;-------------------------------------------------------------------
;-                             NOT CGB                             -
;-------------------------------------------------------------------

not_cgb_load_maps:
	
	ld	hl,jordi_city_map
	ld	de,$9800
	ld	a,18
.loop_tiles:
	push	af
	
	ld	bc,20
	call	vram_copy
	
	; now increase dst by 12 to align columns
	
	push	hl
	
	ld	hl,12
	add	hl,de
	
	ld	d,h
	ld	e,l
	
	pop	hl
	
	pop	af
	dec	a
	jr	nz,.loop_tiles

	ret
	
;------------------------------

not_cgb_init_variables:

	ld	a,1
	ld	[credits_write_tile_x],a
	ld	a,12
	ld	[credits_write_tile_y],a
	
	ld	hl,not_cgb_text
	ld	a,h
	ld	[credits_text_next_char_ptr],a
	ld	a,l
	ld	[credits_text_next_char_ptr+1],a
	
	ld	a,FRAMES_TO_WAIT_FOR_CHARACTER
	ld	[credits_text_newchar_countdown],a
	
	ret

;------------------------------

	GLOBAL Not_CGB
	
Not_CGB:
	
	ld	a,LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_BGON ; configuration
	ld	[rLCDC],a
	
	ld	a,$00
	ld	[rBGP],a
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,256
	ld	hl,jordi_city_tiles
	ld	de,$0000 ;  de = start index
	call	vram_copy_tiles

	call	not_cgb_load_maps

	call	not_cgb_init_variables
	
	call	wait_vbl
	
	ld	a,$E4
	ld	[rBGP],a
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,credits_vbl_handler
	call	irq_set_VBL
	
.loop: ; Main loop
	
	call	wait_vbl

	jr	.loop

