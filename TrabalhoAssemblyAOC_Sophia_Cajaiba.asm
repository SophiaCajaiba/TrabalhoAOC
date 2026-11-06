.data
msg: .asciiz "Digite um numero entre 2 e 9999: "
pula: .asciiz "\n"

.text
.globl main

main:

# Solicitar numero
solicita:
li $v0, 4
la $a0, msg
syscall

# Ler numero
li $v0, 5
syscall
add $t0, $v0, $zero

# Verificar se esta dentro do limite
li $t6, 10000
li $t7, 1

ble $t0, $t7, solicita
bge $t0, $t6, solicita

# Comecar pelo numero 1
li $t1, 1

loop_num:

# O numero 1 nao e primo
beq $t1, $t7, imprime

# Comecar divisor em 2
li $t2, 2
li $t4, 0

loop_div:

# Verificar se chegou ao final
bge $t2, $t1, verifica

# Calcular o resto da divisao
rem $t3, $t1, $t2

# Se resto for zero, nao e primo
beq $t3, $zero, imprime

# Proximo divisor
add $t2, $t2, 1
j loop_div

verifica:

# Se nao encontrou divisor, e primo
bne $t4, $zero, imprime
j proximo

imprime:

# Mostrar numero
li $v0, 1
add $a0, $t1, $zero
syscall

# Pular linha
li $v0, 4
la $a0, pula
syscall

proximo:

# Passar para o proximo numero
add $t1, $t1, 1

# Verificar se chegou ao limite
bge $t0, $t1, loop_num

# Encerrar
li $v0, 10
syscall