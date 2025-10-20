#Faça um programa que leia dia, mês e ano e informe a data seguinte e a data anterior.

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
	
	dia:
	
	addi $11, $8, 1
	subi $12, $8, 1
	
	addi $14, $0, 31
	
	slt $13, $11, $14 #d.post é menor que 31? se >=31 então 0
	beq $13, 0, normalizardpos
	
	slt $14, $0, $12 #d.ant é maior que 0? se <=0, então
	beq $14, 0, normalizardant
	
	add $4, $0, $12
	addi $2, $0, 1 #dia anterior
	syscall
		
	addi $4, $0, 47
	addi $2, $0, 11 #barra /
	syscall
		
	add $4, $0, $9 # mes de anterior
	addi $2, $0, 1 #mes anterior
	syscall
		
	addi $4, $0, 47
	addi $2, $0, 11 #barra /
	syscall
		
	add $4, $0, $10 # ano de anterior
	addi $2, $0, 1 # ano anterior
	syscall
		
	addi $4, $0, 10
	addi $2, $0, 11 # \n
	syscall
		
	add $4, $0, $11
	addi $2, $0, 1 #dia post
	syscall
		
	addi $4, $0, 47
	addi $2, $0, 11 #barra /
	syscall
	
	add $4, $0, $9
	addi $2, $0, 1 #mes post
	syscall
	
	addi $4, $0, 47
	addi $2, $0, 11 #barra /
	syscall
	
	add $4, $0, $10
	addi $2, $0, 1 #ano post
	syscall
	
	addi $2, $0, 10
	syscall
		
	
	normalizardpos:
	
		subi $11, $11, 30 #normalizado
		addi $8, $9, 1 #mes ajustado
		
		add $4, $0, $12
		addi $2, $0, 1 #dia anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $9 # mes de anterior
		addi $2, $0, 1 #mes anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de anterior
		addi $2, $0, 1 # ano anterior
		syscall
		
		addi $4, $0, 10
		addi $2, $0, 11 # \n
		syscall
		
		add $4, $0, $11
		addi $2, $0, 1 #dia post
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		j mesPOST
	
	normalizardant:
		addi $15, $0, 30
		sub $12, $15, $12 #normalizado
		subi $8, $9, 1 #mes ajustado
		
		add $4, $0, $12
		addi $2, $0, 1 #data anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		j mesAnt
	
	mesAnt:
	
		slt $15, $0, $8
		beq $15, 0, subano 
		
		add $4, $0, $8 # mes de anterior
		addi $2, $0, 1 #mes anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de anterior
		addi $2, $0, 1 # ano anterior
		syscall
		
		addi $4, $0, 10
		addi $2, $0, 11 # \n
		syscall
		
		add $4, $0, $11
		addi $2, $0, 1 #dia posterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $9 # mes de posterior
		addi $2, $0, 1 #mes anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de posterior
		addi $2, $0, 1 # ano posterior
		syscall
		
		addi $2, $0, 10
		syscall
		
		
		
	
	mesPOST:
	
		addi $11, $0, 13
		slt $15, $8, $11
		beq $15, 0, addano
		
		add $4, $0, $8 # mes de post
		addi $2, $0, 1 #mes post
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de post
		addi $2, $0, 1 # ano post
		syscall
		
		addi $2, $0, 10
		syscall
		
	addano:
		addi $10, $10, 1 #ano ajustado
		subi $8, $8, 12 #mes ajustado
		
		add $4, $0, $8 # mes de post
		addi $2, $0, 1 #mes post
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de post
		addi $2, $0, 1 # ano post
		syscall
		
		addi $2, $0, 10
		syscall
		
		
		
	subano:
		addi $15, $0, 12
		subi $13, $10, 1
		sub $8, $15, $8 #mes certo
		
		add $4, $0, $8 # mes de anterior
		addi $2, $0, 1 #mes anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $13 # ano de anterior
		addi $2, $0, 1 # ano anterior
		syscall
		
		addi $4, $0, 10
		addi $2, $0, 11 # \n
		syscall
		
		add $4, $0, $11
		addi $2, $0, 1 #dia posterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $9 # mes de posterior
		addi $2, $0, 1 #mes anterior
		syscall
		
		addi $4, $0, 47
		addi $2, $0, 11 #barra /
		syscall
		
		add $4, $0, $10 # ano de posterior
		addi $2, $0, 1 # ano posterior
		syscall
		
		addi $2, $0, 10
		syscall
		
	
