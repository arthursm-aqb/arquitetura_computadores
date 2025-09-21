.text 
#Faça um programa para ler um número inteiro e imprimir o dobro desse número.
main:
	add $v0, $zero, 5
	syscall
	add $t0, $zero, $v0
	sll $a0, $t0, 1
	add $v0, $zero, 1
	syscall
