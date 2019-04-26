[bits 32]
; constants
vram equ 0xb8000
goodcolor equ 0x0f

; prints a null terminated string
printstring_pm:
	pusha
	mov edx, vram
	
printstring_pm_loop:
	mov al, [ebx]
	mov ah, goodcolor
	
	cmp al, 0 ; are we at end of string????
	je done
	
	mov [edx], ax
	
	add ebx, 1
	add edx, 2
	
	jmp printstring_pm_loop
	
done:
	popa
	ret