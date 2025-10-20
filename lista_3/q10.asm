#Faça um programa para calcular o MDC de dois números fornecidos pelo usuário, usando o algoritmo de Euclides (busque na Internet o funcionamento desse algoritmo).

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2 #a
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2 #b
	
	slt $10, $8, $9
	beq $10, 1, Passo1
	beq $8, $9, igual
	
	#Ordenação
	add $10, $0, $8
	add $8, $0, $9 #A vira B
	add $9, $0, $10 #B vira A
	
	Passo1:
	div $8, $9
	
	mfhi $12 #resto
	
	beq $12, 0, fim
	
	# $9 vai ser o dividendo e $12 o divisor
	# cada iteração o divisor vira dividendo e o resto divisor
	mdc:
	
	div $9, $12
	
	mfhi $10 # auxiliar
	beq $10, 0, fim
	
	add $9, $0, $12
	add $12, $0, $10

	j mdc
	
	fim:
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
	
	igual:
	
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall