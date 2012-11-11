[ORG 0x7c00]
	
	in al, 0x92
	or al, 2
	out 0x92, al
	
	xor ax, ax
	mov ds, ax
	mov ss, ax
	mov sp, 0x9c00
	
	cli
	push ds
	
	lgdt[gdtinfo]
	
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	
	mov bx, 0x08
	mov ds, bx
	
	and al, 0xFE
	mov cr0, eax
	
	pop ds
	sti
	
	
	mov ax, 0x0212
	mov bx, 0x1000
	mov cx, 0x0002
	mov dx, 0x0080
	int 0x13
	
	jmp 0x1000
	jmp $
	
gdtinfo:
   dw gdt_end - gdt - 1
   dd gdt 
 
gdt         dd 0,0      
flatdesc    db 0xff, 0xff, 0, 0, 0, 10010010b, 11001111b, 0
gdt_end:

times 510-($-$$) db 0
dw 0xAA55
	
	
	
