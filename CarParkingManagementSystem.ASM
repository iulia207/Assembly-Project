
.model small
.stack 100h
.data    

menu db '*****************MENU*********************$'
menu1 db 'Press 1 for van$'
menu2 db 'Press 2 for car$'
menu3 db 'Press 3 for bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 when a van leaves$'
menu6 db 'Press 6 when a car leaves$'
menu7 db 'Press 7 when a bus leaves$'
menu8 db 'Press 8 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount of occupied parking spots =$'
msg8 db 'the total number of vehicles parked=$'
msg12 db '*** A van left! Have a good day!***$'
msg13 db '*** A car left! Have a good day!***$'  
msg14 db '*** A bus left! Have a good day!***$'
amount dw 0
count dw  '0'
am1 dw ?
am2 dw ?
am3 dw ?




.code               

main proc
mov ax,@data
mov ds,ax



while_:   
           
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu7
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

 
mov dx,offset menu8
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov ah,1
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  
mov al,bl
cmp al,'1'
je van
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del    
cmp al,'6'
je de
cmp al,'7'
je d
cmp al,'8'
je end_


mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

vn:
call van


car:
call caar

        
bus:
call buss        
        
                 
rec:
call recrd
                                  
                 
del:
call deltv


de:
call deltc

d: 
call deltb 



end_:
mov ah,4ch
int 21h

main endp





van proc
cmp count,'6'
jle van1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

van1:
mov ax,2
add amount, ax
mov dx,0 
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3

inc count



jmp while_
jmp end_

       
 van endp      
       
caar proc
cmp count,'12'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:
mov ax,1
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33



inc count

jmp while_
jmp end_

caar endp


buss proc
cmp count,'3'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus1:
mov ax,4
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333

inc count

jmp while_
jmp end_
   
   
buss endp   

recrd proc
mov dx,offset msg7
mov ah,9
int 21h


mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

jmp while_
jmp end_

recrd endp
 
 
deltv proc

dec count
sub amount, 2

mov dx,offset msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




jmp while_
jmp end_




 deltv endp



deltc proc

dec count
sub amount, 1

mov dx,offset msg13
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




jmp while_
jmp end_




 deltc endp


deltb proc

dec count
sub amount, 4

mov dx,offset msg14
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




jmp while_
jmp end_




 deltb endp


end main   
