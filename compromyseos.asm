org 7C00h

; 16 bit assembly
bits 16

%define LOAD_ADDR 0x6000

; entrypoint
_start:
  cli

  ; clear registers
  mov ah, 0
  mov al, 0
  mov ax, 0

  mov bh, 0
  mov bl, 0
  mov bx, 0

  mov ch, 1
  mov cl, 1
  mov cx, 0

  mov ds, ax 
  mov es, bx
  mov fs, cx
  mov gs, dx
  mov ss, ax

  mov sp, cx ; Stack Pointer
  mov bp, dx ; Base Pointer
  mov si, sp ; Source Index
  mov di, bp ; Destination Index

; New function
printmain:
  mov ax, 0x0003
  int 0x10          ; interrupt

  mov ax, .string_to_print
  jmp print_string
  .string_to_print: db "compromyseOS :D", 0x00  

print_string:
  .init:
    mov si, ax

  .print_char_loop:
    cmp byte [si], 0
    je .end 

    mov al, [si]

    mov ah, 0x0e 
    int 0x10      
 
    inc si
    jmp .print_char_loop
    .end:


end:
  jmp LOAD_ADDR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       Data Section      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
align 16

daps:
  .size:             db 0x10
  db 0
  .transfer_buffer:  dd LOAD_ADDR
  .lba_lower:        dd 0x1
  .lba_upper:        dd 0x0

times 0200h - 2 - ($ - $$)  db 0
dw 0AA55h