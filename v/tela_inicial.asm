.text
main:
    lui  $8, 0x1001          

    # cor fundo 
    ori  $9, $0, 0xFFFFFF
    
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
	ori  $9, $0, 0x00FFFF
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
    ori  $9, $0, 0x0000FF

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
    ori  $9, $0, 0x00FFFF

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
    ori  $9, $0, 0x00FFFF
    
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
    ori  $9, $0, 0x00FFFF
    
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
    ori  $9, $0, 0x00FFFF
    
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
    ori  $9, $0, 0x00FFFF
    
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
	ori $9,$0 0x0000FF
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
	ori $9,$0 0x0000FF
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
	ori $9,$0 0x0000FF
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
	ori $9,$0 0x0000FF
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
	ori  $9, $0, 0x00FFFF      
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
    ori  $9, $0, 0x00FFFF
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
    ori  $9, $0, 0x0000FF
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
    beq  $11, $0, fim
    ori  $9, $0, 0x0000FF
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


fim: addi $2, $0, 10
    syscall            # fecha o programa

    