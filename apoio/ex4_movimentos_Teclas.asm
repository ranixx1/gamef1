.text
main:   ori $5, $0, 0xffff
        sll $5, $5, 4
        ori $5, $5, 0xf
        addi $2, $0, 42
       
        lui $10, 0x1001
        addi $8, $0, 512
for1:   beq $8, $0, fimCena
       
        addi $4, $0, 0
        syscall
        sw $4, 0($10)
        sw $4, 2048($10)

        addi $10, $10, 4
        addi $8, $8, -1
        j for1
fimCena:  

        lui $12, 0x00ff  #$12 cor vermelha 0x00ff0000
       
        lui $19, 0x1001
        addi $19, $19, 512
        sw $12, 0($19)
       
        lui $10, 0x1001
        add $14, $10, 124
        add $15, $0, $10
       
        ori $9, $0, 0xffff
        sll $9, $9, 8
        ori $9, $9, 0xff

        lui $17, 0xffff
        sw $9, 0($10)
        addi $13, $0, 4
for2:  
        lw $18, 0($17)
        beq $18, $0, continue
        lw $20, 4($17)
        addi $21, $0, ' '
        beq $21, $20, fimJogo
        addi $21, $0, 'd'
        beq $21, $20, moveR
        addi $21, $0, 'a'
        beq $21, $20, moveL
        addi $21, $0, 's'
        beq $21, $20, moveD
        addi $21, $0, 'w'
        beq $21, $20, moveU
        addi $21, $0, 'e'
        beq $21, $20, moveDU
       
continue: jal timer
       
        add $16, $10, $13
        beq $19, $16, fimJogo
        sw $9, 0($16)
       
        lw $11, 2048($10)
        sw $11, 0($10)
       
        add $10, $10, $13
       
        beq $10, $14, dim
        beq $10, $15, pos  
        j segue
dim:    add $13, $0, -4
        j segue    
pos:    add $13, $0, 4        
       
segue:  
        j for2
       
moveR:  lw $22, 2048($19)
        addi $19, $19, 4
        sw $12, 0($19)
        sw $22, -4($19)
        j continue

moveL:  lw $22, 2048($19)
        addi $19, $19, -4
        sw $12, 0($19)
        sw $22, 4($19)
        j continue
moveD:  lw $22, 2048($19)
        addi $19, $19, 128
        sw $12, 0($19)
        sw $22, -128($19)
        j continue  
moveU:  lw $22, 2048($19)
        addi $19, $19, -128
        beq $19, $16, fimJogo
        sw $12, 0($19)
        sw $22, 128($19)
        j continue  
moveDU: lw $22, 2048($19)
        addi $19, $19, -124
        sw $12, 0($19)
        sw $22, 124($19)
        j continue                                                    
                               
fimJogo:

parou:   addi $2, $0, 10
         syscall    
         
         
#===========================================================
# Nome: timer
# rotulos: timer, fortimer, fimtimer
# reg usados: $25        
timer:  addi $25, $0, 6500
fortimer: beq $25, $0, fimtimer
          nop
          nop
          addi $25, $25, -1
          j fortimer        
fimtimer: jr $31
