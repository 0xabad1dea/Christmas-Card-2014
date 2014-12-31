; by 0xabad1dea 2014

; this is tables which we copy to ram to make pretty pixels.

BGPalettes:
	.db $31,$00,$15,$0D ; (blue gray cranberry black)
	.db $31,$00,$1A,$0D ; (blue gray light green black)
	.db $31,$00,$22,$0D ; (blue gray lavender black)
	.db $31,$00,$26,$0D ; (blue gray orange black)
SPRPalettes:
	.db $31,$26,$1A,$09 ; (blue gold light green dark green)
	.db $31,$26,$1A,$09 ; (blue gold light green dark green)
	.db $31,$26,$1A,$09 ; (blue gold light green dark green)
	.db $31,$26,$1A,$09 ; (blue gold light green dark green)
	

; manually laying out the stars + wires + present
; all of it except half the present is overlaid on
; a nametable shadow image of itself…
; helped me with alignment you see.
SpritePages:
            ; y     	; tile		; spec		; x 
Star1Left:	.db 119,		$75,		$00,	88
Star1Right: .db 119,		$76,		$00,	96
Star2Left:	.db 119,		$75,		$00,	152
Star2Right:	.db 119,		$76,		$00,	160
Wire11:		.db 127,		$88,		$00,	112
Wire14:		.db 127,		$8B,		$00,	136
Wire21:		.db 135,		$98,		$00,	112
Wire22:		.db 135,		$99,		$00,	120
Wire23:		.db 135,		$9A,		$00,	128
Wire24:		.db 135,		$9B,		$00,	136
Wire31:		.db 143,		$A8,		$00,	112
Wire32:		.db 143,		$A9,		$00,	120
Wire33:		.db 143,		$AA,		$00,	128
Wire34:		.db 143,		$AB,		$00,	136
Wire41:		.db 151,		$B8,		$00,	112
Wire42:		.db 151,		$B9,		$00,	120
Wire43:		.db 151,		$BA,		$00,	128
Wire44:		.db 151,		$BB,		$00,	136
Wire51:		.db 159,		$C8,		$00,	112
Wire52:		.db 159,		$C9,		$00,	120
Wire53:		.db 159,		$CA,		$00,	128
Wire54:		.db 159,		$CB,		$00,	136
Wire61:		.db 167,		$D8,		$00,	112
Wire62:		.db 167,		$D9,		$00,	120
Wire63:		.db 167,		$DA,		$00,	128
Wire64:		.db 167,		$DB,		$00,	136
Wire71:		.db 175,		$E8,		$00,	112
Wire72:		.db 175,		$E9,		$00,	120
Wire73:		.db 175,		$EA,		$00,	128
Wire74:		.db 175,		$EB,		$00,	136
Present1:	.db 183,		$F8,		$00,	112
Present2:	.db 183,		$F9,		$00,	120
Present3:	.db 183,		$FA,		$00,	128
Present4:	.db 183,		$FB,		$00,	136
EndSpritePages: ; for pointer math


; HUMUNGOUS UNCOMPRESSED MANUALLY ASSEMBLED BACKGROUND AHOY

NameTable:

; row 1 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 2 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	
; row 3 (blank)
		.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
		.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 4
	.db "        HAPPY  HOLIDAYS         "


; row 5
	.db "        ADDED & REMOVED         "

; row 6 (the little x is on the g tile)
	.db "         BY 0gABAD1DEA          "
	
; row 7 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20	

; row 8 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 9 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 10 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 11 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 12 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 13 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 14 (blank)
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 15 (WANTED)           WA   AN   TE    ED
	.db $20, $20, $20, $20, $80, $81, $82, $83, $20, $20, $20, $20, $20, $20, $20, $20
;                                               WA    AN   TE   ED
	.db $20, $20, $20, $20, $20, $20, $20, $20, $8C, $8D, $8E, $8F, $20, $20, $20, $20

; row 16 (mispy)            mi   sp   y    --                 star star
	.db $20, $20, $20, $20, $90, $91, $92, $93, $20, $20, $20, $75, $76, $20, $20, $20
