#Faça um programa que leia as duas notas (entre 0 e 100) e as faltas de um aluno em
#uma disciplina. A média do aluno é calculada ponderadamente, com pesos 2 e 3. A
#cada 5 faltas o aluno perde 10 pontos. O programa deve informar a média, a
#penalidade e a média final, uma em cada linha.

.text
main:

addi $2, $0, 5
syscall
addu $8, $0, $2 #nota1

addi $2, $0, 5
syscall
addu $9, $0, $2 #nota2

addi $2, $0, 5
syscall
addu $10, $0, $2 #faltas

mul $11, $8, 2
mul $12, $9, 3
addi $13, $0, 5
addu $11, $11, $12
div $11, $13
mflo $11 #média ponderada

addu $4, $0, $11 #média ponderada
addi $2, $0, 1
syscall
addi $2, $0, 11
addi $4, $0, 10
syscall

div $10, $13
mflo $12
mul $12, $12, 10 #penalidade
add $4, $0, $12
addi $2, $0, 1
syscall
addi $2, $0, 11
addi $4, $0, 10
syscall

#mediafinal
subu $13, $11, $12
add $4, $0, $13
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall
