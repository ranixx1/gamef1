.text
main:
    lui  $8, 0x1001          

    # cor fundo 
    ori  $9, $0, 0x606060
    
    ori   $10, $0, 131072
loop_fundo:  #background
    beq   $10, $0, continua_0
    sw    $9, 0($8)                   # pinta de verde
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop_fundo
    
continua_0: 
    # posição inicial (linha 16, coluna 32)
    addi $8, $8, 8192        # 16 × 512
    addi $8, $8, 84         # 32 × 4
	ori  $9, $0, 0xFF0000
	addi $11, $0, 36         # altura (linhas)
loop_frontal_1:
    beq  $11, $0, continua_1

    addi $10, $0, 5          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna:
    beq  $10, $0, prox_linha
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna

prox_linha:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_frontal_1

continua_1:
    lui  $8, 0x1001          

    # posição inicial (linha 12, coluna 25)
    addi $8, $8, 6144        # 12 × 512
    addi $8, $8, 100         # 25 × 4
    # cor (ciano)
    ori  $9, $0, 0x000000

    addi $11, $0, 44         # altura (linhas)
loop_frontal_2:
    beq  $11, $0, continua_2

    addi $10, $0, 5          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_2:
    beq  $10, $0, prox_linha_2
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_2

prox_linha_2:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_frontal_2

continua_2:
lui  $8, 0x1001          

    # posição inicial (linha 25, coluna 32)
    addi $8, $8, 12800        # 25 × 512
    addi $8, $8, 84         # 32 × 4

    # cor (ciano)
    ori  $9, $0, 0xFF0000

    addi $11, $0, 17         # altura (linhas)

loop_centro:
    beq  $11, $0, continua_3

    addi $10, $0, 89          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_centro:
    beq  $10, $0, prox_linha_3
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_centro

prox_linha_3:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_centro

continua_3:
 	lui  $8, 0x1001          

    # posição inicial (linha 12, coluna 37)
    addi $8, $8, 6144        # 16 × 512
    addi $8, $8, 148         # 37 × 4

    # cor (ciano)
    ori  $9, $0, 0xFF0000
    
addi $11, $0, 8         # altura (linhas)

############################ rodas ########################################
loop_roda_1:
    beq  $11, $0, continua_4

    addi $10, $0, 14          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_roda:
    beq  $10, $0, prox_linha_4
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_roda

prox_linha_4:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_roda_1
    
continua_4:
 	lui  $8, 0x1001          

    # posição inicial (linha 12, coluna 37)
    addi $8, $8, 6144        # 12 × 512
    addi $8, $8, 368         # 92 × 4

    # cor (ciano)
    ori  $9, $0, 0xFF0000
    
addi $11, $0, 8         # altura (linhas)

loop_roda_2:
    beq  $11, $0, continua_5

    addi $10, $0, 14          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_roda_2:
    beq  $10, $0, prox_linha_5
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_roda_2

prox_linha_5:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_roda_2
    
continua_5:
 	lui  $8, 0x1001          

    # posição inicial (linha 46, coluna 37)
    addi $8, $8, 24576        # 46 × 512
    addi $8, $8, 148         # 37 × 4

    # cor (ciano)
    ori  $9, $0, 0xFF0000
    
addi $11, $0, 8         # altura (linhas)

loop_roda_3:
    beq  $11, $0, continua_6

    addi $10, $0, 14          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_roda_3:
    beq  $10, $0, prox_linha_6
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_roda_3

prox_linha_6:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_roda_3

continua_6:
 	lui  $8, 0x1001          

    # posição inicial (linha 46, coluna 37)
    addi $8, $8, 24576        # 46 × 512
    addi $8, $8, 368         # 37 × 4

    # cor (ciano)
    ori  $9, $0, 0xFF0000
    
addi $11, $0, 8         # altura (linhas)

loop_roda_4:
    beq  $11, $0, continua_7

    addi $10, $0, 14          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_roda_4:
    beq  $10, $0, prox_linha_7
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_roda_4

prox_linha_7:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_roda_4   

############################ traseira ########################################
continua_7:
	lui  $8, 0x1001          

    # posição inicial (linha 20, coluna 106)
    addi $8, $8, 10240        # 16 × 512
    addi $8, $8, 424         # 32 × 4

    addi $11, $0, 28         # altura (linhas)

loop_traseira:
    beq  $11, $0, continua_8

    addi $10, $0, 5          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_traseira:
    beq  $10, $0, prox_linha_8
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_traseira

prox_linha_8:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_traseira
    
