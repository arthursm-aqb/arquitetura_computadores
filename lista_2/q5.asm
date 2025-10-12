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
	
	