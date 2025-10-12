.text
main:

addi $2, $0, 5
syscall
addu $8, $0, $2 #a

addi $2, $0, 5
syscall
addu $9, $0, $2 #b

addi $2, $0, 5
syscall
addu $10, $0, $2 #c

#Se b=a ou b=c
beq $8, $9, NP
beq $9, $10, NP

#Se b>a e b<c
slt $11, $8, $9
slt $12, $9, $10
and $11, $11, $12
beq $11, 1, NP

#Se b<a e b>c
slt $11, $9, $8
slt $12, $10, $9
and $11, $11, $12
beq $11, 1, NP

#Imprime P

addi $4, $0, 80
addi $2, $0, 11
syscall

#Verifica se é +

slt $11, $8, $9 #b>a
slt $12, $10, $9 #b>c
and $11, $11, $12 
beq $11, 1, pos

j neg

pos:

addi $4, $0, 43
addi $2, $0, 11
syscall
addi $2, $0, 10
syscall

neg:

addi $4, $0, 45
addi $2, $0, 11
syscall
addi $2, $0, 10
syscall

NP:

addi $4, $0, 78
addi $2, $0, 11
syscall
addi $2, $0, 10
syscall