# 📌 **A REGRA DE OURO — Nunca mais errar posição na tela do MARS**

A tela do display gráfico no MARS possui:

- **512 pixels por linha**
- **4 bytes por pixel**
- Portanto, cada linha ocupa **512 × 4 = 2048 bytes (0x800)**

---

## 🧭 Movimento do pixel usando o registrador `$8`

| Movimento | Quantos bytes somar em `$8` | Exemplo em código |
|----------|-----------------------------|------------------|
| 👉 Direita 1 pixel | **+4** | `addi $8,$8,4` |
| 👈 Esquerda 1 pixel | **−4** | `addi $8,$8,-4` |
| ⬇️ Desce 1 linha (mesma coluna) | **+2048** | `addi $8,$8,2048` |
| ⬆️ Sobe 1 linha (mesma coluna) | **−2048** | `addi $8,$8,-2048` |
| ⬇️ Desce 10 linhas | **10 × 2048 = 20480** | `addi $8,$8,20480` |
| 👉 Direita 20 pixels | **20 × 4 = 80** | `addi $8,$8,80` |

---

## 🎯 Ir direto para qualquer posição (X, Y)

> X = coluna (horizontal)  
> Y = linha (vertical)

📌 Fórmula:

