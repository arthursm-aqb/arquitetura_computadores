#Faça um programa que leia um ano e informe se esse ano é bissexto.

.text
main:
	addi $2, $0, 5
	syscall
	
	addu $8, $0, $2 #ano
	
	addi $10, $0, 4
	addi $11, $0, 100
	addi $12, $0, 400
	
	div $8, $10
	mfhi $13
	
	div $8, $11
	mfhi $14
	
	div $8, $12
	mfhi $15
	
	beq $15, 0, bissexto # se ano % 400 = 0, então é bissexto
	beq $13, 0, verif
	
	j nbissexto
	
	verif:
		
		bnez $14, bissexto
		j nbissexto
	
	bissexto:
		addi $2, $0, 11
		addi $4, $0, 83
		syscall
		addi $2, $0, 10
		syscall
	
	nbissexto:
	
		addi $2, $0, 11
		addi $4, $0, 78
		syscall
		addi $2, $0, 10
		syscall
	
	