#Escreva um programa para ler dois números inteiros e mostrar na tela o maior deles,
#bem como a diferença entre eles (a diferença é sempre um valor positivo)

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	
	beq $10, 1, menor
	
	addu $4, $0, $8
	subu $11, $8, $9
	j print
		
	menor:
		addu $4, $0, $9
		subu $11, $9, $8
	print:
		addi $2, $0, 1
		syscall
		
		addu $4, $0, $11
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall