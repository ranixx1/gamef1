.text
main:
    lui   $8, 0x1001        
    ori   $9, $0, 0x00FF              # $9 = 0x0000FF00
    sll   $9, $9, 8                   # desloca pra 0x00FF0000
    ori   $9, $9, 0x0000              # não precisa, mas deixa claro
    # Agora $9 = 0x00FF00 (verde puro)

    ori   $10, $0, 131072
loop_grama:
    beq   $10, $0, comeca_pista
    sw    $9, 0($8)                   # pinta de verde
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop_grama
comeca_pista:
    lui   $8, 0x1001    
                 

    # --- Linha 7 (barra horizontal curta) ---
    addi  $8, $8, 3072                
    lui   $9, 0x00FF
    ori   $9, $9, 0xFF00              # amarelo
    ori   $10, $0, 11
    
loop7:
    beq   $10, $0, prepara_linha12
    sw    $9, 0($8)
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop7

prepara_linha12:
    lui   $8, 0x1001
    addi  $8, $8, 5632        # linha 12 (11*512 = 5632)
    lui   $9, 0x00FF          # recarrega cor amarela
    ori   $9, $9, 0xFF00
    ori   $10, $0, 11         

loop12:
    beq   $10, $0, primeira_curva_direita
    sw    $9, 0($8)
    addi  $8, $8, 4
    addi  $10, $10, -1
    j     loop12
    
primeira_curva_direita:
    addi  $8, $8, -4
    ori   $10, $0, 46         # 46 quadradinhos para baixo

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

addi $10,$0,105

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

fim:
    addi  $2, $0, 10
    syscall
