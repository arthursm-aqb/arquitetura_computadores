.text 
main:
	addi $v0, $zero, 5
	syscall
	addi $t0, $zero, 10 #T0 � IGUAL A 10 e � o divisor
	addi $t2, $zero, 0
	add $t1, $zero, $v0 #T1 armazenar� o didivendo
	div $t1, $t0 #Vamos somar LO com o valor de T2
	mflo $t1
	mfhi $t2
	div $t1, $t0
	mfhi $t3 #T3 ser� a vari�vel auxiliar
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
	
