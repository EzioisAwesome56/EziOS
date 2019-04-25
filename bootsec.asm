; EzioOS bootloader
; copyright EzioSoft 2019
[org 0x7c00]


; put string in si
mov si, weed
call print_string

; halt the system lol
cli
hlt

; includes
%include "string.asm"

; string
weed:
	db 'sonya driving',0
	
; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55