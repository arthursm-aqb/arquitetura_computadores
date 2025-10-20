#Faça um programa que leia 10 valores e imprima a sua soma.

.text
main:
	
	add $8, $0, $0
	addi $9, $0, 10
	add $10, $0, $0 #acumulador
	
	loop:
	
	addi $2, $0, 5
	syscall
	
	add $10, $10, $2
	
	addi $8, $8, 1
	slt $11, $8, $9
	beq $11, 1, loop
	
	addi $2, $0, 1
	add $4, $0, $10
	syscall
	
	addi $2, $0, 10
	syscall
	
	
	