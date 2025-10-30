#*Depois de séculos de escaramuças entre os quatro povos habitantes da Nlogônia, e de dezenas de anos de negociações envolvendo diplomatas, políticos e as forças armadas 
#de todas as partes interessadas, com a intermediação da ONU, OTAN, G7 e SBC, foi finalmente decidida e aceita por todos a maneira de dividir o país em quatro territórios independentes.
#Ficou decidido que um ponto, denominado ponto divisor, cujas coordenadas foram estabelecidas nas negociações, definiria a divisão do país, da seguinte maneira.
#Duas linhas, ambas contendo o ponto divisor, uma na direção norte-sul e uma na direção leste-oeste, seriam traçadas no mapa, dividindo o país em quatro novos países.
#Iniciando no quadrante mais ao norte e mais ao oeste, em sentido horário, os novos países seriam chamados de Nlogônia do Noroeste, Nlogônia do Nordeste, Nlogônia do Sudeste e Nlogônia do Sudoeste.

# A ONU determinou que fosse disponibilizada uma página na Internet para que os habitantes pudessem consultar em qual dos novos países suas residências estão, e você foi contratado para ajudar a implementar o sistema.

#A entrada contém vários casos de teste. A primeira linha de um caso de teste contém um inteiro K indicando o número de consultas que serão realizadas (0 < K ≤ 10^3).

#A segunda linha de um caso de teste contém dois números inteiros N e M representando as coordenadas do ponto divisor (-104 < N, M < 10^4).
#Cada uma das K linhas seguintes contém dois inteiros X e Y representando as coordenadas de uma residência (-104 ≤ X, Y ≤ 10^4).
#Em todas as coordenadas dadas, o primeiro valor corresponde à direção leste-oeste, e o segundo valor corresponde à direção norte-sul. O final da entrada é indicado por uma linha que contém apenas o número zero.

#Para cada caso de teste da entrada seu programa deve imprimir uma linha contendo a palavra:

#• DV se a residência encontra-se em cima de uma das linhas divisórias (norte-sul ou leste-oeste);
#• NO se a residência encontra-se na Nlogônia do Noroeste;
#• NE se a residência encontra-se na Nlogônia do Nordeste;
#• SE se a residência encontra-se na Nlogônia do Sudeste;
#• SO se a residência encontra-se na Nlogônia do Sudoeste.

.text
main:


lop:
addi $2, $0, 5
syscall

beq $2, 0, fim

add $10, $0, $2 #LOOP CASOS DE TESTE

addi $2, $0, 5
syscall

add $8, $0, $2 #X PD

addi $2, $0, 5
syscall

add $9, $0, $2 #Y PD

add $24, $0, $0
add $25, $0, $0

loopint:

beq $10, $25, lop #verifica o loop !!$10

addi $2, $0, 5
syscall

add $11, $0, $2 #X 

addi $2, $0, 5
syscall

add $12, $0, $2 #Y 

sub $13, $11, $8 #X- XPD
sub $14, $12, $9 #Y-YPD

slt $15, $13, $24
beq $13, 0, NORTE_SUL_LESTE_OESTE
beq $14, 0, NORTE_SUL_LESTE_OESTE
beq $15, 1, NOROESTE_SUDOESTE
j NORDESTE_SUDESTE
 
fim:

addi $2, $0, 10
syscall


NORTE_SUL_LESTE_OESTE:

addi $2, $0, 11
addi $4, $0, 68
syscall
addi $4, $0, 86
syscall
addi $4, $0, 10
syscall

addi $25, $25, 1

j loopint

NOROESTE_SUDOESTE:

slt $15, $14, $24
beq $15, 1, SUDOESTE
j NOROESTE
	
NORDESTE_SUDESTE:

slt $15, $14, $24
beq $15, 1, SUDESTE
j NORDESTE	

SUDOESTE:

addi $2, $0, 11
addi $4, $0, 83
syscall
addi $4, $0, 79
syscall
addi $4, $0, 10
syscall

addi $25, $25, 1

j loopint

NOROESTE:

addi $2, $0, 11
addi $4, $0, 78
syscall
addi $4, $0, 79
syscall
addi $4, $0, 10
syscall

addi $25, $25, 1

j loopint

SUDESTE:

addi $2, $0, 11
addi $4, $0, 83
syscall
addi $4, $0, 69
syscall
addi $4, $0, 10
syscall

addi $25, $25, 1

j loopint

NORDESTE:

addi $2, $0, 11
addi $4, $0, 78
syscall
addi $4, $0, 69
syscall
addi $4, $0, 10
syscall

addi $25, $25, 1

j loopint
