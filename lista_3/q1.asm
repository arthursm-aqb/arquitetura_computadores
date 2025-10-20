#Faça um programa que calcule e mostre os 10 primeiros números múltiplos de 3,
#considerando valores maiores que 0

.text
main:
	add $9, $0, $0
	addi $10, $0, 3
	addi $11, $0, 30
	loop:
	add $9, $9, $10
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	addi $2, $0, 11
	addi $4, $0, 10
	syscall
	bne $9, $11, loop
	addi $2, $0, 10
	syscall