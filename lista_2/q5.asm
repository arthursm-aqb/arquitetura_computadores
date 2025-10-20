#Faça um programa que receba três notas (entre 0 e 100) e calcule a média ponderada
#dessas notas com pesos 1, 2 e 3. Informe a média e se o aluno foi aprovado, escreva
#após a média o a letra A. Caso o aluno seja reprovado, informe, após a média, a letra R.
#A média para aprovação é 60.

.text
main:
	addi $2, $0, 5
	syscall
	
	addu $8, $0, $2 #n1
	
	addi $2, $0, 5
	syscall
	
	addu $9, $0, $2 #n2
	
	addi $2, $0, 5
	syscall
	
	addu $10, $0, $2 #n3
	
	addi $11, $0, 6 #peso
	
	addi $12, $0, 2 #peso2
	addi $13, $0, 3 #peso3
	
	mult $9, $12
	mflo $9
	
	mult $10, $13
	mflo $10
	
	addu $15, $8, $9
	addu $15, $15, $10 #soma das notas
	
	div $15, $11
	mflo $15 #nota ponderada 
	
	addi $13, $0, 60 
	
	slt $14, $13, $15
	
	beq $14, 1, aprovado
	
	beq $15, 60, aprovado
	
	j reprovado
	
	aprovado:
	
		addi $2, $0, 11
		addi $4, $0, 65
		syscall
		addi $2, $0, 10
		syscall
	
	reprovado:
	
		addi $2, $0, 11
		addi $4, $0, 82
		syscall
		addi $2, $0, 10
		syscall
	
	