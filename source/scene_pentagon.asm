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

	SECTION "PENTAGON_DATA", CODE[$4000], BANK[5]

pentagon_tiles: ; 256 tiles - alligned to 16
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$01,$00,$02,$01,$0B,$07
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $02,$01,$05,$03,$17,$0F,$2F,$1F
DB $5F,$3F,$7F,$FF,$FE,$FF,$FB,$FC
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $0A,$07,$2F,$1F,$5F,$3F,$BF,$7F
DB $FF,$FF,$FF,$FF,$F7,$F8,$EF,$F0
DB $DF,$E0,$7F,$80,$FF,$00,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $80,$00,$A0,$C0,$D0,$E0,$E8,$F0
DB $FA,$FC,$FD,$FE,$7E,$FF,$BF,$7F
DB $DF,$3F,$F7,$0F,$FB,$07,$FD,$03
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$80,$00,$A0,$C0
DB $D0,$E0,$E8,$F0,$FA,$FC,$FD,$FE
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$01,$00
DB $05,$03,$0B,$07,$17,$0F,$1F,$0F
DB $1F,$0F,$17,$0F,$0F,$07,$0F,$07
DB $0B,$07,$07,$03,$07,$03,$05,$03
DB $17,$0F,$5F,$3F,$BF,$7F,$7F,$FF
DB $FD,$FE,$FB,$FC,$EF,$F0,$DF,$E0
DB $BF,$C0,$BF,$C0,$BF,$C0,$DF,$E0
DB $DF,$E0,$DF,$E0,$EF,$F0,$EF,$F0
DB $F7,$F8,$DF,$E0,$BF,$C0,$7F,$80
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $7E,$FF,$BF,$7F,$DF,$3F,$F7,$0F
DB $FB,$07,$FD,$03,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $80,$00,$A0,$C0,$D0,$E0,$E8,$F0
DB $FA,$FC,$FC,$FE,$7D,$FE,$BE,$7F
DB $FE,$3F,$FE,$3F,$FD,$3E,$BC,$7E
DB $FC,$7E,$FA,$7C,$78,$FC,$F8,$FC
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $03,$01,$03,$01,$02,$01,$01,$00
DB $01,$00,$01,$00,$01,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $EF,$F0,$F7,$F8,$F7,$F8,$F7,$F8
DB $FB,$FC,$FB,$FC,$7B,$FC,$FB,$7C
DB $FD,$7E,$BD,$7E,$7D,$3E,$7E,$3F
DB $5E,$3F,$3E,$1F,$3F,$1F,$2F,$1F
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$7F,$80,$7F,$80
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FE,$01,$FF,$01,$FF,$01
DB $FD,$03,$FF,$03,$FF,$03,$FF,$03
DB $FB,$07,$FF,$07,$FF,$07,$F7,$0F
DB $FF,$0F,$FF,$0F,$EF,$1F,$FF,$1F
DB $F4,$F8,$F0,$F8,$F0,$F8,$E8,$F0
DB $E0,$F0,$E0,$F0,$D0,$E0,$C0,$E0
DB $C0,$E0,$C0,$E0,$A0,$C0,$80,$C0
DB $80,$C0,$40,$80,$00,$80,$00,$80
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $1F,$0F,$1F,$0F,$17,$0F,$0F,$07
DB $0B,$07,$05,$03,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $7F,$80,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$00,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$00,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FE,$1F,$FE,$FF,$FE,$FF,$FD,$FE
DB $FC,$FE,$FA,$FC,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $80,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$01,$00,$02,$01,$03,$01
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$05,$03,$0B,$07,$17,$0F
DB $1F,$0F,$2F,$1F,$5F,$3F,$BE,$7F
DB $FD,$7E,$7B,$FC,$FB,$FC,$F7,$F8
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$A0,$C0,$F4,$F8,$FE,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$EF,$1F
DB $FD,$03,$FF,$00,$FF,$00,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$80,$00
DB $D0,$E0,$FD,$FE,$FF,$FF,$FF,$FF
DB $FF,$FF,$BF,$7F,$F7,$0F,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$A0,$C0,$F4,$F8
DB $FE,$FF,$FF,$FF,$FF,$FF,$7F,$FF
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $80,$00,$D0,$E0,$F4,$F8,$F8,$FC
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $01,$00,$01,$00,$02,$01,$05,$03
DB $0B,$07,$0F,$07,$17,$0F,$1F,$0F
DB $05,$03,$0B,$07,$17,$0F,$1F,$0F
DB $2F,$1F,$5F,$3F,$7E,$3F,$BD,$7E
DB $7D,$FE,$FB,$FC,$F7,$F8,$F7,$F8
DB $EF,$F0,$DF,$E0,$BF,$C0,$BF,$C0
DB $EF,$F0,$EF,$F0,$DF,$E0,$BF,$C0
DB $7F,$80,$7F,$80,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $EF,$1F,$FD,$03,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $F8,$FC,$F8,$FC,$F8,$7C,$F8,$7C
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $17,$0F,$0F,$07,$0B,$07,$05,$03
DB $02,$01,$01,$00,$01,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $BF,$C0,$DF,$E0,$EF,$F0,$F7,$F8
DB $F7,$F8,$FB,$FC,$7D,$FE,$BE,$7F
DB $5E,$3F,$3F,$1F,$2F,$1F,$17,$0F
DB $0B,$07,$07,$03,$05,$03,$02,$01
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$7F,$80,$BF,$C0,$DF,$E0
DB $DF,$E0,$EF,$F0,$F7,$F8,$FB,$FC
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FB,$07
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FD,$03,$EF,$1F,$7F,$FF,$FF,$FF
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $F8,$7C,$F8,$7C,$F8,$7C,$F8,$7C
DB $F8,$FC,$F8,$FC,$F8,$FC,$F4,$F8
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $01,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $7B,$FC,$FD,$7E,$BE,$7F,$5F,$3F
DB $2F,$1F,$1F,$0F,$17,$0F,$0B,$07
DB $02,$01,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$00,$FD,$03,$EF,$1F,$FF,$FF
DB $FF,$FF,$FF,$FF,$FE,$FF,$F4,$F8
DB $A0,$C0,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $BF,$7F,$FF,$FF,$FF,$FF,$FF,$FF
DB $FA,$FC,$D0,$E0,$80,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$FF,$FE,$FF,$F4,$F8,$A0,$C0
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $D0,$E0,$80,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$02,$01,$05,$03,$07,$03
DB $0B,$07,$0F,$07,$0F,$07,$17,$0F
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$BF,$C0,$BF,$C0
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$00,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$FF,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$00,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$FD,$FE,$FE,$FF,$FE,$FF
DB $FF,$FF,$FF,$FF,$FF,$0F,$FF,$0F
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$80,$00
DB $00,$80,$00,$80,$40,$80,$80,$C0
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$01,$00
DB $01,$00,$01,$00,$02,$01,$03,$01
DB $1F,$0F,$1F,$0F,$2F,$1F,$3F,$1F
DB $3E,$1F,$5E,$3F,$7E,$3F,$7D,$3E
DB $BD,$7E,$FD,$7E,$FB,$7C,$7B,$FC
DB $FB,$FC,$F7,$F8,$F7,$F8,$F7,$F8
DB $BF,$C0,$7F,$80,$7F,$80,$7F,$80
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $F7,$0F,$FF,$07,$FF,$07,$FB,$07
DB $FF,$03,$FF,$03,$FD,$03,$FF,$01
DB $FF,$01,$FE,$01,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $80,$C0,$A0,$C0,$C0,$E0,$C0,$E0
DB $D0,$E0,$E0,$F0,$E0,$F0,$E8,$F0
DB $F0,$F8,$F0,$F8,$F4,$F8,$F8,$FC
DB $78,$FC,$FA,$7C,$FC,$7E,$BC,$7E
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $03,$01,$05,$03,$07,$03,$07,$03
DB $0B,$07,$0F,$07,$0B,$07,$07,$03
DB $05,$03,$02,$01,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $EF,$F0,$EF,$F0,$EF,$F0,$DF,$E0
DB $DF,$E0,$DF,$E0,$EF,$F0,$F7,$F8
DB $FD,$FE,$FE,$FF,$BF,$7F,$5F,$3F
DB $2F,$1F,$0B,$07,$05,$03,$02,$01
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$7F,$80,$DF,$E0
DB $EF,$F0,$F7,$F8,$FD,$FE,$FE,$FF
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FE,$01,$FB,$07
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FE,$01,$FD,$03,$F7,$0F,$EF,$1F
DB $DF,$3F,$7F,$FF,$FE,$FF,$FA,$FC
DB $FD,$3E,$FE,$3F,$DE,$3F,$FE,$1F
DB $FF,$1F,$FF,$1F,$DF,$3F,$BF,$7F
DB $FE,$FF,$FD,$FE,$F4,$F8,$E8,$F0
DB $D0,$E0,$40,$80,$80,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$80,$00
DB $00,$80,$00,$80,$00,$80,$00,$80
DB $80,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $BF,$7F,$5F,$3F,$2F,$1F,$0B,$07
DB $05,$03,$02,$01,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $7F,$80,$DF,$E0,$EF,$F0,$F7,$F8
DB $FF,$FF,$FF,$FF,$BF,$7F,$5F,$3F
DB $2F,$1F,$0A,$07,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $F7,$0F,$DF,$3F,$BF,$7F,$7F,$FF
DB $FD,$FE,$FA,$FC,$E8,$F0,$D0,$E0
DB $A0,$C0,$80,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $F4,$F8,$D0,$E0,$A0,$C0,$40,$80
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$01,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $05,$03,$2F,$1F,$BF,$7F,$7F,$FF
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$01,$00,$17,$0F,$BF,$7F
DB $FF,$FF,$FF,$FF,$FF,$FF,$FB,$FC
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$05,$03
DB $2F,$1F,$7F,$FF,$FF,$FF,$FF,$FF
DB $FE,$FF,$F7,$F8,$7F,$80,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$16,$0F,$BF,$7F,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$DD,$E3
DB $FE,$01,$FF,$00,$FF,$00,$FF,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$80,$00,$40,$80,$80,$C0
DB $A0,$C0,$D0,$E0,$E8,$F0,$F0,$F8
DB $F4,$F8,$FA,$FC,$7C,$FE,$BD,$7E
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $FF,$FF,$FE,$FF,$F7,$F8,$F7,$F8
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $DF,$E0,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FE,$3F,$DF,$3F,$EF,$1F,$FF,$0F
DB $F7,$0F,$FB,$07,$FD,$03,$FF,$01
DB $FE,$01,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $80,$00,$40,$80,$80,$C0,$A0,$C0
DB $D0,$E0,$E0,$F0,$E8,$F0,$F4,$F8
DB $F8,$FC,$7A,$FC,$FD,$7E,$BE,$7F
DB $DF,$3F,$EF,$1F,$FF,$0F,$FF,$0F
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$80,$00
DB $00,$80,$40,$80,$80,$C0,$80,$C0
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$01,$00
DB $01,$00,$01,$00,$01,$00,$00,$00
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $F7,$F8,$F7,$F8,$F7,$F8,$F7,$F8
DB $FE,$FF,$FF,$FF,$7F,$FF,$BF,$7F
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$DF,$E0,$FB,$FC,$FF,$FF
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$BF,$C0
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FF,$00,$FF,$00
DB $FF,$00,$FF,$00,$FE,$01,$FD,$03
DB $FF,$03,$FB,$07,$F7,$0F,$EF,$1F
DB $FF,$1F,$DE,$3F,$BE,$7F,$7D,$FE
DB $FF,$0F,$EF,$1F,$DF,$3F,$BE,$7F
DB $FD,$7E,$7A,$FC,$F8,$FC,$F4,$F8
DB $E8,$F0,$D0,$E0,$C0,$E0,$A0,$C0
DB $40,$80,$80,$00,$00,$00,$00,$00
DB $80,$C0,$40,$80,$00,$80,$80,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $2F,$1F,$05,$03,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$FF,$FF,$FF,$BF,$7F,$17,$0F
DB $02,$01,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $F7,$F8,$FE,$FF,$FF,$FF,$FF,$FF
DB $FF,$FF,$2F,$1F,$05,$03,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FF,$00,$FE,$01,$DD,$E3,$FF,$FF
DB $FF,$FF,$FF,$FF,$FF,$FF,$BF,$7F
DB $15,$0E,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $FA,$FC,$F4,$F8,$F0,$F8,$E8,$F0
DB $D0,$E0,$A0,$C0,$80,$C0,$40,$80
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00

