; EzioOS bootloader
; copyright EzioSoft 2019
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
mov si, 0x9000
call print_string

; halt the system lol
cli
hlt

; includes
%include "string.asm"
%include "disk.asm"

; strings
bootmsg:
	db 'EzioOS v1.0 Bootloader',0
realmode:
	db "Real mode initialization", 0

; vars
bootdrive:
	db 0

; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55

; anything past this is NOT in boot sector
db "Disk io WORKS!",0
times 497 db 0