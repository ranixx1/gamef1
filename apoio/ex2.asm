.text 
main: 
		lui $8, 0x1001
		ori $9,$0, 0xff00
        addi $10,$0,32
for:
        beq $10,$0, fim
		sw $9,0($8) # acende luz verde
        addi $8,$8,128
        addi $10,$10,-1
        j for

				
fim:    addi $2,$0,10
		syscall 
