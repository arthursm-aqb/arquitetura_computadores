#Faça um programa que implementa um laço com um teste no início que conte de 0 a
#10 imprimindo esses números, um em cada linha da saída.

.text
main:
	
	addi $9, $0, 11
	add $10, $0, $0 # acumulador
	
	loop:
	slt $8, $10, $9
	beq $8, 0, fimloop
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	addi $10, $10, 1
	
	addi $4, $0, 10
	addi $2, $0, 11
	syscall
	
	j loop
	
	fimloop:
	
	addi $2, $0, 10
	
	syscall