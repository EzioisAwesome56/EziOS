; EziOS bootloader
; copyright EzioSoft 2019
[bits 16]
[org 0x7c00]

; bios tells us our boot drive via dl
; store it for later
mov [bootdrive], dl


; put boot message in si
mov si, bootmsg
call print_string
mov si, realmode
call print_string

mov bp, 0x8000 ; moving the stack pointer is probably a good idea
mov sp, bp ; which we do here instead of later

; try to load sector 2
mov bx, 0x0000
mov es, bx
mov bx, 0x9000
mov dh, 1
mov dl, [bootdrive]
call disk_load
; if the system didnt halt, it probably worked
;mov si, 0x9000
;call print_string

; pray its all okay and jump to command handler
jmp 0x000:0x9000

; halt the system lol
cli
hlt

; includes
%include "string.asm"
%include "disk.asm"

; strings
bootmsg:
	db 'EziOS v1.0 Bootloader',0
realmode:
	db "Real mode initialization", 0
cmdhand:
	db "Loading real mode command handler...",0
; vars
bootdrive:
	db 0

; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55

; anything past this is NOT in boot sector
; try printing
mov si, cmdhand
call 0x0000:print_string
hlt

times 512 db 5