############################ pinos rodas ########################################
continua_8:
	lui  $8, 0x1001          
	ori $9,$, 0x000000
    # posição inicial (linha 20, coluna 42)
    addi $8, $8, 10240        # 16 × 512
    addi $8, $8, 168         # 42 × 4

    addi $11, $0, 5         # altura (linhas)

loop_pino_1:
    beq  $11, $0, continua_9

    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_pino:
    beq  $10, $0, prox_linha_9
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_pino

prox_linha_9:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_pino_1
    
continua_9:
	lui  $8, 0x1001          
	ori $9,$0, 0x000000
    # posição inicial (linha 20, coluna 99)
    addi $8, $8, 10240        # 16 × 512
    addi $8, $8, 388       # 42 × 4

    addi $11, $0, 5         # altura (linhas)

loop_pino_2:
    beq  $11, $0, continua_10

    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_pino_2:
    beq  $10, $0, prox_linha_10
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_pino_2

prox_linha_10:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_pino_2
    

continua_10:
	lui  $8, 0x1001          
	ori $9,$0, 0x000000
    # posição inicial (linha 20, coluna 42)
    addi $8, $8, 21504        # 16 × 512
    addi $8, $8, 168         # 42 × 4

    addi $11, $0, 6         # altura (linhas)

loop_pino_3:
    beq  $11, $0, continua_11

    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_pino_3:
    beq  $10, $0, prox_linha_11
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_pino_3

prox_linha_11:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_pino_3
    
continua_11:
	lui  $8, 0x1001          
	ori $9,$0, 0x000000
    # posição inicial (linha 20, coluna 99)
    addi $8, $8, 21504        # 16 × 512
    addi $8, $8, 388       # 42 × 4

    addi $11, $0, 6         # altura (linhas)

loop_pino_4:
    beq  $11, $0, continua_12

    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_pino_4:
    beq  $10, $0, prox_linha_12
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_pino_4

prox_linha_12:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_pino_4

continua_12:
	lui  $8, 0x1001    
	ori  $9, $0, 0xFF0000      
    # posição inicial (linha 20, coluna xx)
    addi $8, $8, 10240        # 20 × 512
    addi $8, $8, 204       # xx × 4

    addi $11, $0, 28         # altura (linhas)

loop_centro_lado_menor:
    beq  $11, $0, continua_13

    addi $10, $0, 41          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_centro_lado_menor:
    beq  $10, $0, prox_linha_13
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_centro_lado_menor

prox_linha_13:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_centro_lado_menor

continua_13:
	lui  $8, 0x1001          
    # posição inicial (linha 17, coluna xx)
    addi $8, $8, 8704        # 17 × 512
    addi $8, $8, 224    # 47 × 4

    addi $11, $0, 34         # altura (linhas)

loop_centro_lado_maior:
    beq  $11, $0, continua_15
    ori  $9, $0, 0xFF0000
    addi $10, $0, 31          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_centro_lado_maior:
    beq  $10, $0, prox_linha_14
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_centro_lado_maior

prox_linha_14:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_centro_lado_maior


############################## pontas ################
continua_15:
	lui  $8, 0x1001          
    # posição inicial (linha 17, coluna xx)
    addi $8, $8, 6144        # 17 × 512
    addi $8, $8, 120    #  × 4

    addi $11, $0, 4         # altura (linhas)

loop_ponta_1:
    beq  $11, $0, continua_16
    ori  $9, $0, 0x000000
    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_ponta_1:
    beq  $10, $0, prox_linha_15
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_ponta_1

prox_linha_15:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_ponta_1
    
continua_16:
	lui  $8, 0x1001          
    # posição inicial (linha 17, coluna xx)
    addi $8, $8, 26624        # 17 × 512
    addi $8, $8, 120    #  

    addi $11, $0, 4         # altura (linhas)

loop_ponta_2:
    beq  $11, $0, espera_start
    ori  $9, $0, 0x000000
    addi $10, $0, 4          # largura (colunas)
    add  $12, $8, $0            # salva início da linha

loop_coluna_ponta_2:
    beq  $10, $0, prox_linha_16
    sw   $9, 0($8)
    addi $8, $8, 4           # direita
    addi $10, $10, -1
    j    loop_coluna_ponta_2

prox_linha_16:
    move $8, $12             # volta pro início da linha
    addi $8, $8, 512         # desce uma linha
    addi $11, $11, -1
    j    loop_ponta_2

