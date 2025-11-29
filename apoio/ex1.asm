.text 
main: 
		lui $8, 0x1001
		ori $9,$0, 0xff00
		sw $9,0($8) # acende luz verde
		sll $9,$9,8
		sw $9,4($8) #acende luz vermelha
		
		
		addi $2,$0,10
		syscall 
