#Faça um programa para ler um número inteiro. Se o número for positivo, imprima o
#dobro do número, se for negativo, imprima o quadrado do número.

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	slti $9, $8, 0
	
	beq $9, 1, quadrado
	
	sll $4, $8, 1
	j print
	
	quadrado:
	
		mult $8, $8
		mflo $4
	
	print:
		addi $2, $0, 1
		syscall
		addi $2, $0, 10
		syscall
		