pentagon_bg_palettes:
	DW	32767,22197,12684,0

pentagon_spr_palettes:
	DW	6076,8935,6596,5344

pentagon_small_map: ; 8x8
DB $00,$02,$04,$06,$08,$0A,$0C,$0E,$01,$03
DB $05,$07,$09,$0B,$0D,$0F,$10,$12,$14,$16
DB $18,$1A,$1C,$1E,$11,$13,$15,$17,$19,$1B
DB $1D,$1F,$20,$22,$24,$26,$28,$2A,$2C,$2E
DB $21,$23,$25,$27,$29,$2B,$2D,$2F,$30,$32
DB $34,$36,$38,$3A,$3C,$3E,$31,$33,$35,$37
DB $39,$3B,$3D,$3F

pentagon_big_map: ; 16x16
DB $00,$00,$02,$02,$04,$04,$06,$06,$08,$08
DB $0A,$0A,$0C,$0C,$0E,$0E,$00,$00,$02,$02
DB $04,$04,$06,$06,$08,$08,$0A,$0A,$0C,$0C
DB $0E,$0E,$01,$01,$03,$03,$05,$05,$07,$07
DB $09,$09,$0B,$0B,$0D,$0D,$0F,$0F,$01,$01
DB $03,$03,$05,$05,$07,$07,$09,$09,$0B,$0B
DB $0D,$0D,$0F,$0F,$10,$10,$12,$12,$14,$14
DB $16,$16,$18,$18,$1A,$1A,$1C,$1C,$1E,$1E
DB $10,$10,$12,$12,$14,$14,$16,$16,$18,$18
DB $1A,$1A,$1C,$1C,$1E,$1E,$11,$11,$13,$13
DB $15,$15,$17,$17,$19,$19,$1B,$1B,$1D,$1D
DB $1F,$1F,$11,$11,$13,$13,$15,$15,$17,$17
DB $19,$19,$1B,$1B,$1D,$1D,$1F,$1F,$20,$20
DB $22,$22,$24,$24,$26,$26,$28,$28,$2A,$2A
DB $2C,$2C,$2E,$2E,$20,$20,$22,$22,$24,$24
DB $26,$26,$28,$28,$2A,$2A,$2C,$2C,$2E,$2E
DB $21,$21,$23,$23,$25,$25,$27,$27,$29,$29
DB $2B,$2B,$2D,$2D,$2F,$2F,$21,$21,$23,$23
DB $25,$25,$27,$27,$29,$29,$2B,$2B,$2D,$2D
DB $2F,$2F,$30,$30,$32,$32,$34,$34,$36,$36
DB $38,$38,$3A,$3A,$3C,$3C,$3E,$3E,$30,$30
DB $32,$32,$34,$34,$36,$36,$38,$38,$3A,$3A
DB $3C,$3C,$3E,$3E,$31,$31,$33,$33,$35,$35
DB $37,$37,$39,$39,$3B,$3B,$3D,$3D,$3F,$3F
DB $31,$31,$33,$33,$35,$35,$37,$37,$39,$39
DB $3B,$3B,$3D,$3D,$3F,$3F

