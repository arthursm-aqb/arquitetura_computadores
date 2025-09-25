.text
main:
	#Faça um programa que leia um número inteiro entre 0 e 999 e imprima esse número com 3 algarismos. Ex.: 23 gera uma saída 023. 8 gera uma saída 008.
	add $v0, $zero, 5
	syscall
	add $t5, $zero, 100
	add $t6, $zero, 10
	add $t7, $zero, 1
	div $v0, $t5
	mflo $t0
	mfhi $t3
	div $t3, $t6
	mflo $t1
	mfhi $t3
	add $v0, $zero, 1
	add $a0, $zero, $t0
	syscall
	add $a0, $zero, $t1
	syscall
	add $a0, $zero, $t3
	syscall
	add $v0, $zero, 10
	syscall