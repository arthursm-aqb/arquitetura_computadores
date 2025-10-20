#Faça um programa para ler dois números e informe qual deles é o maior.

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	
	beq $10, 1, menor
	
	addu $4, $0, $8
	j print
		
	menor:
		addu $4, $0, $9
	print:
		addi $2, $0, 1
		syscall
		addi $2, $0, 10
		syscall