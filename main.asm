.text
main:
    lui   $8, 0x1001        

  

    addi  $8, $8, 3072        # linha 7 (6*512)
    lui   $9, 0x00FF          # parte alta da cor
    ori   $9, $9, 0xFF00      # $9 = 0x00FFFF00 (amarelo)
    ori   $10, $0, 11         # contador = 11 (colunas 0 até 10)

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

loop_vertical:
    beq   $10, $0, fim
    addi  $8, $8, 512         # desce 1 linha (mesma coluna!) → +512 bytes
    sw    $9, 0($8)           # pinta o quadradinho da coluna 10
    addi  $10, $10, -1
    j     loop_vertical

fim:
    addi  $2, $0, 10
    syscall