.text
main:
	#Faça um programa que leia um número entre 0 e 9999 e imprima cada algarismo em uma linha diferente.
	add $v0, $zero, 5
	syscall
	add $t5, $zero, 1000
	add $t6, $zero, 100
	add $t7, $zero, 10
	div $v0, $t5
	mflo $t0
	mfhi $t3
	div $t3, $t6
	mflo $t1
	mfhi $t3
	div $t3, $t7
	mflo $t2
	mfhi $t3
	add $v0, $zero, 1
	add $a0, $zero, $t0
	syscall
	add $v0, $zero, 11
	add $a0, $zero, 10
	syscall
	add $v0, $zero, 1
	add $a0, $zero, $t1
	syscall
	add $v0, $zero, 11
	add $a0, $zero, 10
	syscall
	add $v0, $zero, 1
	add $a0, $zero, $t2
	syscall
	add $v0, $zero, 11
	add $a0, $zero, 10
	syscall
	add $v0, $zero, 1
	add $a0, $zero, $t3
	syscall
	add $v0, $zero, 11
	add $a0, $zero, 10
	syscall
	