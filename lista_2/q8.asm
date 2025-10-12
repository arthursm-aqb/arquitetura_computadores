.text
main:
	addi $2, $0, 5
	syscall
	addu $8, $0, $2 #dia
	
	addi $2, $0, 5
	syscall
	addu $9, $0, $2 #mês
	
	addi $2, $0, 5
	syscall
	addu $10, $0, $2 #ano
	
	
	addi $14, $0, 32
	slt $11, $0, $8 #0 é menor que o dia?
	slt $12, $8, $14 #a data do dia é menor que 32?
	and $13, $12, $11 #Se ambos são válidos, então o valor do dia é valido
	
	addi $15, $0, 13
	slt $11, $0, $9 #0 é menor que o mês?
	slt $12, $9, $15 #o mês é menor que 13?
	and $14, $12, $11 #Se ambos são válidos, então o valor do mês é valido
	
	slt $15, $0, $10 # ano é positivo?
	
	and $12, $13, $14
	and $12, $12, $15
	
	beq $12, 1, valido
	
	j nvalido
	
	valido:
	
		addi $4, $0, 83
		addi $2, $0, 11
		syscall
		
		addi $2, $0, 10
		syscall
	
	nvalido:
	
		addi $4, $0, 78
		addi $2, $0, 11
		syscall
		
		addi $2, $0, 10
		syscall
	