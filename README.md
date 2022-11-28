# Testing for OpenMP implemenation in the REX OpenMP compiler
The testing includes small testing OpenMP code, the reference output at each stage of the compilation by REX, and script/Makefile to automate the testing process in a CI setting. There at least two purpose of testing, 1) testing itself for the continuous development, and 2) to show how the REX compiler implements each OpenMP directive/clause. 

For the REX OpenMP compiler, we test the OpenMP transformation in the following stages, according to how REX implements the transformation:

## Compilation and testing stages:

```
1. parsing OpenMP constructs via ompparser
2. SAGE AST construction, using unparsing output of the OpenMP constructs as reference
3. Normalization and pre-processing in Sage AST, using unparsing output of the OpenMP constructs as reference
4.1 Transformation 1, using unparsing output of the whole program as reference
4.2 Transformation 2, using unparsing output of the whole program as reference
5.1 Backend compilation with backend compiler, successful compilation by backend compiler is the reference
5.2 Backend linking with runtime to generate executable, successful linking by the backend linker is the reference
6. Execution, successful and correct execution of the executable is the reference. 
```

Test cases and their references in each stage are organized in folders of major OpenMP directives/constructs. We then use proper filename suffix to indicate reference file. 

## File name conventions
File name should be meaningful. Number should not be used to differentiate two similar cases, instead a meaningful keyword should be in the file name. Number should only be used for sequencing the stages. For example, the following are the file names for a test:

```
omp_parallel.c
omp_parallel_1_parsing_ref.txt
omp_parallel_2_sageAST_ref.txt
omp_parallel_3_normalize_ref.txt
omp_parallel_4_transformation_1_ref.c
omp_parallel_4_transformation_2_ref.c
omp_parallel_5_backend_compilation_ref.c
omp_parallel_5_backend_linking_ref.txt
omp_parallel_6_execution_ref.txt
```


