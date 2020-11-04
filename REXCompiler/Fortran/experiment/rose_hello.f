***************************************************
C test the simplest helloworld in OpenMP Fortan
C  note the different sentinels and lower/upper cases
C Liao, 5/24/2009
C***************************************************
      PROGRAM HELLO
      INTEGER :: status = 0
      external :: OUT__1__1215__
      CALL XOMP_init()
      CALL XOMP_parallel_start(OUT__1__1215__,1,0,0)
      CALL XOMP_parallel_end()
      PRINT *, 'the end'
      CALL XOMP_terminate(status)
      END PROGRAM

      SUBROUTINE OUT__1__1215__(out_argv)
      include "omp_lib.h"
      INTEGER :: out_argv
      PRINT *, 'Hello World!'
      END SUBROUTINE
