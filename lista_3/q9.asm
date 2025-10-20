#Faça um programa leia certa quantidade de números e imprima o maior deles e quantas vezes o maior número foi lido. A quantidade de números a serem lidos deve ser fornecido pelo usuário.

.text
main:
	add $8, $0, $0 #quantidade
	add $9, $0, $0 #testadormaior
	addi $11, $0, 0 #qtd maior
	
	addi $2, $0, 5
	syscall
	
	add $8, $0, $2 #quantidade
	
	beq $2, 0, fim
	
	lop:
	
	beq $8, 0, fim
	
	addi $2, $0, 5
	syscall
	
	slt $10, $9, $2
	beq $10, 1, maior
	
	subi $8, $8, 1
	j lop
	
	maior:
	
	add $9, $0, $2
	subi $8, $8, 1
	addi $11, $11, 1
	j lop
	
	fim:
	
	addi $2, $0, 1
	add $4, $0, $9
	syscall
	
	addi $2, $0, 11
	addi $4, $0, 10
	syscall
	
	addi $2, $0, 1
	add $4, $0, $11
	syscall
	
	addi $2, $0, 10
	syscall
