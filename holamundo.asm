.data          # Crear un segmento de datos
    mensaje: .asciiz "Hola mundo.\n"  # Imprimir string, .asciiz agrega un terminador nulo
.text          # Crear un segmento de codigo
.globl main    # Declarar main como s�mbolo global

main:
    # Llamada al sistema para imprimir string
    li $v0, 4          # Cargar inmediatamente: c�digo de servicio 4 (imprimir string) en $v0
    la $a0, mensaje    # Cargar direcci�n: direcci�n de la cadena 'mensaje' en $a0
    syscall            # segmento de codigo

    # Llamada al sistema para salir
    li $v0, 10         # Cargar inmediatamente: c�digo de servicio 10 (salida) en $v0
    syscall            # Ejecutar llamada al sistema
    
