#Faça um programa que leia dois números e escreva a relação de grandeza entre eles.
#Ex. 345 e 23 gera a saída 345>23. Ex.: 24 e 38 gera a saída 24<38. Ex.: 12 e 12 gera a
#saída 12=12

.text
main:
	addi $2, $0, 5
	syscall
	
	addu $8, $0, $2
	
	addi $2, $0, 5
	syscall
	
	addu $9, $0, $2
	
	slt $10, $8, $9
	
	beq $10, 1, AmB
	
	beq $8, $9, igual
	
	j BmA
	
	AmB:
		
		addi $11, $0, 60
		addu $4, $0, $8
		addi $2, $0, 1
		syscall
		
		addu $4, $0, $11
		addi $2, $0, 11
		syscall
		
		addu $4, $0, $9
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall
		
	igual:
		
		addi $11, $0, 61
		addu $4, $0, $8
		addi $2, $0, 1
		syscall
		
		addu $4, $0, $11
		addi $2, $0, 11
		syscall
		
		addu $4, $0, $9
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall
		
	BmA:
		
		addi $11, $0, 62
		addu $4, $0, $8
		addi $2, $0, 1
		syscall
		
		addu $4, $0, $11
		addi $2, $0, 11
		syscall
		
		addu $4, $0, $9
		addi $2, $0, 1
		syscall
		
		addi $2, $0, 10
		syscall
	
		
		
		
		
		
		
		
		
		
		
		