;-------------------------------------------------------------------------------------------------

;-------------------------------------------------------------------------------------------------

	SECTION	"Pentagon_Vars",BSS

; ---------------------------

pentagon_exit_demo:	DS	1

pentagon_wait_rotation:	DS	1 ; frames left to change rotation
pentagon_angle:			DS	1 ; 0 to 3

PENTAGON_FRAMES_WAIT	EQU	3

pentagon_event_count:	DS	2

pentagon_current_event:	DS	2 ; pointer to the next event

pentagon_sprite_move_function:	DS	2 ; pointer to current sprite movement function

pentagon_sprite_base_x:	DS	1 ; upper left corner of sprite group
pentagon_sprite_base_y:	DS	1

;-------------------------------------------------------------------------------------------------

	SECTION "Pentagon", CODE, BANK[5]

;----------------------------------------------

pentagon_init_variables:

	ld	a,0
	ld	[pentagon_exit_demo],a
	
	ld	a,PENTAGON_FRAMES_WAIT
	ld	[pentagon_wait_rotation],a
	
	ld	a,0
	ld	[pentagon_angle],a
	
	ld	a,(160-64)/2
	ld	[pentagon_sprite_base_x],a
	ld	a,144
	ld	[pentagon_sprite_base_y],a	
	
	ld	a,0
	ld	[pentagon_event_count],a
	ld	[pentagon_event_count+1],a
	
	ld	hl,_event_table_pentagon
	ld	a,h
	ld	[pentagon_current_event],a
	ld	a,l
	ld	[pentagon_current_event+1],a

	ld	de,pentagon_sprite_move_fn_move_up
	call	pentagon_set_sprite_move_function
	
	ret

