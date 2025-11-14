#Alunos: Arthur da Silva Mariz e Raquel Martiniano Felix Pires TADS 2025.2 IFRN Natal Campus Central

.data #0x10010000
.text
main:

	#$9 ponteiro ao endereço 0x1001
	#$8 contador do loop
	#$10 limite do loop
	
	lui $9, 0x1001
	
	addi $2, $0, 5
	syscall
	
	add $10, $0, $2
	add $8, $0, $0
	
	getNum:
	 
	beq $8, $10, sequencia
	
	addi $8, $8, 1
	
	addi $2, $0, 5
	syscall
	
	sw $2, 0($9)
	
	addi $9, $9, 4
	
	j getNum
	

	
	sequencia:
	
	# $8 contador do loop iN
	# $9 ponteiro ao endereco atual
	# $10 limite do loop iN
	# $11 contador do loop jN
	# $12 somaMaxima = -2147483648
	# $13 posicao inicial = 0
	# $14 posicao final = 0
	# $15 somaAtual = 0
	# $16 ponteiro auxiliar para valorAtual[j]
	# $17 recebe valor de $15
	# $18 auxiliar comparacao

	lui $9, 0x1001 # $9 ponteiro ao endereco atual
	add $8, $0, $0 # contador do loop iN = 0
	lui $12, 0x8000 # somaMaxima = -2147483648
	add $13, $0, $0 # $13 posicao inicial = 0
	add $14, $0, $0 # $14 posicao final = 0

	loopPSoma: # loop i<n

	beq $8, $10, somaN # Fim do loop e irá somar os numeros somados

	add $15, $0, $0 # somaAtual = 0
	add $16, $0, $9 # $16 recebe o valor de endereço atual de $9

	add $11, $0, $8

	loopSoma: # loop j<n

	beq $11, $10, iteraLP

	lw $17, 0($16) # $17 = vetor[j]
	add $15, $15, $17 # somaAtual+= $17
	slt $18, $12, $15 # somaAtual > somaMaxima?
	beq $18, 1, SOMAMAX # Se sim, vá para SOMAMAX

	addi $11, $11, 1 # j++
	addi $16, $16, 4 # Anda 4 bits no endereço de memória

	j loopSoma

	SOMAMAX:

	add $12, $0, $15 # somaMaxima = somaAtual
	add $13, $0, $8 # posinicial = i
	add $14, $0, $11 # posfinal = j
	addi $11, $11, 1 # j++
	addi $16, $16, 4 # Anda 4 bits no endereço de memória
	j loopSoma

	iteraLP: # i++

	addi $8, $8, 1 # i++
	addi $9, $9, 4  # Anda 4 bits no endereço de memória
	j loopPSoma

	somaN:

	# $19 numeros somados = (posicaofinal - posicaoincial) + 1

	sub $19, $14, $13
	addi $19, $19, 1 # tamanho da subsequência máxima

	imprimir:

	add $4, $0, $12
	addi $2, $0, 1
	syscall # Imprime a soma máxima 

	add $4, $0, 10
	addi $2, $0, 11
	syscall # Imprime quebra de linha

	add $4, $0, 112
	addi $2, $0, 11 # Imprime um 'p'
	syscall

	add $4, $0, $13
	addi $2, $0, 1
	syscall # Imprime a posicao inicial do primeiro elemento da sublista contígua de soma máxima

	add $4, $0, 10
	addi $2, $0, 11
	syscall # Imprime quebra de linha

	add $4, $0, $19
	addi $2, $0, 1
	syscall # Imprime o tamanho da sublista contígua de soma máxima

	fim:

	addi $2, $0, 10
	syscall


	   
	    
	      
