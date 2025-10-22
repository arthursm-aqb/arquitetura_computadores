#Faça um programa para calcular o fatorial de um número

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2 # fatorial
	addi $11, $0, 1
	
	beq $8, 0, um
	beq $8, 1, um
	beq $8, 2, dois
	
	subi $9, $8, 1
	
	mul $10, $8, $9 
	
	lop:
	
		subi $9, $9, 1
		mul $10, $10, $9 
		
		beq $9, 1, fim
		j lop
	
	um:
		addi $2, $0, 1
		addi $4, $0, 1
		syscall
		addi $2, $0, 10
		syscall
	dois:
		addi $2, $0, 1
		addi $4, $0, 2
		syscall
		addi $2, $0, 10
		syscall
	
	fim:
		addi $2, $0, 1
		add $4, $0, $10
		syscall
		addi $2, $0, 10
		syscall