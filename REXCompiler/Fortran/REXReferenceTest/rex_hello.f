**************************************************
C test the simplest helloworld in OpenMP Fortan
C  note the different sentinels and lower/upper cases
C Liao, 5/24/2009
C***************************************************
      PROGRAM HELLO
      external :: outlined_function
      external :: KMPC_parallel
      CALL KMPC_parallel(0,outlined_function)
      PRINT *, 'the end'
      END PROGRAM

!      SUBROUTINE outlined_function(out_argv)
!      include "omp_lib.h"
!      INTEGER :: out_argv
!      PRINT *, 'Hello World!'
!      END SUBROUTINE
      SUBROUTINE outlined_function(global_id,bound_id)
                IMPLICIT NONE
                INTEGER, POINTER, INTENT(IN)::global_id, bound_id
                PRINT *, 'Hello from process:'
      END SUBROUTINE outlined_function
