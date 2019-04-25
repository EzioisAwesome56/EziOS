; EzioOS bootloader
; copyright EzioSoft 2019
[org 0x7c00]


; put boot message in si
mov si, bootmsg
call print_string

; halt the system lol
cli
hlt

; includes
%include "string.asm"
%include "disk.asm"

; string
bootmsg:
	db 'EzioOS v1.0 Bootloader',0
	
; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55

; anything past this is NOT in boot sector