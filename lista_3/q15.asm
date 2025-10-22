#*Escreva um programa que leia um número inteiro positivo n e em seguida imprima n linhas do chamado Triangulo de Floyd.

.text
main:

addi $2, $0, 5
syscall 
add $8, $0, $2 #lops 6
addi $10, $0, 1 #acumulador
addi $11, $0, 1 #numaux

lop1:

	slt $12, $8, $11     
	beq $12, 1, fim 
	addi $9, $0, 1 

lop2:

	add $4, $0, $10 
	addi $2, $0, 1
	syscall 

	addi $9, $9, 1   
	addi $10, $10, 1  

	addi $4, $0, 32
	addi $2, $0, 11
	syscall

	slt $13, $9, $11
	beq $13, 1, lop2
	beq $9, $11, lop2

	addi $4, $0, 10
	addi $2, $0, 11
	syscall

	addi $11, $11, 1
	j lop1

fim:

	addi $2, $0, 10
	syscall
