.model small
.stack 100h
.data
hd  db 10, "       |    *******************"
    db 10, "       |    [                    MTF Medical Store                ]"
    db 10, "       |    *******************", 10, "$"
    

mnu db 10, "       |    *******************"
    db 10, "       |    *  Medicines List                                    *"
    db 10, "       |    *  1.) Fever                                         *"
    db 10, "       |    *  2.) Cough                                         *"
    db 10, "       |    *  3.) Headache                                      *"
    db 10, "       |    *  4.) Flu                                           *"
    db 10, "       |    *******************", 10, "$"
    
select db 10, "       |    Enter Your Choice ====> : ", 10, "$"
try db "       |    --->  Show List Of Medicines [Y/N]? : $"
    
list1 db 10, "       |    ************"
    db 10, "       |                 Fever Meds             "
    db 10, "       |    ************"
    db 10, "       |             1. Paracetamol"
    db 10, "       |             2. Tylenol"
    db 10, "       |             3. Aspirin"
    db 10, "       |             4. Advil"
    db 10, "       |             5. Motrin"
    db 10, "       |    *************", 10, "$"
    
list2 db 10, "       |    ************"
    db 10, "       |                 Cough Meds             "
    db 10, "       |    ************"
    db 10, "       |             1. Benzonatate"
    db 10, "       |             2. Mucinex"
    db 10, "       |             3. Guaifenesim"
    db 10, "       |             4. Benadryl"
    db 10, "       |             5. Hycodan"
    db 10, "       |    *************", 10, "$"

list3 db 10, "       |    ************"
    db 10, "       |                 Headache Meds            "
    db 10, "       |    ************"
    db 10, "       |             1. Fioricet"
    db 10, "       |             2. Atogepant"
    db 10, "       |             3. Erenumab"
    db 10, "       |             4. Naproxen"
    db 10, "       |             5. Advil"
    db 10, "       |    *************", 10, "$"

list4 db 10, "       |    ************"
    db 10, "       |                   Flu Meds               "
    db 10, "       |    ************"
    db 10, "       |             1. Tamiflu"    
    db 10, "       |             2. Oseltamivir"
    db 10, "       |             3. Relenza"
    db 10, "       |             4. Xofluza"
    db 10, "       |             5. Zanamivir"
    db 10, "       |    *************", 10, "$"

.code
BG:

    mov ax, 6
    int 10h

    ; Set text and background color
   mov ah, 0Bh      ; Function: Set Background/Text Color
   mov bh, 00h      ; Page number (0 for default screen)
   mov bl, 04h      ; Background color (red) - 4 in the high nibble
   mov cl, 00h      ; Text color (white) - 7 in the low nibble
   int 10h


    ; Draw top line
    mov ah, 0ch
    mov al, 1
    mov cx, 60
    mov dx, 1
L1:
    int 10h
    inc cx
    cmp cx, 570
    jle L1

    ; Draw bottom line
    mov cx, 60
    mov dx, 199
L3:
    int 10h
    inc cx
    cmp cx, 570
    jle L3

    ; Draw left line
    mov cx, 60
    mov dx, 1		;starting point
L2:
    int 10h
    inc dx
    cmp dx, 199
    jle L2

    ; Draw right line
    mov cx, 570
    mov dx, 1 		;starting point
L4:
    int 10h
    inc dx
    cmp dx, 199
    jle L4

    ret

Start:

    ; Draw the graphics box
    call BG

    mov ax, @data
    mov ds, ax
    
    ; Heading
    mov ah, 09
    lea dx, hd
    int 21h
    
    ; Menu
    mov ah, 09
    lea dx, mnu
    int 21h
    
    ; Choice
    mov ah, 09
    lea dx, select
    int 21h

    ;set cursor
    mov ah,02h
    mov bh,0
    mov dl,38       ; <---->
    mov dh,13     ; up and down
    int 10h
    
    ; Input
    mov ah, 01
    int 21h
    
    cmp al, '1'
    je printlist1
    
    cmp al, '2'
    je printlist2
    
    cmp al, '3'
    je printlist3
    
    cmp al, '4'
    je printlist4
    
    jmp exit

printlist1:
    mov ah, 09
    lea dx, list1
    int 21h
    jmp tryagain

printlist2:
    mov ah, 09
    lea dx, list2
    int 21h
    jmp tryagain

printlist3:
    mov ah, 09
    lea dx, list3
    int 21h
    jmp tryagain

printlist4:
    mov ah, 09
    lea dx, list4
    int 21h
    jmp tryagain

tryagain:
    mov ah, 09
    lea dx, try
    int 21h
    
    mov ah, 01
    int 21h
    
    cmp al, 'y'
    je Start
    cmp al, 'Y'
    je Start
    cmp al, 'n'
    je exit
    cmp al, 'N'
    je exit
    
    jmp exit

exit:
    mov ah, 4ch
    int 21h
end Start