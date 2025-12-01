.text
main:
    lui   $8, 0x1001        
    ori   $9, $0, 0x606060             # $9 = 0x0000FF00



    ori   $10, $0, 131072 #tela toda
    
loop_grama:  #background
    beq   $10, $0, comeca_pista
    sw    $9, 0($8)                   # pinta de verde
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop_grama
    
comeca_pista:
    lui   $8, 0x1001    
                 

    # --- Linha 7 (barra horizontal curta) ---  # entrada
    addi  $8, $8, 3072                
    lui   $9, 0x00FF
    ori   $9, $9, 0xFFA500              # laranja
    ori   $10, $0, 11
    
loop7:
    beq   $10, $0, prepara_linha13
    sw    $9, 0($8)
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop7

prepara_linha13:
    lui   $8, 0x1001
    addi  $8, $8, 6144        # linha 12 (11*512 = 5632)
    lui   $9, 0x00FF          # recarrega cor amarela
    ori   $9, $9, 0xFFA500
    ori   $10, $0, 11         

loop12:
    beq   $10, $0, primeira_curva_direita
    sw    $9, 0($8)
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop12

#bordas pista
primeira_curva_direita:
    addi  $8, $8, -4
    ori   $10, $0, 45         # 46 quadradinhos para baixo

primeira_decida:
    beq   $10, $0, primeira_curva_esquerda
    addi  $8, $8, 512         # desce 1 linha (mesma coluna!) → +512 bytes
    sw    $9, 0($8)           # pinta o quadradinho da coluna 10
    addi  $10, $10, -1
    j     primeira_decida

primeira_curva_esquerda:

    addi $8, $8, -23552  # sobe 46 linhas → volta pra linha 12
    addi $8, $8, -2560      # sobe +5 linhas → vai pra linha 7, coluna 10
                               

    addi $8, $8, -512          # sobe 1 linha
    addi $8, $8, 4             # vai 1 coluna à direita
    sw   $9, 0($8)             # pinta coluna L, linha 6

    # Pixel 2: linha 5, coluna 12 (M)
    addi $8, $8, -512          # sobe mais 1 linha
    addi $8, $8, 4             # vai mais 1 coluna à direita
    sw   $9, 0($8)
               
addi $10,$0,105       # mover 105 pixels p/ direita

prepara_segunda_curva_direita:
    beq  $10,$0,segunda_curva_direita
    sw   $9, 0($8)
    addi $8,$8,4       # direita
    addi $10,$10,-1
    j    prepara_segunda_curva_direita
    
segunda_curva_direita:
    lui $8, 0x1001
    addi  $8, $8, 2560           # 5 × 512 = 2560 → vai pra linha 6
    addi  $8, $8, 468            # 117 × 4 = 468 → coluna DM (117)
    sw    $9, 0($8)              # pinta linha 6, coluna DM

    addi  $8, $8, 512            # desce pra linha 7
    addi  $8, $8, 4              # avança 1 quadradinho → coluna DN (118)
    sw    $9, 0($8)
    
ori   $10, $0, 50         # 46 quadradinhos para baixo

segunda_decida:
    beq   $10, $0, curva_diagonal3
    addi  $8, $8, 512         # desce 1 linha (mesma coluna!) → +512 bytes
    sw    $9, 0($8)           # pinta o quadradinho da coluna 10
    addi  $10, $10, -1
    j     segunda_decida
              
curva_diagonal3:
# 1) Linha 58 → coluna DN (118)
    addi  $8,$8,29184            # 57×512 = 29184 → linha 58
    addi  $8,$8,472              # 118×4  = 472
    addi  $8,$8,29184            # já somei a linha antes, então só +472
    # forma correta e segura:
    lui   $8,0x1001
    addi  $8,$8,29184            # linha 58
    addi  $8,$8,472              # coluna 118 (DN)
    sw    $9,0($8)

    # 2) Linha 59 → coluna DM (117)
    addi  $8,$8,512              # desce 1 linha
    addi  $8,$8,-4               # volta 1 coluna → 117
    sw    $9,0($8)

    # 3) Linha 60 → coluna DL (116)
    addi  $8,$8,512              # desce mais 1 linha
    addi  $8,$8,-4               # volta mais 1 coluna → 116
    sw    $9,0($8)

addi $10,$0,105   # enrola para esquerda

left:
    beq  $10,$0,curva_diagonal4
    sw   $9,0($8)
    addi $8,$8,-4      # esquerda
    addi $10,$10,-1
    j    left
    
curva_diagonal4:
    #linha 59 coluna L (12)
    lui   $8, 0x1001
    addi  $8, $8, 29696           # 58×512 = 29696 → vai pra linha 59
    addi  $8, $8, 44              # 12×4 = 48 → coluna L (12)
    sw    $9, 0($8)               # pinta linha 59, coluna L
    
comeca_borda_centro:
    lui   $8, 0x1001
    addi  $8, $8, 6144           # 12×512 = 6144 → linha 13 do Excel
    addi  $8, $8, 80             # 20×4 = 80 → coluna U (índice 20)
    sw    $9, 0($8)       
    

    ori   $10, $0, 87            # pinta mais 87 à direita (total 88 incluindo o U)
    
loop_reto_ate_primeira_curva_direita:
    beq   $10, $0, curvas_superiores_borda_central
    addi  $8, $8, 4              # avança 1 quadradinho à direita
    sw    $9, 0($8)              # pinta amarelo
    addi  $10, $10, -1
    j     loop_reto_ate_primeira_curva_direita
    
curvas_superiores_borda_central: 
    lui   $8, 0x1001
    addi  $8, $8, 6732
    sw    $9, 0($8)               # T14

    lui   $8, 0x1001
    addi  $8, $8, 7088          
    sw    $9, 0($8)               # DE14
     
