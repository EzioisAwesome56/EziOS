; EzioOS bootloader
; copyright EzioSoft 2019
[org 0x7c00]

loop:
jmp loop
; fill empty space
times 510-($-$$) db 0
; magic bootable thing
dw 0xaa55