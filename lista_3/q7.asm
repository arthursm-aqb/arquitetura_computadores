#Faça um programa que leia números inteiros diferentes de zero e calcule a soma dos
#valores positivos. O laço do programa termina quando o usuário digita um valor zero.
#Em seguida o programa imprime a soma dos valores positivos digitados.

.text
main:
	addi $8, $0, -1 #testador
	add $10, $0, $0 #acumulador
	
	loop:
	
	addi $2, $0, 5
	syscall
	
	slt $11, $8, $2
	beq $11, 1, soma
	j loop
	
	soma:
	
	beq $2, $0, fim
	
	add $10, $10, $2
	j loop
	
	fim:
	
	addi $2, $0, 1
	add $4, $0, $10
	syscall
	
	addi $2, $0, 10
	syscall
	
	
	