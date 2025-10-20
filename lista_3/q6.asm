#Faça um programa que leia números inteiros e calcule a soma. O laço do programa
#termina quando o usuário digita um valor negativo. Em seguida o programa imprime a
#soma dos valores digitados.

.text
main:
	addi $8, $0, -1
	add $10, $0, $0 #acumulador
	
	loop:
	
	addi $2, $0, 5
	syscall
	add $10, $10, $2
	
	slt $11, $8, $2
	beq $11, 1, loop
	
	addi $2, $0, 1
	add $4, $0, $10
	syscall
	
	addi $2, $0, 10
	syscall
	
	
	