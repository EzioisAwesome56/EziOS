; EzioOS bootloader
; copyright EzioSoft 2019
[org 0x7c00]

; thing for bios teletype
mov ah, 0x0e
; put a letter in al
mov al, 'f'
; make bios call
int 0x10

loop:
jmp loop
; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55