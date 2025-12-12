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

    # === OBSTÁCULO MÓVEL (vai e volta na linha 8) ===
    lui $12, 0x1001
    addi $12, $12, 3584         # linha 8
    addi $12, $12, 48           # começa na coluna 12 (L)
    ori $13, $0, 0x150704       # cor
    ori $14, $0, 1              # 1 = indo pra direita, 0 = esquerda
    sw $13, 0($12)              # desenha inicial
    
    # === OBSTÁCULO MÓVEL (vai e volta na linha 53) ===
    lui $26, 0x1001
    addi $26, $26, 27136      # linha 53 → 53 * 512 = 27136
    addi $26, $26, 48         # coluna 12 (L)
    ori  $27, $0, 1           # direção: 1 = direita
	sw   $13, 0($26)          # desenha inicial
	
loop_carro:
    # 1) APAGA OBSTÁCULO ANTIGO
    sw $23, 0($12)

    # 2) MOVE O OBSTÁCULO
    beq $14, $0, indo_esquerda

indo_direita:
    addi $12, $12, 4
    # Checa se passou da coluna 116 (LM)
    lui $8, 0x1001
    addi $8, $8, 3584
    addi $8, $8, 464            # 116*4 = 464
    bge $12, $8, inverte_pra_esquerda   # se passou → vira esquerda
    j desenha_obstaculo

indo_esquerda:
    addi $12, $12, -4
    # Checa se passou da coluna 12 (L)
    lui $8, 0x1001
    addi $8, $8, 3584
    addi $8, $8, 48             # 12*4 = 48
    ble $12, $8, inverte_pra_direita    # se passou → vira direita
    j desenha_obstaculo

inverte_pra_esquerda:
    add $14, $0, $0             # direção = esquerda
    j desenha_obstaculo

inverte_pra_direita:
    addi $14, $0, 1             # direção = direita

desenha_obstaculo:
    sw $13, 0($12)              # desenha na nova posição
    
# ===== OBSTÁCULO DA LINHA 53 =====

# apaga antigo
sw $23, 0($26)

# movimento
beq $27, $0, obs53_esq

obs53_dir:
    addi $26, $26, 4
    lui $8, 0x1001
    addi $8, $8, 27136      # linha 53
    addi $8, $8, 464        # coluna 116 * 4
    bge $26, $8, obs53_inverte_esq
    j obs53_desenha

obs53_esq:
    addi $26, $26, -4
    lui $8, 0x1001
    addi $8, $8, 27136
    addi $8, $8, 48         # coluna 12
    ble $26, $8, obs53_inverte_dir
    j obs53_desenha

obs53_inverte_esq:
    ori $27, $0, 0
    j obs53_desenha

obs53_inverte_dir:
    ori $27, $0, 1

obs53_desenha:
    sw $13, 0($26)


    # 3) CHECA COLISÃO COM OBSTÁCULO LINHA 8 PRIMEIRO (ANTES DE MOVER O CARRO!)
    lw $24, 0($19)
    beq $24, $13, morreu
    lw $24, 4($19)
    beq $24, $13, morreu
    lw $24, 8($19)
    beq $24, $13, morreu
    lw $24, 12($19)
    beq $24, $13, morreu
    lw $24, -512($19)
    beq $24, $13, morreu
    lw $24, -500($19)
    beq $24, $13, morreu
    lw $24, 512($19)
    beq $24, $13, morreu
    lw $24, 524($19)
    beq $24, $13, morreu
    
    # colisão obstáculo linha 53
	lw $24, 0($19)
	beq $24, $13, morreu
	lw $24, 4($19)
	beq $24, $13, morreu
	lw $24, 8($19)
	beq $24, $13, morreu
	lw $24, 12($19)
	beq $24, $13, morreu
	lw $24, -512($19)
	beq $24, $13, morreu
	lw $24, -500($19)
	beq $24, $13, morreu
	lw $24, 512($19)
	beq $24, $13, morreu
	lw $24, 524($19)
	beq $24, $13, morreu


    # 4) INPUT DO TECLADO
    lui $17, 0xFFFF
    lw $18, 0($17)
    beq $18, $0, sem_tecla
    lw $25, 4($17)

    # Som do motor
    addi $2, $0, 31
    addi $4, $0, 38
    addi $5, $0, 100
    addi $6, $0, 100
    addi $7, $0, 30
    syscall

sem_tecla:
    # 5) APAGA CARRO ANTIGO
    sw $23, 0($19)
    sw $23, 4($19)
    sw $23, 8($19)
    sw $23, 12($19)
    sw $23, -512($19)
    sw $23, -500($19)
    sw $23, 512($19)
    sw $23, 524($19)

    # Movimento do carro
    beq $25, 'w', move_cima
    beq $25, 's', move_baixo
    beq $25, 'a', move_esq
    beq $25, 'd', move_dir
    j pula_movimento

move_cima:  addi $19, $19, -512
j pula_movimento
move_baixo: addi $19, $19, 512
j pula_movimento
move_esq:   addi $19, $19, -4
j pula_movimento
move_dir:   addi $19, $19, 4

pula_movimento:
    # 6) CHECA COLISÃO COM A PISTA (depois do movimento)
    lw $24, 0($19)
    beq $24, $22, morreu
    lw $24, 4($19)
    beq $24, $22, morreu
    lw $24, 8($19)
    beq $24, $22, morreu
    lw $24, 12($19)
    beq $24, $22, morreu
    lw $24, -512($19)
    beq $24, $22, morreu
    lw $24, -500($19)
    beq $24, $22, morreu
    lw $24, 512($19)
    beq $24, $22, morreu
    lw $24, 524($19)
    beq $24, $22, morreu

    # 7) REDESENHA O CARRO
    sw $20, 0($19)
    sw $20, 4($19)
    sw $20, 8($19)
    sw $20, 12($19)
    sw $21, -512($19)
    sw $21, -500($19)
    sw $21, 512($19)
    sw $21, 524($19)

    # Delay (ajusta velocidade do obstáculo)
    addi $25, $0, 15000        # 8000 = rápido pra caramba, 20000 = tranquilo
delay_loop:
    addi $25, $25, -1
    bne $25, $0, delay_loop

    j loop_carro

morreu:
    # Explosão sonora
    addi $2, $0, 31
    addi $4, $0, 36
    addi $5, $0, 1200
    addi $6, $0, 127
    addi $7, $0, 115
    syscall

    addi $2, $0, 10
    syscall            # fecha o programa
