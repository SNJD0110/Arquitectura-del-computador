.data
    # Cadenas de texto para mensajes al usuario
    ingresar: .asciiz "Ingrese el primer numero entero positivo (hasta 3 digitos): "
    error1: .asciiz "Error: El primer numero debe ser entero positivo y tener 3 digitos o menos.\n"
    ingresar2: .asciiz "Ingrese el segundo numero positivo (hasta 3 digitos): "
    error2: .asciiz "Error: El segundo numero debe ser entero positivo y tener 3 digitos o menos.\n"
    resultado: .asciiz "El resultado de la multiplicacion es: "
.text
.globl main

main:
Leer_número1:
    li $v0, 4              # Código de syscall para imprimir string
    la $a0, ingresar        # Cargar la dirección del mensaje
    syscall                # Imprimir el mensaje

    li $v0, 5              # Código de syscall para leer entero
    syscall                # Leer el entero. El valor se guarda en $v0
    move $s0, $v0          # Mover el número leído a $s0 (num1)

    # Validar entrada 1: 
    bltz $s0, Si_da_error1 # Si $s0 < 0, ir a error de rango
    li $t0, 999            # Cargar 999 en $t0
    bgt $s0, $t0, Si_da_error1 # Si $s0 > 999, ir a error de rango

Leer_número2:
    li $v0, 4              # Imprimir string
    la $a0, ingresar2
    syscall

    li $v0, 5              # Leer entero
    syscall
    move $s1, $v0          # Mover el número leído a $s1 (num2)

    # Validar entrada 2:
    bltz $s1, Si_da_error1 # Si $s1 < 0, ir a error1
    li $t0, 999            # Cargar 999 en $t0
    bgt $s1, $t0, Si_da_error2 # Si $s1 > 999, ir a error2

    # Multiplicación 
    mul $s2, $s0, $s1      # $s2 = num1 * num2 (resultado)

    # Mostrar el resultado
    li $v0, 4              # Imprimir string "El resultado de la multiplicacion de "
    la $a0, resultado
    syscall

    li $v0, 1              # Imprimir entero (resultado)
    move $a0, $s2
    syscall

    # Finalizar el programa 
    li $v0, 10             # Código de syscall para salir del programa
    syscall

    # Manejo de errores
Si_da_error1:
    li $v0, 4              # Imprimir string de error1
    la $a0, error1
    syscall
    j Salida         # Saltar a la salida del programa

Si_da_error2:
    li $v0, 4              # Imprimir string de error2
    la $a0, error2
    syscall
    j Salida        # Saltar a la salida del programa

Salida:
    li $v0, 10             #finaliza el programa
    syscall