;---------------------------------------------------------------------

pentagon_set_sprite_move_function: ; de = function
	
	ld	hl,pentagon_sprite_move_function
	ld	[hl],d
	inc hl
	ld	[hl],e
	
	ret

;---------------------------------------------------------------------

pentagon_sprite_move_fn_stop:

	ret

pentagon_sprite_move_fn_move_up:
	
	ld	a,[pentagon_sprite_base_y]
	dec	a
	dec	a
	ld	[pentagon_sprite_base_y],a

	ret

pentagon_sprite_move_fn_move_down:
	
	ld	a,[pentagon_sprite_base_y]
	inc	a
	inc	a
	ld	[pentagon_sprite_base_y],a

	ret

pentagon_sprite_move_fn_move_right:
	
	ld	a,[pentagon_sprite_base_x]
	inc	a
	inc	a
	ld	[pentagon_sprite_base_x],a

	ret

pentagon_sprite_move_fn_move_left:
	
	ld	a,[pentagon_sprite_base_x]
	dec	a
	dec	a
	ld	[pentagon_sprite_base_x],a

	ret

;---------------------------------------------------------------------

_event_exit_pentagon_demo:
	ld	a,1
	ld	[pentagon_exit_demo],a
	ret

_event_set_pentagon_sprite_move_fn_stop:
	ld	de,pentagon_sprite_move_fn_stop
	call	pentagon_set_sprite_move_function
	ret

