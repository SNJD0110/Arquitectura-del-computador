#include <stdio.h>  // Para printf
#include <time.h>   // Para clock(), CLOCKS_PER_SEC

int main() {
    // Declaramos variables para almacenar las marcas de tiempo
    clock_t inicio_cpu, fin_cpu;
    double tiempo_cpu_segundos;
    long long i;
    long long suma = 0; // Para evitar que el compilador optimice el bucle

    // Tomamos la marca de tiempo inicial del CPU
    inicio_cpu = clock();

    // --- Inicio de la sección de código que queremos medir ---
    printf("Realizando cálculos intensivos...\n");
    for (i = 0; i < 500000000; i++) { // Bucle que realiza 500 millones de iteraciones
        suma += i; // Operación simple para consumir CPU
    }
    printf("Cálculos completados. Suma total: %lld\n", suma);
    // --- Fin de la sección de código que queremos medir ---

    // Tomamos la marca de tiempo final del CPU
    fin_cpu = clock();

    // Calculamos la diferencia de tiempo de CPU y la convertimos a segundos
    // CLOCKS_PER_SEC es una macro que define cuántos "ticks" de clock hay por segundo.
    tiempo_cpu_segundos = (double)(fin_cpu - inicio_cpu) / CLOCKS_PER_SEC;

    // Imprimimos el tiempo de ejecución
    printf("\n--- Estadísticas de Tiempo (dentro del programa) ---\n");
    printf("Tiempo de CPU consumido: %.4f segundos\n", tiempo_cpu_segundos);

    return 0;
}
//Eemplo de time con un buble pesado y midiendo tiempo//