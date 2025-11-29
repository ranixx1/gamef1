lui  $8, 0x1001
ori  $9, $0, 0xff00
addi $10,$0,100 

up:
    beq  $10,$0,fim
    sw   $9,0($8)
    addi $8,$8,-2048   # sobe 1 linha
    addi $10,$10,-1
    j    up
