#define REAL double

#ifdef __cplusplus
extern "C" {
#endif
extern void axpy_cuda(REAL *x, REAL * y, int n, REAL a);
extern double kernel_time;
extern double read_timer_ms();
#ifdef __cplusplus
}
#endif
