.text 
main:
	#Faça um programa para ler um número inteiro e imprimir o quadrado desse número.
	add $v0, $zero, 5
	syscall
	add $t0, $zero, $v0
	add $t1, $zero, $t0
	mult $t0, $t1
	mflo $a0
	add $v0, $zero, 1
	syscall