_event_set_pentagon_sprite_move_fn_move_up:
	ld	de,pentagon_sprite_move_fn_move_up
	call	pentagon_set_sprite_move_function
	ret

_event_set_pentagon_sprite_move_fn_move_down:
	ld	de,pentagon_sprite_move_fn_move_down
	call	pentagon_set_sprite_move_function
	ret

_event_set_pentagon_sprite_move_fn_move_right:
	ld	de,pentagon_sprite_move_fn_move_right
	call	pentagon_set_sprite_move_function
	ret

_event_set_pentagon_sprite_move_fn_move_left:
	ld	de,pentagon_sprite_move_fn_move_left
	call	pentagon_set_sprite_move_function
	ret
	
_event_set_sprite_priority_reverse:
	ld	a,[rLCDC]
	or	a,1
	ld	[rLCDC],a
	ret

;-------------------

_event_table_pentagon:

EVENT_COUNT	SET	(144-((144-64)/2)) / 2
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_left

EVENT_COUNT	SET	EVENT_COUNT+10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_up
	
EVENT_COUNT	SET	EVENT_COUNT+10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_right

EVENT_COUNT	SET	EVENT_COUNT+10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_down

EVENT_COUNT	SET	EVENT_COUNT+20
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_right
	
EVENT_COUNT	SET	EVENT_COUNT+10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_up

EVENT_COUNT	SET	EVENT_COUNT+10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_right

EVENT_COUNT	SET	EVENT_COUNT+((160-16)-((160-64)/2)) / 2 - 10
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_stop

EVENT_COUNT	SET	EVENT_COUNT+1
	DW	EVENT_COUNT,_event_set_sprite_priority_reverse

