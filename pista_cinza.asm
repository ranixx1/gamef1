
.text
#cores:
#pista: 0x007F7F7F
#grama: 0x00ff00
#borda: 0xffffff
main:
        lui   $8, 0x1001            
        ori   $9, $0, 0x00FF00      # cor da grama
        ori   $11, $0, 0x007F       # cor da pista (parte alta)
        ori   $17 $0, 0x00FFFFFF
        sll   $11, $11, 8          #
        ori   $11, $11, 0x007F7F7F  
        addi  $10, $0, 131072       # total de pixels

loop_grama:
        beq   $10, $0, desenha_pista
        sw    $9, 0($8)             
        addi  $8, $8, 4             
        addi  $10, $10, -1          
        j     loop_grama

desenha_pista:
        lui   $8, 0x1000            
        addi  $12, $0, 175        # contador de linhas (altura)
        addi  $13, $0, 8           # coluna inicial (8ª coluna)
        addi   $13, $13, 4          # linha ++
        addi  $14, $0, 9           # largura da pista (6 colunas)

loop_linhas:
    beq   $12, $0,  fim

    # calcula endereço do primeiro pixel da linha atual
    add   $15, $8,  $0                    # $15 = base da linha atual
    sll   $14, $12,  9                    # deslocamento da linha: linha * 512 bytes
    addu  $15, $15, $14
    sll   $14, $13,  2                    # deslocamento da coluna inicial * 4
    addu  $15, $15, $14                   # $15 = endereço exato do primeiro pixel da pista

    # === BORDA ESQUERDA (1 pixel branco) ===
    sw    $17, 0($15)
    addi  $15, $15, 4

    # === PISTA CINZA (7 pixels) ===
    addi  $16, $0,  9
loop_cinza:
    beq   $16, $0,  fim_cinza
    sw    $11, 0($15)
    addi  $15, $15, 4
    addi  $16, $16, -1
    j     loop_cinza
fim_cinza:

    # === BORDA DIREITA (1 pixel branco) ===
    sw    $17, 0($15)

    # próxima linha
    addi  $12, $12, -1
    j     loop_linhas

fim:
    addi  $2, $0, 10
    syscall