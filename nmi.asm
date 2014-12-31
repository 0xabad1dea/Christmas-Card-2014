; by 0xabad1dea 2014

; this is the NMI, which executes once per screen refresh (60 fps on NTSC)
; and is when you jam all your pixels in as fast as you can

; loading sprites.... dma-gic
 	lda #3
	sta $4014

; updating clock
    ldx Timer
    inx
    stx Timer
    cpx #60
    beq ResetTimer
    
NMIEnd:
;scroll stuff
    lda #0
    sta $2005 ; x scroll
    sta $2005 ; y scroll
Music:
	jsr	$8084 ;sound_driver_start
	rti
	
IRQRoutine:
	rti

ResetTimer:
; color cycle the background -- yes it's unrolled I'm lazy
    lda #$3F
    sta $2006
    lda #$00
    sta $2006

	lda SecondsTimer
	and #3 ; get a value 0, 1, 2, 3
	cmp #0
	beq .CyclePal1
	cmp #1
	beq .CyclePal2
	cmp #2
	beq .CyclePal3
	jmp .CyclePal4
	
.CyclePal1:
    lda #$23
    sta $2006
    lda #$C0
    sta $2006
    ldx #0
    lda #%01010101
.LoadColors1:
    sta $2007
    inx
    cpx #64
    bne .LoadColors1
	jmp .ResetTimerCont
	
.CyclePal2:
    lda #$23
    sta $2006
    lda #$C0
    sta $2006
    ldx #0
    lda #%10101010
.LoadColors2:
    sta $2007
    inx
    cpx #64
    bne .LoadColors2
	jmp .ResetTimerCont
	
.CyclePal3:
    lda #$23
    sta $2006
    lda #$C0
    sta $2006
    ldx #0
    lda #%11111111
.LoadColors3:
    sta $2007
    inx
    cpx #64
    bne .LoadColors3
	jmp .ResetTimerCont

.CyclePal4:
    lda #$23
    sta $2006
    lda #$C0
    sta $2006
    ldx #0
    lda #%00000000
.LoadColors4:
    sta $2007
    inx
    cpx #64
    bne .LoadColors4
	jmp .ResetTimerCont

.ResetTimerCont:
; now we gon' check for lyrics to load
    lda #$20
    sta $2006
    lda #$E0
    sta $2006
    ldx #0 
	lda SecondsTimer
	cmp #1
	beq LoadTenGigabit
	cmp #3
	beq LoadOnePacket
	cmp #5
	beq LoadDataSink
	cmp #7
	beq LoadSmileyFace
	cmp #9
	beq LoadDiagramStager
	cmp #11
	beq LoadSuckUpStager
	cmp #13
	beq LoadUncleSamStager
	cmp #15
	beq LoadTerminatorsStager
	cmp #17
	beq LoadDatacenterStager
	cmp #19
	beq LoadJustGottaStager
	cmp #21
	beq LoadBreakEnterStager
	cmp #23
	beq LoadNoNeedStager
	cmp #25
	beq LoadTapThatStager
	cmp #27
	beq LoadDownloadStager
	cmp #29
	beq LoadWinWarStager
	cmp #31
	beq LoadGoodRiddanceStager
	cmp #$FF
	beq LoadDashingStager


ResetTimerEnd:
    lda #0
    sta Timer
    ldx SecondsTimer
    inx
    stx SecondsTimer
    ;sta SecondsTimer ; WHY WAS THIS HERE?!?!?!
	; IT GAVE ME A HECK OF AN AWFUL BUG TO TRACK DOWN

    jmp NMIEnd


; lyric loading loops
; yes I am aware there's mega redundant code don't care
LoadTenGigabit:
	.loop:          
		lda TenGigabit,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd	
LoadOnePacket:
	.loop:          
		lda OnePacket,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadDataSink:
	.loop:          
		lda DataSink,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd

LoadDiagramStager:
	jmp LoadDiagram
LoadSuckUpStager:
	jmp LoadSuckUp
LoadUncleSamStager:
	jmp LoadUncleSam
LoadTerminatorsStager:
	jmp LoadTerminators
LoadDatacenterStager:
	jmp LoadDatacenter


LoadSmileyFace:
	.loop:          
		lda SmileyFace,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd


LoadJustGottaStager:
	jmp LoadJustGotta
LoadBreakEnterStager:
	jmp LoadBreakEnter
LoadNoNeedStager:
	jmp LoadNoNeed
LoadTapThatStager:
	jmp LoadTapThat
LoadDownloadStager:
	jmp LoadDownload
LoadWinWarStager:
	jmp LoadWinWar
LoadGoodRiddanceStager:
	jmp LoadGoodRiddance
LoadDashingStager:
	jmp LoadDashing

LoadDiagram:
	.loop:          
		lda Diagram,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadSuckUp:
	.loop:          
		lda SuckUp,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadUncleSam:
	.loop:          
		lda UncleSam,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadTerminators:
	.loop:          
		lda Terminators,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadDatacenter:
	.loop:          
		lda Datacenter,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadJustGotta:
	.loop:          
		lda JustGotta,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadBreakEnter:
	.loop:          
		lda BreakEnter,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd

LoadNoNeed:
	.loop:          
		lda NoNeed,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadTapThat:
	.loop:          
		lda TapThat,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadDownload:
	.loop:          
		lda Download,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadWinWar:
	.loop:          
		lda WinWar,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadGoodRiddance:
	.loop:          
		lda GoodRiddance,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd
	
LoadDashing:
	.loop:          
		lda Dashing,x
	    sta $2007
	    inx
		cpx #32
	    bne .loop
	jmp ResetTimerEnd