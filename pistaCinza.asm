.text
#cores:
#pista: 0x007F7F7F
#grama: 0x00ff00
main:
        lui   $8, 0x1001            
        ori   $9, $0, 0x00FF00      # cor da grama
        ori   $11, $0, 0x007F       # cor da pista
        sll   $11, $11, 8           #
        ori   $11, $11, 0x7F7F      # 0x007F7F7F
        addi  $10, $0, 32768        # total de words (131072/4)

# Pinta tudo de grama
loop_grama:
        beq   $10, $0, desenha_pista
        sw    $9, 0($8)             
        addi  $8, $8, 4             
        addi  $10, $10, -1          
        j     loop_grama

desenha_pista:
        lui   $8, 0x1001            # endereço base
        addi  $12, $0, 256          # contador de linhas
        addi  $13, $0, 0            # linha atual

loop_linhas:
        beq   $12, $0, fim
        
        # Calcula posição da pista usando fórmula de elipse simples
        # Para linha y, calcula x usando: x = 128 ± 100 * sqrt(1 - ((y-128)/80)^2)
        # Simplificamos usando aproximação por partes
        
        # Calcula distância do centro vertical
        addi  $14, $13, -128        # linha - 128
        abs   $14, $14              # |linha - 128|
        
        # Se estiver muito longe do centro, pula
        addi  $15, $0, 80
        slt   $16, $14, $15
        beq   $16, $0, proxima_linha
        
        # Calcula a largura da pista nesta linha
        # largura ≈ 100 * (80 - |linha-128|) / 80
        sub   $16, $15, $14         # 80 - |linha-128|
        
        # Multiplica por 100
        addi  $17, $0, 100
        mult  $16, $17
        mflo  $18
        
        # Divide por 80
        addi  $19, $0, 80
        div   $18, $19
        mflo  $20                   # largura aproximada
        
        # Calcula posições esquerda e direita
        addi  $21, $0, 128          # centro
        sub   $22, $21, $20         # x_esquerdo
        add   $23, $21, $20         # x_direito
        
        # Garante limites mínimos e máximos
        addi  $24, $0, 30
        slt   $25, $22, $24
        bne   $25, $0, ajusta_min
        j     verifica_max
ajusta_min:
        addi  $22, $0, 30
verifica_max:
        addi  $24, $0, 480
        slt   $25, $24, $23
        beq   $25, $0, desenha_linha
        addi  $23, $0, 480

desenha_linha:
        # Calcula endereço da linha atual
        addi  $25, $0, 2048         # bytes por linha
        mult  $13, $25
        mflo  $26                   # offset da linha
        add   $27, $8, $26          # início da linha
        
        # Desenha da posição esquerda à direita
        sll   $28, $22, 2           # x_esquerdo * 4
        add   $29, $27, $28         # posição inicial
        
        sub   $30, $23, $22         # largura em pixels
        addi  $31, $0, 0            # contador

pinta_linha:
        beq   $31, $30, proxima_linha
        sw    $11, 0($29)
        addi  $29, $29, 4
        addi  $31, $31, 1
        j     pinta_linha

proxima_linha:
        addi  $13, $13, 1
        addi  $12, $12, -1
        j     loop_linhas

fim:
        addi  $2, $0, 10
        syscall