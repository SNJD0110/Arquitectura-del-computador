#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));
    int lanzamientoDado = (rand() % 6) + 1;
    printf("¡El dado te a dado %d puntos!\n", lanzamientoDado);
    return 0;
}
//Ejemplo usando time para lanzar un dado//