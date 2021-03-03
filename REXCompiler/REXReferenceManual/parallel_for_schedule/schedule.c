#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main (int argc, char** argv) {
    int i;
#pragma omp parallel for schedule(static, 2) num_threads(4)
    for (i = 0; i < 20; i++) {
        printf("Test Static - thread:%d, iter: %d.\n", omp_get_thread_num(), i);
    }

#pragma omp parallel for schedule(dynamic, 2) num_threads(4)
    for (i = 0; i < 20; i++) {
        printf("Test Dynamic - thread:%d, iter: %d.\n", omp_get_thread_num(), i);
    }

#pragma omp parallel for schedule(guided, 2) num_threads(4)
    for (i = 0; i < 20; i++) {
        printf("Test Guided - thread:%d, iter: %d.\n", omp_get_thread_num(), i);
    }

#pragma omp parallel for schedule(auto) num_threads(4)
    for (i = 0; i < 20; i++) {
        printf("Test Auto - thread:%d, iter: %d.\n", omp_get_thread_num(), i);
    }

#pragma omp parallel for schedule(runtime) num_threads(4)
    for (i = 0; i < 20; i++) {
        printf("Test Runtime - thread:%d, iter: %d.\n", omp_get_thread_num(), i);
    }

    return 0;
}
