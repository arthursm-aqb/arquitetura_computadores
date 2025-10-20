#Faça um programa que leia números inteiros diferentes de zero e encontre o menor
#valor digitado e o maior valor digitado. O programa informa o maior e o menor, um em
#cada linha, quando o usuário digitar um 0.

.text
main:
	add $8, $0, $0 #testadormenor
	add $9, $0, $0 #testadormaior
	
	addi $2, $0, 5
	syscall
	
	beq $2, 0, fim
	
	add $8, $0, $2
	add $9, $0, $2
	
	lop:
	
	addi $2, $0, 5
	syscall
	
	beq $2, 0, fim
	
	slt $10, $2, $8
	beq $10, 1, menor
	
	slt $10, $9, $2
	beq $10, 1, maior
	
	j lop
	
	menor:
	
	add $8, $0, $2
	j lop
	
	maior:
	
	add $9, $0, $2
	j lop
	
	fim:
	
	addi $2, $0, 1
	add $4, $0, $9
	syscall
	
	addi $2, $0, 11
	addi $4, $0, 10
	syscall
	
	addi $2, $0, 1
	add $4, $0, $8
	syscall
	
	addi $2, $0, 10
	syscall