;                      star star                el    dr  it   ch
	.db $20, $20, $20, $75, $76, $20, $20, $20, $9C, $9D, $9E, $9F, $20, $20, $20, $20

; row 17 (zhuowei)          zh   uo    we   i             CI   SC   CO   |||  wires--
	.db $20, $20, $20, $20, $A0, $A1, $A2, $A3, $20, $20, $84, $85, $86, $87, $88, $89
;       ---wires  CI   SC   CO   |||            tr   yn   it    y
	.db $8A, $8B, $84, $85, $86, $87, $20, $20, $AC, $AD, $AE, $AF, $20, $20, $20, $20

; row 18 (fiora)            fi    or   a   --             =    . .   =   . .  wires--
	.db $20, $20, $20, $20, $B0, $B1, $B2, $B3, $20, $20, $94, $95, $96, $97, $98, $99
;       ---wires  =    . .  =    . .            ee   ve   e    --
	.db $9A, $9B, $94, $95, $96, $97, $20, $20, $BC, $BD, $BE, $BF, $20, $20, $20, $20

; row 19 (talen)             ta  le    n   --             CI    SC  CO   |||  wires--
	.db $20, $20, $20, $20, $C0, $C1, $C2, $C3, $20, $20, $A4, $A5, $A6, $A7, $A8, $A9
;       ---wires  CI   SC   CO   |||            ta   m    --   --
	.db $AA, $AB, $A4, $A5, $A6, $A7, $20, $20, $CC, $CD, $CE, $CF, $20, $20, $20, $20

; row 20 (blinky)                                         =    . .  =    . .  wires--
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $B4, $B5, $B6, $B7, $B8, $B9
;       ---wires  =    . .  =    . .
	.db $BA, $BB, $B4, $B5, $B6, $B7, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 21 (cisco)                                          CI    SC  CO   |||  wires--
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $C4, $C5, $C6, $C7, $C8, $C9
;       ---wires  CI   SC   CO   |||
	.db $CA, $CB, $C4, $C5, $C6, $C7, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 22 (blinky)                                         =    . .  =    . .  wires--
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $D4, $D5, $D6, $D7, $D8, $D9
;       ---wires  =    . .  =    . .
	.db $DA, $DB, $D4, $D5, $D6, $D7, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 23 (cisco)                                          CI    SC  CO   |||  wires--
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $E4, $E5, $E6, $E7, $E8, $E9
;       ---wires  CI   SC   CO   |||
	.db $EA, $EB, $E4, $E5, $E6, $E7, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

; row 24 (blinky with floor)                               =    . .  =    . .  
	.db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F4, $F5, $F6, $F7, $F0, $F0
;                  =    . .  =    . .
	.db $F0, $F0, $F4, $F5, $F6, $F7, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0

; row 25 (carpet)
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;;;;; padding to make 1024 to make my buffer math easier

	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20

	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	
	
;;;; song text data

AllSpaces:
	.db "                                "
Dashing:
	.db "   DASHING THROUGH THE CLOUD    "
TenGigabit:
	.db "     ON A TEN GIGABIT LINK      "
OnePacket:
	.db "     ONE PACKET IN A CROWD      "
DataSink:
	.db "    FALLS INTO THE DATA SINK    "
SmileyFace:
	.db "       DRAW A SMILEY FACE       "
Diagram:
	.db "         ON THE DIAGRAM         "
SuckUp:
	.db "  SUCK UP DATA LEAVE NO TRACE   "
UncleSam:
	.db "  IT'S ALL FOR UNCLE SAM. OH!   "
Terminators:
	.db "        SSL TERMINATORS         "
Datacenter:
	.db "       AT THE DATACENTER        "
JustGotta:
	.db "JUST GOTTA GET ON THE OTHER SIDE"
BreakEnter:
	.db "  JUST GOTTA BREAK AND ENTER!   "
NoNeed:
	.db "NO NEED TO HACK THAT SERVER RACK"
TapThat:
	.db "   JUST GOTTA TAP THAT FIBER    "
Download:
	.db " DOWNLOAD ALL THE PRIVATE DATA  "
WinWar:
	.db "     WIN THE WAR ON CYBER!      "
GoodRiddance:
	.db "=====GOOD RIDDANCE TO 2014======"