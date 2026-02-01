lui   $8, 0x1001
    lui   $9, 0x00FF
    ori   $9, $9, 0xFF00          # amarelo

    # Linha X, coluna Y(12)
    addi  $8, $8, 29696           # X-1×512 + Y×4 = 29696 + 48 = 29744
    lui   $8, 0x1001

    addi  $8, $8, 29696           # 58×512 = 29696 → vai pra linha 59
    addi  $8, $8, 48              # 12×4 = 48 → coluna L (12)
    sw    $9, 0($8)               # pinta linha 59, coluna L

    # Linha 58, coluna K (11)
    addi  $8, $8, -512            # sobe 1 linha → linha 58
    addi  $8, $8, -4              # volta 1 coluna → coluna K (11)
    sw    $9, 0($8)               # pinta linha 58, coluna K