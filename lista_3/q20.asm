#*Um loop musical é um trecho de música que foi composto para repetir continuamente (ou seja, o trecho inicia novamente toda vez que chega ao final), sem que se note descontinuidade.
#Loops são muito usados na sonorização de jogos, especialmente jogos casuais pela internet. Loops podem ser digitalizados por exemplo utilizando PCM. PCM, do inglês Pulse Code Modulation, é uma técnica para representação de sinais analógicos, muito utilizada emáudio digital.
#Nessa técnica, a magnitude do sinal é amostrada a intervalos regulares de tempo, e os valores amostrados são armazenados em sequência. Para reproduzir a forma de onda amostrada, o processo é invertido (demodulação).
#Fernandinha trabalha para uma empresa que desenvolve jogos e compôs um bonito loopmusical, codificando-o em PCM. Analisando a forma de onda do seu loop em um software de edição de áudio, Fernandinha ficou curiosa ao notar a quantidade de“picos” existentes.
#Um pico em uma forma de onda é um valor de uma amostra que representa um máximo ou mínimo local, ou seja, um ponto de inflexão da forma de onda. A figura abaixo ilustra (a) um exemplo de forma de onda e (b) o loop formado com essa forma de onda, contendo 48 picos.

#Fernandinha é uma amiga muito querida e pediu sua ajuda para determinar quantos picos existem no seu loop musical.

#A entrada contém vários casos de teste. A primeira linha de um caso de teste contém um inteiro N, representando o número de amostras no loop musical de Fernandinha(2 ≤ N ≤ 10^4).
#A segunda linha contém N inteiros Hi, separados por espaços, representando a sequência de magnitudes das amostras (-10^4 ≤ Hi ≤ 10^4 para 1 ≤ i ≤ N, H1 ≠ HN e Hi ≠ Hi+1 para 1 ≤ i < N). 
#Note que H1 segue HN quando o loop é reproduzido. O final da entrada é indicado por uma linha que contém apenas o número zero.

#Para cada caso de teste da entrada seu programa deve imprimir uma única linha, contendo apenas um inteiro, o número de picos existentes no loop musical de Fernandinha.

.text
main:


loopP:

addi $2, $0, 5
syscall

beq $2, 0, fim # CONDIÇÃO DE FIM DO LOOP

add $15, $0, $0 # NUMEROS DE PICOS
addi $24, $0, 2 # INCREMENTADOR
add $25, $0, $2 # CHECK DO LOOP PRINCIPAL

addi $2, $0, 5
syscall

add $8, $0, $2 # H1

addi $2, $0, 5
syscall

add $9, $2, $0 # H2

add $10, $0, $8 #ANTERIOR
add $11, $0, $9 #ATUAL

loopSUB:

slt $14, $24, $25 #(I<N)?
beq $14, $0, fimLOOPSUB

addi $2, $0, 5
syscall

add $12, $0, $2 #PRÓXIMO

slt $13, $10, $11 #(ANTERIOR<ATUAL)?
slt $14, $12, $11 #(PROXIMO<ATUAL)?

beq $13, $0, checarmin1
beq $14, $0, checarmin1
j pico_soma1

checarmin1:

slt $13, $11, $10 #(ANTERIOR>ATUAL)?
slt $14, $11, $12 #(PROXIMO>ATUAL)?

beq $13, $0, pico_org1
beq $14, $0, pico_org1

pico_soma1:

addi $15, $15, 1 #PICO+1

pico_org1:

add $10, $0, $11 #ANTERIOR = ATUAL
add $11, $0, $12 #ATUAL = PROXIMO
addi $24, $24, 1 # INCREMENTADOR
j loopSUB

fimLOOPSUB:

slt $13, $10, $11 #(ANTERIOR<ATUAL)?
slt $14, $8, $11 # (ATUAL>H1)?
beq $13, $0, checarmin2
beq $14, $0, checarmin2
j pico_soma2

checarmin2:

slt $13, $11, $10 #(ANTERIOR>ATUAL)?
slt $14, $11, $8 #(H1>ATUAL)?

beq $13, $0, verifH1
beq $14, $0, verifH1
j pico_soma2

pico_soma2:

addi $15, $15, 1 #PICO+1

verifH1:

slt $13, $9, $8 #(H1>ATUAL)?
slt $14, $11, $8 #(H1>H2)?

beq $13, $0, checarminH1
beq $14, $0, checarminH1
j pico_soma3

checarminH1:

slt $13, $8, $9 #(H1<ATUAL)?
slt $14, $8, $11 #(H1<H2)?

beq $13, $0, imprimir
beq $14, $0, imprimir
j pico_soma3

pico_soma3:

addi $15, $15, 1 #PICO+1

imprimir:

add $4, $0, $15 # PICOS CONTADOS
addi $2, $0, 1
syscall

add $4, $0, 10 # Quebra de linha
addi $2, $0, 11 #'\n'
syscall

j loopP

fim:

addi $2, $0, 10
syscall
