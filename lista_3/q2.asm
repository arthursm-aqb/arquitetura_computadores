#Faça um programa que solicite ao usuário um número para ser a referência e outro
#para ser a quantidade de valores a ser impresso no caso do programa da Q1. Para a
#mesma resposta, por exemplo, o usuário forneceria a referência 3 e a quantidade 10.

.text
main:
	addi $2, $0, 5
	syscall
	
	add $8, $0, $2 #valor referencia
	
	addi $2, $0, 5
	syscall
	
	add $9, $0, $2
	mul $9, $8, $9 #quantidade de vezes do loop
	
	add $10, $0, $0 # acumulador
	
	loop:
	
	add $10, $8, $10
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 11
	addi $4, $0, 10
	syscall
	
	bne $9, $10, loop
	addi $2, $0, 10
	
	syscall