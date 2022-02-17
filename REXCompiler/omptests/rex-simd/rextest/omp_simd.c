//Variable examples of using simd directives
void foo (int n, double *a, double* b)
{
#pragma omp simd
  for (int i=0; i<n; i++)
    a[i]=b[i];
}
