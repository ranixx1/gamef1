.text

main:
	lui $8, 0x1001
	ori $9,$0, 0xff00 #verde
	addi $10,$0,128
	
for: beq $10,$0,fim
	sw $9,0($8)
	addi $8,$8,4
	addi $10,$10,-1
	j for
	
	
fim: addi $2,$0,10
	syscall