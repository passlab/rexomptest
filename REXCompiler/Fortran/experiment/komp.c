#include "rex_kmp.h"
#include "stddef.h"
#include <stdio.h>

void kmpc_parallel_(int a , void (*func) , ...){
	__kmpc_fork_call(NULL,a,func);
}
