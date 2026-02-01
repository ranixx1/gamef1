.text
main:
    lui   $8, 0x1001        
    ori   $9, $0, 0x00FF              # $9 = 0x0000FF00
    sll   $9, $9, 8                   # desloca pra 0x00FF0000,


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
    ori   $9, $9, 0xFF00              # amarelo
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
    ori   $9, $9, 0xFF00
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

    
start_carro:
    lui $19, 0x1001
    addi $19, $19, 4608

    ori $20, $0, 0xFF0000
    ori $21, $0, 0x000000
    ori $22, $0, 0xFFFF00
    ori $23, $0, 0x00FF00

    sw $20, 0($19)
    sw $20, 4($19)
    sw $20, 8($19)
    sw $20, 12($19)
    sw $21, -512($19)
    sw $21, -500($19)
    sw $21, 512($19)
    sw $21, 524($19)

    lui $12, 0x1001
    addi $12, $12, 3584
    addi $12, $12, 48
    ori $13, $0, 0xFFFFFF
    ori $14, $0, 1
    sw $13, 0($12)

    lui $30, 0x1001
    addi $30, $30, 27136
    addi $30, $30, 80
    ori $31, $0, 0xAAAAFF
    ori $29, $0, 1

loop_carro:
    sw $23, 0($12)

    beq $14, $0, indo_esquerda
    addi $12, $12, 4
    lui $15, 0x1001
    addi $15, $15, 3584
    addi $15, $15, 464
    blt $12, $15, desenha_obs
    add $14, $0, $0
    j desenha_obs

indo_esquerda:
    addi $12, $12, -4
    lui $15, 0x1001
    addi $15, $15, 3584
    addi $15, $15, 48
    bgt $12, $15, desenha_obs
    addi $14, $0, 1

desenha_obs:
    sw $13, 0($12)

    sw $23, -2560($30)
    sw $23, -2048($30)
    sw $23, -1536($30)
    sw $23, -1024($30)
    sw $23, -512($30)
    sw $23, 0($30)
    sw $23, 512($30)
    sw $23, 1024($30)
    sw $23, 1536($30)
    sw $23, 2048($30)
    sw $23, 2560($30)

    beq $29, $0, porta_sobe
    addi $30, $30, 512
    lui $15, 0x1001
    addi $15, $15, 30208
    addi $15, $15, 80
    blt $30, $15, desenha_porta
    add $29, $0, $0
    j desenha_porta

porta_sobe:
    addi $30, $30, -512
    lui $15, 0x1001
    addi $15, $15, 27136
    addi $15, $15, 80
    bgt $30, $15, desenha_porta
    addi $29, $0, 1

desenha_porta:
    sw $31, 0($30)
    sw $31, 512($30)
    sw $31, 1024($30)
    sw $31, 1536($30)
    sw $31, 2048($30)
    sw $31, 2560($30)

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

    lw $24, 0($19)
    beq $24, $31, morreu
    lw $24, 4($19)
    beq $24, $31, morreu
    lw $24, 8($19)
    beq $24, $31, morreu
    lw $24, 12($19)
    beq $24, $31, morreu
    lw $24, -512($19)
    beq $24, $31, morreu
    lw $24, -500($19)
    beq $24, $31, morreu
    lw $24, 512($19)
    beq $24, $31, morreu
    lw $24, 524($19)
    beq $24, $31, morreu

    lui $17, 0xFFFF
    lw $18, 0($17)
    beq $18, $0, sem_input
    lw $25, 4($17)
    addi $2, $0, 31
    addi $4, $0, 38
    addi $5, $0, 100
    addi $6, $0, 100
    addi $7, $0, 30
    syscall

sem_input:
    sw $23, 0($19)
    sw $23, 4($19)
    sw $23, 8($19)
    sw $23, 12($19)
    sw $23, -512($19)
    sw $23, -500($19)
    sw $23, 512($19)
    sw $23, 524($19)

    beq $25, 'w', cima
    beq $25, 's', baixo
    beq $25, 'a', esquerda
    beq $25, 'd', direita
    j verifica_pista

cima:
    addi $19, $19, -512
    j verifica_pista
baixo:
    addi $19, $19, 512
    j verifica_pista
esquerda:
    addi $19, $19, -4
    j verifica_pista
direita:
    addi $19, $19, 4

verifica_pista:
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

    sw $20, 0($19)
    sw $20, 4($19)
    sw $20, 8($19)
    sw $20, 12($19)
    sw $21, -512($19)
    sw $21, -500($19)
    sw $21, 512($19)
    sw $21, 524($19)

    addi $25, $0, 15000
delay:
    addi $25, $25, -1
    bne $25, $0, delay

    j loop_carro

morreu:
    addi $2, $0, 31
    addi $4, $0, 36
    addi $5, $0, 1500
    addi $6, $0, 127
    addi $7, $0, 115
    syscall
    addi $2, $0, 10
    syscall