############################
# ESPERA TECLA 'Z'
############################
espera_start:
    lui  $17, 0xFFFF       # MMIO teclado
    lw   $18, 0($17)       # status
    beq  $18, $0, espera_start  # nenhuma tecla

    lw   $19, 4($17)       # código ASCII da tecla
    beq  $19, 'z', inicia_jogo
    beq  $19, 'Z', inicia_jogo  # opcional (Z maiúsculo)

    j espera_start
############################
# ÁREA DO JOGO
############################
inicia_jogo:
main_jogo:
    lui   $8, 0x1001        
    ori   $9, $0, 0x606060             # $9 = 0x0000FF00

    ori   $10, $0, 131072 #tela toda
    
loop_grama:  #background
    beq   $10, $0, comeca_pista
    sw    $9, 0($8)                   # pinta de cinza
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
    beq   $10, $0, cones
    sw    $9, 0($8)   
    addi  $8, $8, -512
    addi  $10, $10, -1
    j    completa_ultima_curva
    
############################
# CONES FIXOS (obstáculo)
############################

cones:
ori $30, $0, 0x00FFFFFF   # branco
ori $31, $0, 0x00FFA500   # laranja
lui  $8, 0x1001
addi $8, $8, 7680        # linha 15
addi $8, $8, 48         # coluna M (50 × 4)

# linha 15
sw   $30, 0($8)          # (15,M) branco
sw   $31, 4($8)          # (15,N) laranja

# linha 16
sw   $31, 512($8)        # (16,M) laranja
sw   $31, 516($8)        # (16,N) laranja

# ===== CONE PQ =====

lui  $8, 0x1001
addi $8, $8, 7680        # linha 15
addi $8, $8, 60        # coluna P (60 × 4)

# linha 15
sw   $30, 0($8)          # (15,P) branco
sw   $31, 4($8)          # (15,Q) laranja

# linha 16
sw   $31, 512($8)        # (16,P) laranja
sw   $31, 516($8)        # (16,Q) laranja

    
############################
# LINHA DE CHEGADA
############################

comeca_linha_chegada: 
    lui  $8, 0x1001
    ori  $9, $0, 0x0000FF     # azul (linha de chegada)

    # ----- linha 19 -----
    addi $8, $8, 9728        # linha 19
    addi $8, $8, 44          # coluna L
    addi $10, $0, 7          # L até R

linha_chegada_19:
    beq  $10, $0, linha20
    sw   $9, 0($8)
    addi $8, $8, 4
    addi $10, $10, -1
    j    linha_chegada_19

linha20:
    lui  $8, 0x1001
    addi $8, $8, 10240       # linha 20
    addi $8, $8, 44          # coluna L
    addi $10, $0, 7

linha_chegada_20:
    beq  $10, $0, start_carro
    sw   $9, 0($8)
    addi $8, $8, 4
    addi $10, $10, -1
    j    linha_chegada_20

   
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
# === CHECA LINHA DE CHEGADA ===
    lw $24, 0($19)
    beq $24, $9, venceu

    lw $24, 4($19)
    beq $24, $9, venceu

    lw $24, 8($19)
    beq $24, $9, venceu

    lw $24, 12($19)
    beq $24, $9, venceu
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
    
venceu:
    lui  $8, 0x1001        # base do bitmap
    ori  $9, $0, 0x00FF00  # verde
    ori  $10, $0, 32768    # tela toda

pinta_verde:
    beq  $10, $0, fim_verde
    sw   $9, 0($8)
    addi $8, $8, 4
    addi $10, $10, -1
    j    pinta_verde

fim_verde:
    j fim_verde            # trava aqui (vitória)

morreu:
    ############################
    # SOM DE EXPLOSÃO
    ############################
    addi $2, $0, 31
    addi $4, $0, 36
    addi $5, $0, 1200
    addi $6, $0, 127
    addi $7, $0, 115
    syscall

    # PINTA TELA TODA DE VERMELHO
############################
    lui $8, 0x1001            # base do bitmap
    ori $9, $0, 0x00FF0000    # vermelho
    ori $10, $0, 32768        # total de pixels (256 x 128)

pinta_tela_vermelho:
    beq  $10, $0, espera_restart
    sw   $9, 0($8)
    addi $8, $8, 4
    addi $10, $10, -1
    j    pinta_tela_vermelho


    ############################
    # ESPERA TECLA R ou r PARA REINICIAR
    ############################
espera_restart:
    lui $17, 0xFFFF
    lw $18, 0($17)
    beq $18, $0, espera_restart
    lw $19, 4($17)
    addi $15, $0, 114         # 'r'
    beq $19, $15, inicia_jogo
    addi $15, $0, 82          # 'R'
    beq $19, $15, inicia_jogo
    j espera_restart
