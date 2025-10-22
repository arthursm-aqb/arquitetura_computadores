#Faça um programa que imprima os n primeiros números da série de Fibonacci, sendo n fornecido pelo usuário.

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2 # n numeros da sequência
	
	beq $8, 1, um
	
	addi $2, $0, 1
	addi $4, $0, 1
	syscall
	
	subi $8, $8, 1
	
	addi $2, $0, 11
	addi $4, $0, 32 #espaço
	syscall
	
	addi $9, $0, 1 #numero atual
	add $10, $0, $0 #numero anterior

	
	lop:
		
		add $11, $9, $10 #num sequencia
		
		add $4, $0, $11
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 11
		addi $4, $0, 32 #espaço
		syscall
		
		subi $8, $8, 1
		
		beq $8, 0, fim
		
		add $10, $0, $9
		add $9, $0, $11
		j lop
		
	
	um:
		addi $2, $0, 1
		addi $4, $0, 1
		syscall
		addi $2, $0, 10
		syscall
	
	fim:
		addi $2, $0, 10
		syscall