// Inicializar posición en la pantalla
@SCREEN //16384
D=A
@Position
M=D

// Almacenar la última tecla presionada
@LastKey
M=0

// Bucle principal para monitorear el teclado
(CHECK)
@KBD
D=M
@LastKey
D=D-M          // Comparar con la última tecla
@CHECK
D;JEQ         // Si no hay cambio, seguir esperando

// Actualizar la última tecla
@KBD
D=M
@LastKey
M=D

// Si no hay tecla presionada, regresar al inicio
@CHECK
D;JEQ

// Comprobar si el valor es impar
@1
D=D&A         // D = D & 1 (verificar bit menos significativo)
@IMPAR
D;JNE         // Si es impar, ir a llenar la pantalla

// Si es par, limpiar la pantalla
@SCREEN
D=A
@Position
M=D           // Reiniciar la posición

(LIMPIAR)
@KBD
D=M
@LastKey
D=D-M
@CHECK
D;JNE         // Si se detecta otra tecla, regresar a CHECK

@Position
D=M
@24576
D=D-A
@CHECK
D;JEQ        // Si terminamos, volver a revisar el teclado

@Position
A=M
M=0         // Escribir blanco (limpiar pixel)

@Position
M=M+1      // Avanzar a la siguiente posición
@LIMPIAR
0;JMP

// Imprimir negro (IMPAR)
(IMPAR)
@SCREEN
D=A
@Position
M=D         // Reiniciar la posición

(LLENAR)
@KBD
D=M
@LastKey
D=D-M
@CHECK
D;JNE      // Si se detecta otra tecla, regresar a CHECK

@Position
D=M
@24576
D=D-A
@CHECK
D;JEQ     // Si terminamos, volver a revisar el teclado

@Position
A=M
M=-1     // Escribir negro (pintar pixel)

@Position
M=M+1   // Avanzar a la siguiente posición
@LLENAR
0;JMP
