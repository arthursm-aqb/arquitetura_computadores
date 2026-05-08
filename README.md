<div align="center">

# Tic-Tac-Toe — Assembly MIPS

![Language](https://img.shields.io/badge/Linguagem-Assembly%20MIPS-blue?style=for-the-badge)
![Platform](https://img.shields.io/badge/Plataforma-MARS%20%2F%20SPIM-orange?style=for-the-badge)
![Discipline](https://img.shields.io/badge/Disciplina-Arquitetura%20de%20Computadores-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-brightgreen?style=for-the-badge)

> Jogo da Velha completo implementado em linguagem Assembly MIPS, com interface visual animada, músicas interativas, modo multiplayer e modo contra bot — tudo gerenciado diretamente sobre o hardware através de syscalls.

</div>

---

## Sobre o Projeto

Este projeto foi desenvolvido para a disciplina de **Arquitetura de Computadores** com início em novembro de 2025. O objetivo foi criar uma aplicação interativa e totalmente funcional utilizando apenas **Assembly MIPS**, explorando conceitos fundamentais como manipulação de memória, controle de fluxo, entrada/saída de baixo nível e renderização direta em display bitmap.

O jogo roda sobre o simulador MIPS (recomendado: **MARS**) e utiliza o display bitmap e o sistema de som MIDI nativo para oferecer uma experiência audiovisual completa.

---

## Funcionalidades

| Funcionalidade | Descrição |
|---|---|
| Jogador vs Jogador | Dois jogadores na mesma máquina, alternando turnos pelo teclado |
| Jogador vs Bot | Um jogador enfrenta um oponente controlado por IA simples |
| Sorteio de turno | Animação de sorteio (copo caindo) para definir quem começa |
| Interface visual | Tela renderizada pixel a pixel no display bitmap do simulador |
| Música de fundo | Trilha sonora ambiente tocada durante a partida |
| Efeitos sonoros | Sons distintos para seleção, vitória, empate e jogada inválida |
| Detecção de vitória | Verificação completa de linhas, colunas e diagonais com marcação visual |
| Animação da grade | As linhas da grade mudam de cor dinamicamente a cada turno |
| Tela de resultado | Telas dedicadas para vitória do Jogador 1, Jogador 2 ou empate |

---

## Requisitos

- **Simulador MIPS:** [MARS](https://computerscience.missouristate.edu/mars-mips-simulator.htm) — versão 4.5 ou superior
- Suporte a **display bitmap** habilitado no simulador
- Suporte a **Keyboard and Display MMIO Simulator** (para entrada de teclado)
- Suporte a **MIDI (som)** habilitado no MARS

---

## Como Executar

1. Abra o MARS e carregue o arquivo `Tic_Tac_Toe.asm`
2. Habilite as ferramentas necessárias em `Tools`:
   - `Bitmap Display` — configure para **512×256 pixels**, unidade de display = 4 bytes
   - `Keyboard and Display MMIO Simulator`
3. Conecte todas as ferramentas ao MIPS clicando em **"Connect to MIPS"**
4. Monte e execute o programa

---

## Controles

| Tecla | Ação |
|---|---|
| `1` | Seleciona modo Jogador vs Jogador na tela inicial |
| `2` | Seleciona modo Jogador vs Bot na tela inicial |
| `1` – `9` | Durante a partida, seleciona a posição do tabuleiro correspondente |

### Mapeamento do Tabuleiro

```
┌───┬───┬───┐
│ 1 │ 2 │ 3 │   ← Linha superior
├───┼───┼───┤
│ 4 │ 5 │ 6 │   ← Linha do meio
├───┼───┼───┤
│ 7 │ 8 │ 9 │   ← Linha inferior
└───┴───┴───┘
```

> Tentar jogar em uma posição já ocupada emite um som de erro e não altera o tabuleiro.

---

## Estrutura do Código

O arquivo `Tic_Tac_Toe.asm` (~2089 linhas) está organizado nas seguintes seções:

### Renderização Visual (`.text`)

| Rótulo | Descrição |
|---|---|
| `main` | Ponto de entrada; desenha o contorno e o fundo do quadro |
| `loop_contorno_superior_inferior` | Renderiza as bordas horizontais do frame |
| `loop_contorno_lateral` | Renderiza as bordas verticais do frame |
| `desenha_fundo_quadro` | Preenche o fundo interno do quadro |
| `Titulo_Inicial` | Exibe o título do jogo na tela de abertura |
| `Nomes` | Exibe os créditos dos autores |
| `qualopcao` | Tela de seleção de modo de jogo |
| `sorteiooo` / `Copo_caiu` | Animação de sorteio do primeiro jogador |
| `jogador_1` / `jogador_2` | Exibe qual jogador começa |
| `LH_grade` / `LV_grade` | Desenha as linhas horizontais e verticais da grade 3×3 |

### Lógica do Jogo

| Rótulo | Descrição |
|---|---|
| `loop_PRINCIPAL` | Loop central do jogo; alterna entre jogadores |
| `Ler_Teclado` | Captura a entrada do jogador via MMIO |
| `Bot_joga` | Seleciona aleatoriamente uma posição disponível para o bot |
| `Pos_1` a `Pos_9` | Tratadores de jogada para cada célula do tabuleiro |
| `Xis_1` a `Xis_9` | Desenha o símbolo X na posição correspondente |
| `Ohhh_1` a `Ohhh_9` | Desenha o símbolo O na posição correspondente |
| `Verifica_Jogo` | Chama o verificador após cada jogada |
| `VERIFICADOR` | Verifica todas as condições de vitória (linhas, colunas, diagonais) |
| `Vitoria_Jog1` / `Vitoria_Jog2` | Lógica pós-vitória com destaque da linha vencedora |
| `Empate` | Trata o empate quando todas as casas estão preenchidas |
| `Som_erro` | Emite som de erro para jogada inválida |

### Funções Auxiliares

| Rótulo | Descrição |
|---|---|
| `muda_cor_grade` | Gera cor aleatória e redesenha a grade a cada turno |
| `limpa_fundo_quadro` | Reseta o fundo interno do quadro |
| `Desenha_X_FUNC` | Renderiza o símbolo X em uma coordenada dada |
| `Desenha_O_FUNC` | Renderiza o símbolo O em uma coordenada dada |
| `HORIZONTALMENOR` | Desenha traço horizontal para indicar combinação vencedora |
| `VERTICALMENOR` | Desenha traço vertical para indicar combinação vencedora |
| `DLRMENOR` / `DRLMENOR` | Desenha traço diagonal para indicar combinação vencedora |

### Músicas e Efeitos Sonoros

| Rótulo | Instrumento | Momento |
|---|---|---|
| `toca_inicial` | Piano | Tela de abertura / loading |
| `tocar_trilha_sonora` | Marimba suave | Fundo durante a partida |
| `toca_sorteio` | Bateria | Animação de sorteio |
| `toca_jogador_sorteado` | Bateria | Revelação do jogador sorteado |
| `toca_selecionado_O_X` | Vibrafone | Confirmação de jogada |
| `toca_vitoria` | Metais / Fanfarra | Vitória de um jogador |
| `toca_empate` | Cordas | Resultado de empate |

### Dados (`.data`)

| Rótulo | Descrição |
|---|---|
| `modo_de_jogo` | Armazena `0` (JxJ) ou `1` (JxB) |
| `contador_musica` | Controla o ciclo da trilha sonora ambiente |
| `Estado_Atual` | Array com o estado das 9 células do tabuleiro (0=vazio, 1=X, 2=O) |
| `Jogadores` | Ponteiro para o jogador atual |
| `titulo`, `nomes` | Sprites da tela de abertura |
| `copo_pe`, `copo_caiu` | Sprites da animação de sorteio |
| `qual_opcao` | Sprite da tela de seleção de modo |
| `Tela_J1V`, `Tela_J2V` | Sprites das telas de vitória |
| `Tela_Empate` | Sprite da tela de empate |
| `jogador1`, `jogador2` | Sprites de anúncio do jogador sorteado |

---

## Detalhes Técnicos

- **Arquitetura:** MIPS32
- **Display:** Bitmap 512×256 pixels com mapeamento direto na memória (`0x10010000`)
- **Entrada:** MMIO Keyboard Simulator (`0xFFFF0000`)
- **Som:** Syscall 31 (MIDI note on) e 32 (sleep) para composição musical em tempo real
- **Bot:** Geração de posição aleatória via syscall 42, com rejeição de casas ocupadas
- **Estado do tabuleiro:** Array de 9 words na memória de dados
- **Detecção de vitória:** Verificação sequencial de 8 combinações (3 linhas + 3 colunas + 2 diagonais) com retorno do identificador da combinação para desenho do traço vencedor

---

## Paleta de Cores

| Elemento | Cor (RGB) |
|---|---|
| Contorno do quadro | `#CEB695` |
| Fundo do quadro | `#0E3729` |
| Grade | Cor aleatória animada |
| Símbolo X | `#F00303` (vermelho) |
| Símbolo O | `#00B7EF` (azul claro) |
| Traço vencedor | `#FFFFFF` (branco) |

---

## Autores

Arthur da Silva Mariz
Raquel Martiniano Félix
Arthur Fontenele

Desenvolvido como projeto da disciplina de **Arquitetura de Computadores** — 2025.2.

---

## Licença

Este projeto foi desenvolvido para fins acadêmicos. Sinta-se livre para estudar, adaptar e utilizar como referência educacional.

