;        --------------------------------------------------------------
;        ---                                                        ---
;        ---                                                        ---
;        ---                       GBT PLAYER  v2.1.0-1             ---
;        ---                                                        ---
;        ---                                                        ---
;        ---              Copyright (C) 2009-2018 Antonio Niño Díaz ---
;        ---                      All rights reserved.              ---
;        --------------------------------------------------------------
;
;                                          antonio_nd@outlook.com

    IF !DEF(GBT_PLAYER_INC)
    DEF GBT_PLAYER_INC  =  1

; ------------------------------------------------------------------------
    EXPORT  gbt_play   ; Starts playing a song.
                       ; -------------------------------------------------
                       ; de = pointer to song data
                       ; b = default speed
                       ; c = data bank
                       ; THIS WILL CHANGE TO BANK IN REGISTER c!!!
; ------------------------------------------------------------------------
    EXPORT  gbt_pause  ; Pauses or unpauses the song.
                       ; -------------------------------------------------
                       ; a = 0 to unpause, anything else to pause.
; ------------------------------------------------------------------------
    EXPORT  gbt_loop   ; Enables/disables looping at the end of the song.
                       ; -------------------------------------------------
                       ; a = 0 to stop at the end, anything else to loop
; ------------------------------------------------------------------------
    EXPORT  gbt_stop   ; Stops the song.
; ------------------------------------------------------------------------
    EXPORT  gbt_enable_channels ; Enables given channels.
                                ; ----------------------------------------
                                ; a = channel flags ORed:
                                ;         channel 1 = 1
                                ;         channel 2 = 2
                                ;         channel 3 = 4
                                ;         channel 4 = 8
; -------------------------------------------------------------------------
    EXPORT  gbt_update  ; Updates the player, must be called each VBL.
                        ; THIS WILL CHANGE TO BANK 1!!!
; -------------------------------------------------------------------------

    ENDC ; GBT_PLAYER_INC
