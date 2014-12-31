;                                                                            ,  
;     ,,                     ,                              /\   /\\   /|   /|  
;     ||           '        ||             _               (  ) || || /||  / |  
; _-_ ||/\\ ,._-_ \\  _-_, =||= \\/\\/\\  < \,  _-_,         // || ||  ||  __|_ 
;||   || ||  ||   || ||_.   ||  || || ||  /-|| ||_.         //  || ||  ||  ---- 
;||   || ||  ||   ||  ~ ||  ||  || || || (( ||  ~ ||       /(   || ||  ||    |  
;\\,/ \\ |/  \\,  \\ ,-_-   \\, \\ \\ \\  \/\\ ,-_-        {___  \\/  ,/-'  ,_, 
;       _/                                                                      
; Nintendo Christmas Card 2014
; by 0xabad1dea

; INES header
    .inesprg    2   ; 32kb of program
    .ineschr    1   ; one 8KB chr file
    .inesmir    0   ; what does the mirror setting do? ~nobody knows~
    .inesmap    0   ; real women use mapper zero
    
    
;---------------------------------------------------;
;---- bank usage record ----------------------------;
; 0  $8000 res/sslsmiley.nsf
; 1  $a000 data.asm
; 2  $c000 events.asm (blank)
; 3  $e000 nmi.asm $f000 main.asm (boot starts here)
; ---- chr ----
; 4  res/nsa-routers.chr
    
    .bank	0
    .org	$8000
    .incbin "res/sslsmiley.nsf"  
    
    .bank 1
    .org $a000
    .include "data.asm"

    .bank 2
    .org $c000
    .include "events.asm"

	.bank 3
	.org $f000
    .include "main.asm"

	.bank 4	; chr banks come after prg banks numerically because ?.
	.org $0000
    .incbin "res/nsa-routers.chr"
	
    .bank 3
    .org $e000
 NMIRoutine:
    .include "nmi.asm"

	
	.org	$FFFA           ; vectors
	.dw		NMIRoutine
	.dw		ResetRoutine
	.dw		IRQRoutine
   

    
;---------------------------------------------------;
;--- variables -------------------------------------;
				.rsset $001B ; reserved for NSF
Timer			.rs 1	; fractions of a second (every NMI)
SecondsTimer	.rs 1   ; increments when Timer hits 60  