#include <stdio.h>
#include <omp.h>
// clang -fopenmp schedule.c -o schedule.out

int main(int argc,char **argv)
{
#pragma omp parallel  num_threads(4)
  
#pragma omp for  schedule(nonmonotonic : dynamic , 1)
  for (int i = 0; i < 12; i++) 
    printf("Thread ID: %d, Iteration: %d\n",(omp_get_thread_num()),i);
#pragma omp parallel  num_threads(4)
  
#pragma omp for  schedule(nonmonotonic : static , 1)
  for (int i = 0; i < 12; i++) 
    printf("Thread ID: %d, Iteration: %d\n",(omp_get_thread_num()),i);
  return 0;
}
