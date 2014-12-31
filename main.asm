; by 0xabad1dea 2014

; this is where the ROM starts on poweron/reset. main() if you prefer.


ResetRoutine:
; stack stuff
	cld
	sei
	ldx #$ff
	txs

; we have to wait for no good reason.
.WaitV:	
	lda	$2002
	bpl	.WaitV
.WaitV2:	
	lda	$2002
	bpl	.WaitV2
	ldx	#$00    ; kill graphics
	stx	$2000
	stx	$2001

  
; stuffing palettes
    lda #$3F
    sta $2006
    lda #$00
    sta $2006
    ldx #$00
.LoadPal:
    lda BGPalettes,x
    sta $2007
    inx
    cpx #$20
    bne .LoadPal

; copying nametable (background) to ppu
.SetupName:    
    lda #$20
    sta $2006
    lda #$00
    sta $2006
; this 1024-count loop is unrolled
    ldx #0 
.loop1:          
	lda NameTable,x
    sta $2007
    inx
    bne .loop1
	ldx #0
.loop2:
	lda NameTable+256,x
	sta $2007
	inx
	bne .loop2
	ldx #0
.loop3:
	lda NameTable+512,x
	sta $2007
	inx
	bne .loop3
	ldx #0
.loop4:
	lda NameTable+768,x
	sta $2007
	inx
	bne .loop4

; stick in the first line of lyrics
    lda #$20
    sta $2006
    lda #$E0
    sta $2006
    ldx #0 
.loop5:          
	lda Dashing,x
    sta $2007
    inx
	cpx #32
    bne .loop5


	lda #0 
.ClearRAM:
    sta $0000,x	; zp - used by ppmck and our variables 
    sta $0200,x ; used by ppmck
    sta $0300,x ; sprite page
    inx
    bne .ClearRAM    
    
    ; this code came from nullsleep	
	; *** CLEAR SOUND REGISTERS ***
	lda #$00		; clear all the sound registers by setting
	ldx #$00		; everything to 0 in the Clear_Sound loop
.Clear_Sound:
	sta $4000,x		; store accumulator at $4000 offset by x
	inx			; increment x
	cpx #$0F		; compare x to $0F
	bne .Clear_Sound		; branch back to Clear_Sound if x != $0F

	lda #$10		; load accumulator with $10
	sta $4010		; store accumulator in $4010
	lda #$00		; load accumulator with 0
	sta $4011		; clear these 3 registers that are 
	sta $4012		; associated with the delta modulation
	sta $4013		; channel of the NES
	
	; *** ENABLE SOUND CHANNELS ***
	lda #%00001111		; enable all sound channels except
	sta $4015		; the delta modulation channel
	
	; *** RESET FRAME COUNTER AND CLOCK DIVIDER ***
	lda #$C0		; synchronize the sound playback routine 
	sta $4017		; to the internal timing of the NES
	
    lda #0
    ldx #0

	jsr	$8080 ;sound_init 
	; end code from nullsleep
	
    lda #0  ; set scroll (none)
    sta $2005 ; x scroll
    sta $2005 ; y scroll


; set up the timer (technically they're already 0 as we cleared the page but.)
    lda #0
    sta Timer
    sta SecondsTimer

; bg colors - yet another rom where I escape
; worrying about attribute tables
    lda #$23
    sta $2006
    lda #$C0
    sta $2006
    ldx #0
    lda #%00000000
.LoadColors:
    sta $2007
    inx
    cpx #64
    bne .LoadColors
    
; copying the sprite table to ram
	ldx #0
.LoadSprites:
    lda SpritePages,x
    sta $0300,x
    inx
    cpx #(EndSpritePages - SpritePages) 
; FUNNY STORY I accidentally had the above number marked as hexadecimal
; when it was meant to be decimal and didn't notice because the buffer
; it was overreading to happened to "mean" blank sprites
    bne .LoadSprites
	
; turn on the graphics. let there be LIGHT
	lda #%10001000 
	sta $2000
	lda #$1A ; no bias
	sta $2001


; (the IRQ setup was here but don't think I need it in this rom)


; idle loop
looploop:
	jmp looploop
	






EasterEggText:
	.db "why are you reading my rom in a hex editor"
	; or source code as the case may be