addi $8,$8,4 # completando curva direita
ori   $10, $0, 35         # 46 quadradinhos para baixo

primeira_decida_central:
    beq   $10, $0, curvas_inferiores_borda_central_direita
    addi  $8, $8, 512         # desce 1 linha (mesma coluna!) → +512 bytes
    sw    $9, 0($8)           # pinta o quadradinho da coluna 10
    addi  $10, $10, -1
    j     primeira_decida_central

curvas_inferiores_borda_central_direita:
    addi  $8,$8,512
    addi  $8, $8, -4
    sw    $9,0($8)
    addi  $8,$8,512
    addi  $8,$8,-4
    sw    $9, 0($8)    
     
addi $10,$0,88

left_borda_central:
    beq  $10,$0,curvas_inferiores_borda_esquerda
    sw   $9,0($8)
    addi $8,$8,-4      # esquerda
    addi $10,$10,-1
    j    left_borda_central       
	
curvas_inferiores_borda_esquerda:
    addi $8,$8, -512
    addi $8,$8, 0
    sw $9,0($8)
    addi $8,$8, -512
    addi $8,$8, -4
    sw $9,0($8)
    
addi  $8, $8, -512            # sobe para a linha 49 (primeiro pixel a pintar)
ori   $10, $0, 34             # 49 até 15 inclusive = 35 pixels

completa_ultima_curva:
    beq   $10, $0, start_carro
    sw    $9, 0($8)   
    addi  $8, $8, -512
    addi  $10, $10, -1
    j    completa_ultima_curva
    
#começa carro
start_carro:
    lui   $19, 0x1001                 # $19 = base do carro (vai ser nosso "cursor")

    # Posição inicial do carro (linha 8 a 11, colunas centrais)
    addi  $19, $19, 4608              # começa na linha 9 (4608 = 9×512)

    # Cores fixas
    ori   $20, $0, 0x00FF0000         # cor do carro
    ori   $21, $0, 0x00000000         # Preto das rodas
    ori   $22, $0, 0xFFA500         # Amarelo da borda
    ori   $23, $0, 0x606060          # Verde da grama

    # Linha 9 (4 pixels vermelhos)
    sw    $20, 0($19)
    sw    $20, 4($19)
    sw    $20, 8($19)
    sw    $20, 12($19)

    # Rodas 
    sw    $21, -512($19)     # linha 8
    sw    $21, -500($19)     # linha 8 (+12 bytes)
    sw    $21, 512($19)      # linha 10
    sw    $21, 524($19)      # linha 10 (+12 bytes)

loop_carro:
    # === Lê teclado ===
    lui   $17, 0xFFFF
    lw    $18, 0($17)
    beq   $18, $0, loop_carro
    lw    $25, 4($17)                  # tecla pressionada
    # SOM DE ACELERAÇÃO
     addi  $2, $0, 31          # MIDI note
     addi  $4, $0, 38          # pitch: 38 = Lá bem grave (perfeito pra motor)
     addi  $5, $0, 180         # duração curta = som contínuo e agressivo0
     addi  $6, $0, 110         # volume alto0
     addi  $7, $0, 30          # instrumento: 30 = Distortion Guitar (É ESSE O SEGREDO, PORRA!!!)
     syscall
   

    # === Apaga o carro antigo 
    sw    $23, 0($19)
    sw    $23, 4($19)
    sw    $23, 8($19)
    sw    $23, 12($19)
    sw    $23, -512($19)
    sw    $23, 512($19)
    sw    $23, 524($19)
    sw    $23, -500($19)

    # === Mover a base $19 conforme tecla ===
    addi  $24, $0, 'w'
    beq   $25, $24, move_cima
    addi  $24, $0, 's'
    beq   $25, $24, move_baixo
    addi  $24, $0, 'a'
    beq   $25, $24, move_esq
    addi  $24, $0, 'd'
    beq   $25, $24, move_dir
    j     redesenha

move_cima:
    addi  $19, $19, -512
    j     verifica_colisao
move_baixo:
    addi  $19, $19, 512
    j     verifica_colisao
move_esq:
    addi  $19, $19, -4
    j     verifica_colisao
move_dir:
    addi  $19, $19, 4

verifica_colisao:
    # Verifica se qualquer parte do carro está sobre amarelo
    lw    $24, 0($19)
    beq   $24, $22, morreu
    lw    $24, 4($19)
    beq   $24, $22, morreu
    lw    $24, 8($19)
    beq   $24, $22, morreu
    lw    $24, 12($19)
    beq   $24, $22, morreu
    lw    $24, -512($19)
    beq   $24, $22, morreu
    lw    $24, 512($19)
    beq   $24, $22, morreu
    lw    $24, 524($19)
    beq   $24, $22, morreu
    lw    $24, -500($19)
    beq   $24, $22, morreu

redesenha:
    # === REDESENHA O CARRO NA NOVA POSIÇÃO ===
    sw    $20, 0($19)      # 4 vermelhos na linha principal
    sw    $20, 4($19)
    sw    $20, 8($19)
    sw    $20, 12($19)

    sw    $21, -512($19)   # rodas de cima
    sw    $21, -500($19)
    sw    $21, 512($19)    # rodas de baixo
    sw    $21, 524($19)

    # Delay suave (pra não ficar piscando louco)
    addi  $25, $0, 11000
delay:
    addi  $25, $25, -1
    bne   $25, $0, delay

    j     loop_carro

morreu:
    # BATIDA + EXPLOSÃO
    addi $2,$0,31
    addi $4,$0,36
    addi $5,$0,800
    addi $6,$0,127
    addi $7,$0,115
    syscall
    addi $2,$0,10
    syscall
    addi  $2, $0, 10
    syscall        # fecha o programa
