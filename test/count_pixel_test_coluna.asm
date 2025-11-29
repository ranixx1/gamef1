.text
main:
    lui   $8,  0x1001        # $8 = endereço base (0x10010000)
    ori   $9,  $0,  0x00ff00  # cor verde (0x00ff00)

    addi  $10, $0,  64       # queremos 64 quadradinhos na vertical (256/4 = 64)

loop_vertical:
    beq   $10, $0, fim
    sw    $9,  0($8)         # pinta o pixel atual (o quadradinho 4x4 inteiro)
    addi  $8,  $8,  512      # pula para a mesma coluna, 1 quadradinho ABAIXO
                             # porque: 128 quadradinhos por linha × 4 bytes = 512 bytes
    addi  $10, $10, -1
    j     loop_vertical

fim:
    addi  $2, $0, 10
    syscall