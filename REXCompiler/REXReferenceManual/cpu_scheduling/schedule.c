#include <stdio.h>
#include <omp.h>

// clang -fopenmp schedule.c -o schedule.out
int main (int argc, char** argv) {

#pragma omp parallel for num_threads(4) schedule(dynamic)
    for (int i = 0; i < 12; i++)
        printf("Thread ID: %d, Iteration: %d\n", omp_get_thread_num(), i);

#pragma omp parallel for num_threads(4)
    for (int i = 0; i < 12; i++)
        printf("Thread ID: %d, Iteration: %d\n", omp_get_thread_num(), i);

    return 0;
}
