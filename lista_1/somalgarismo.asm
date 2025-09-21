.text 

#Faça um programa que leia um número inteiro entre 0 e 999 e imprima a soma dos algarismos desse número. Ex.: 358 gera uma saída de 16, pois 3+5+8 = 16
main:
	addi $v0, $zero, 5
	syscall
	addi $t0, $zero, 10 #T0 É IGUAL A 10 e é o divisor
	addi $t2, $zero, 0
	add $t1, $zero, $v0 #T1 armazenará o didivendo
	div $t1, $t0 #Vamos somar LO com o valor de T2
	mflo $t1
	mfhi $t2
	div $t1, $t0
	mfhi $t3 #T3 será a variável auxiliar
	add $t2, $t2, $t3
	mflo $t1
	div $t1, $t0
	mfhi $t3
	add $t2, $t2, $t3
	add $a0, $zero, $t2
	addi $v0, $zero, 1
	syscall
	addi $v0, $zero, 10
	syscall
	
