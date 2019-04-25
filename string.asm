; EzioOS String library
; copyright 2019

; string printer
print_string:
	; in si: string
	; setup int10h params
	mov ah, 0x0E
	mov bh, 0x00
.loop:
	; load a byte from SI into AL
	; and then increase it
	; lodsb does this quick
	lodsb
	
	; does al have a bull terminator?
	cmp al, 0x00
	je .done
	
	; call int10
	int 10h
	
	; repeat
	jmp .loop
	
.done:
	; return to caller
	ret