EVENT_COUNT	SET	EVENT_COUNT+1
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_left

EVENT_COUNT	SET	EVENT_COUNT+24
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_stop

EVENT_COUNT	SET	EVENT_COUNT+5
	DW	EVENT_COUNT,_event_set_pentagon_sprite_move_fn_move_right

EVENT_COUNT	SET	EVENT_COUNT+24+24
	DW	EVENT_COUNT,_event_exit_pentagon_demo

	DW	$FFFF,$0000 ; No more events! Don't remove this line!

;----------------------------------------------

pentagon_handle_events:
	
	; Handle events
	; -------------
	
	ld	a,[pentagon_event_count]
	ld	e,a
	ld	a,[pentagon_event_count+1]
	ld	d,a
	
	; Start of checking
	
	ld	a,[pentagon_current_event]
	ld	h,a
	ld	a,[pentagon_current_event+1]
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
	ld	[pentagon_current_event],a
	ld	a,l
	ld	[pentagon_current_event+1],a ; save pointer to next event
	
	ld	h,b
	ld	l,c ; hl = ptr to function
	
	CALL_HL
._exit_check_events:

	; Now, handle functions...
	; ------------------------
	
	; More checks here
	
	; ...
	
	; Increase counter
	; ----------------
	
	ld	a,[pentagon_event_count]
	ld	l,a
	ld	a,[pentagon_event_count+1]
	ld	h,a
	
	ld	de,$0001 ; to avoid OAM bug (It shouldn't reach such high values, but do it anyway...)
	add	hl,de
	
	ld	a,l
	ld	[pentagon_event_count],a
	ld	a,h
	ld	[pentagon_event_count+1],a
	
	ret

;----------------------------------------------

pentagon_palette_load:
	
	ld	b,$90
	call	wait_ly ; destroys register A
	
	ld	hl,pentagon_bg_palettes
	ld	a,0
	call	bg_set_palette
	
	ld	hl,pentagon_spr_palettes
	ld	a,0
	call	spr_set_palette
	
	ret

;----------------------------------------------

pentagon_load_maps:
	
	; Clear attributes
	
	ld	a,1
	ld	[rVBK],a
	
	ld	bc,32*32 ; map at $9800 uses palette 0
	ld	d,0
	ld	hl,$9800
	call	vram_memset ; bc = size    d = value    hl = dest address 
	
	; Load tile data
	
	ld	a,0
	ld	[rVBK],a
	
	ld	bc,64
	ld	hl,pentagon_tiles
	ld	de,0 ;  de = start index
	call	vram_copy_tiles
	
	; Clear maps
	
	ld	bc,32*32
	ld	d,0
	ld	hl,$9800
	call	vram_memset ; bc = size    d = value    hl = dest address 

	; Load maps
	
	ld	hl,pentagon_big_map
	ld	de,$9800
	ld	a,16
.loop_tiles1:
	push	af
	
	ld	bc,16
	call	vram_copy

	push	hl
	
	ld	hl,16
	add	hl,de ; now increase dst by 16 to align columns
	
	ld	d,h
	ld	e,l
	
	pop	hl
	
	pop	af
	dec	a
	jr	nz,.loop_tiles1
	
	; Done
	
	ret

;----------------------------------------------

pentagon_sprites_configure:
	
	ld	c,0 ; c = y
.loopy
	ld	b,0 ; b = x
.loopx
	push	bc
	
	;----
	
	ld	a,c
	sla	a
	sla	a
	sla	a
	or	a,b
	ld	l,a ; l = y * 8 + x
	
	sla	a ; a = l * 2
	
	push	hl
	call	sprite_set_tile ; a = tile    l = sprite number
	pop	hl
	
	ld	a,OAMF_PRI ; does nothing unless BIT 0 of rLCDC is 1
	call	sprite_set_params ; a = params    l = sprite number
	
	;----
	
	pop	bc
	
	inc	b
	ld	a,8
	cp	a,b
	jr	nz,.loopx
	
	inc	c
	ld	a,4
	cp	a,c
	jr	nz,.loopy
	
	call	pentagon_set_sprite_position
	
	ret

;----------------------------------------------

pentagon_move_sprites_auto:
	
	ld	hl,pentagon_sprite_move_function
	ld	a,[hl+]
	ld	l,[hl]
	ld	h,a
	
	CALL_HL
	
	call	pentagon_set_sprite_position
	
	ret

;----------------------------------------------

pentagon_set_sprite_position:

	ld	c,0 ; c = y
.loopy
	ld	b,0 ; b = x
.loopx
	push	bc
	
	;----
	
	ld	a,c
	sla	a
	sla	a
	sla	a
	or	a,b
	ld	l,a ; l = y * 8 + x
	
	pop	bc
	push	bc
	
	sla	b
	sla	b
	sla	b
	
	ld	a,[pentagon_sprite_base_x]
	add	a,b
	add	a,8
	ld	b,a
	
	;sla	c
	;sla	c
	;sla	c
	;sla	c
	swap	c
	
	ld	a,[pentagon_sprite_base_y]
	add	a,c
	add	a,16
	ld	c,a

	call	sprite_set_xy ; b = x    c = y    l = sprite number
	
	;----
	
	pop	bc
	
	inc	b
	ld	a,8
	cp	a,b
	jr	nz,.loopx
	
	inc	c
	ld	a,4
	cp	a,c
	jr	nz,.loopy
	
	ret

;----------------------------------------------

pentagon_vbl_handle_rotation:
	
	ld	a,[pentagon_wait_rotation]
	dec	a
	ld	[pentagon_wait_rotation],a
	ret	nz
	
	ld	a,PENTAGON_FRAMES_WAIT
	ld	[pentagon_wait_rotation],a
	
	; Get angle
	
	ld	a,[pentagon_angle]
	inc	a
	and	a,3
	ld	[pentagon_angle],a
	
	; a *= 64 * 16 = 1024
	ld	h,a
	ld	l,0 ; hl = a * 256
	
	add	hl,hl
	add	hl,hl ; hl = a * 1024
	
	ld	de,pentagon_tiles
	add	hl,de
	
	ld	a,h
	ld	[rHDMA1],a
	ld	a,l ; Lower 4 bits ignored
	ld	[rHDMA2],a
	
	ld	a, ( ($8000 + (16 * 0)) >> 8 )& $1F ; Upper 3 bits ignored
	ld	[rHDMA3],a
	ld	a, ($8000 + (16 * 0)) & $F0 ; Lower 4 bits ignored
	ld	[rHDMA4],a
	
	ld	a, ( ( (64*16) >> 4 ) - 1 ) ; ( Size / $10 ) - 1
	ld	[rHDMA5],a
	
	ret

;-------------------------------------------------------------------
;-                              OTHER                              -
;-------------------------------------------------------------------

pentagon_vbl_handler:
	
	call	refresh_OAM
	
	call	pentagon_vbl_handle_rotation
	
	LONG_CALL	gbt_update
	
	call	pentagon_move_sprites_auto
	
	call	pentagon_handle_events
	
	ret

;----------------------------------------------
	
	GLOBAL Pentagon
	
Pentagon:

	ld	a,LCDCF_ON ; configuration
	ld	[rLCDC],a
	
	ld	b,$90
	call	wait_ly
	
	call	pentagon_load_maps

	call	pentagon_init_variables
	
	call	pentagon_sprites_configure
	
	; Load palette and configure IRQs
	
	ld	a,-(160-128)/2
	ld	[rSCX],a
	ld	a,-(144-128)/2
	ld	[rSCY],a
	
	ld	b,$90
	call	wait_ly
	
	call	pentagon_palette_load
	
	ld	a,LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_OBJON|LCDCF_OBJ16 ; configuration
	ld	[rLCDC],a
	
	ld	a,$01
	ld	[rIE],a
	
	ld	bc,pentagon_vbl_handler
	call	irq_set_VBL
	
	; START	
	
.loop: ; Main loop
	
	call	wait_vbl
	
	ld	a,[pentagon_exit_demo]
	and	a,a
	jr	z,.loop

	; Exit...
	; -------
	
	call	demo_config_default
	
	ret

;-------------------------------------------------------------------

