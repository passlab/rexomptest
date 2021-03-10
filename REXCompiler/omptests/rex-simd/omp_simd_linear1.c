//Variable examples of using simd directives
void foo (int n, double *a, double* b)
{
  for (int i=0; i<n; i++)
    a[i]=b[i];
}

void foo2 (int n, double *a, double* b)
{
  for (int i=0; i<n; i++)
    a[i]=b[i];
}

void foo3 (int n, double *a, double* b)
{
  int j=0;
  for (int i=0; i<n; i++,j++)
  {
    a[i]=b[i]+j;
  }
}

void foo32 (int n, double *a, double* b)
{
  int j=0, k=0;
#pragma omp simd linear(j,k)
  for (int i=0; i<n; i++,j++,k++)
  {
    a[i]=b[i]+j+k;
  }
}

void foo33 (int n, double *a, double* b)
{
  int j=0, k=0;
  for (int i=0; i<n; i++,j++,k++)
  {
    a[i]=b[i]+j+k;
  }
}

void fooAligned (int n, double *a, double* b)
{
  int j=0, k=0;
  for (int i=0; i<n; i++,j++,k++)
  {
    a[i]=b[i]+j+k;
  }
}


void fooAligned2 (int n, double *a, double* b)
{
  int j=0, k=0;
  for (int i=0; i<n; i++,j++,k++)
  {
    a[i]=b[i]+j+k;
  }
}

double work( double *a, double *b, int n )
{
   int i; 
   double tmp, sum;
   sum = 0.0;
   for (i = 0; i < n; i++) {
      tmp = a[i] + b[i];
      sum += tmp;
   }
   return sum;
}


#define N 45
int a[N], b[N], c[N];

void foo4(int i, double* P)
{
  int j; 
  for (i = 0; i < 999; ++i) {
    j = P[i];
  }
}

void work2( double **a, double **b, double **c, int n )
{
  int i, j;
  double tmp;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      tmp = a[i][j] + b[i][j];
      c[i][j] = tmp;
    }
  }  
}

void work3( double **a, double **b, double **c, int n )
{
  int i, j;
  double tmp;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      tmp = a[i][j] + b[i][j];
      c[i][j] = tmp;
    }
  }  
}

// declare simd can show up several times!
float bar(int * p) {
   *p = *p +10;
   return *p; 
}

// declare simd can show up several times!
float bar2(int * p) {
   *p = *p +10;
   return *p; 
}

