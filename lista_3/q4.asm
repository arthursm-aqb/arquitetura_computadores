#Faça um programa que leia do usuário um intervalo fechado e imprima os números
#pares desse intervalo (inclusive os limites).

.text
main:
	
	addi $2, $0, 5
	syscall
	
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	
	add $9, $0, $2
	
	beq $8, $9, igual # a=b? se sim, imprime somente um elemento
	
	slt $11, $8, $9
	beq $11, 1, aMb
	
	bMa:
		addi $10, $0, 2
	
		div $8, $10
		mfhi $11
	
		beq $11, $0, loopparBmA
	
		add $4, $0, $8
		addi $2, $0, 1
		syscall
	
		subi $8, $8, 1
	
		addi $4, $0, 10
		addi $2, $0, 11
		syscall
	
		j loopparBmA
	
		loopparBmA:
	
		add $4, $0, $8
		addi $2, $0, 1
		syscall
	
		subi $8, $8, 2
		slt $12, $9, $8
	
		addi $4, $0, 10
		addi $2, $0, 11
		syscall
		
		beq $12, 1, loopparBmA
		
		add $4, $0, $9
		addi $2, $0, 1
		syscall
	
		addi $2, $0, 10
	
		syscall
	
	aMb:
	
		addi $10, $0, 2
	
		div $8, $10
		mfhi $11
	
		beq $11, $0, looppar
	
		add $4, $0, $8
		addi $2, $0, 1
		syscall
	
		addi $8, $8, 1
	
		addi $4, $0, 10
		addi $2, $0, 11
		syscall
	
		j looppar
	
		looppar:
	
		add $4, $0, $8
		addi $2, $0, 1
		syscall
		
		addi $8, $8, 2
		slt $12, $8, $9
	
		addi $4, $0, 10
		addi $2, $0, 11
		syscall
	
		beq $12, 1, looppar
		
		add $4, $0, $9
		addi $2, $0, 1
		syscall
	
		addi $2, $0, 10
	
		syscall
	
	igual:
	
	addi $10, $0, 2
	div $8, $10
	mfhi $11
	
	beq $11, 0, par
	
	add $4, $0, $0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	
	syscall
	
	par:
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	
	syscall
