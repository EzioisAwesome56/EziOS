; EzioOS Real mode disc io library
; copyright 2019

; load DH sectors to buffer at ES:DX from drive dl
disk_load:
	push dx
	
	mov ah, 0x02
	mov al, dh
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02 ; read sector right after bootsector
	
	; jump to bios interupt
	int 0x13
	
	; was there a disk error?
	jc disk_error
	
	; cleaning up
	pop dx
	cmp dh, al ; did the number of sectors read equal the expected amount?
	jne disk_error ; if it didnt, display disk error
	ret
	
disk_error:
	mov si, DISK_ERROR_MSG
	call print_string
	; halt the system i guess
	cli
	hlt
	
DISK_ERROR_MSG:
	db "Disk Read Error!",0