# Testing for OpenMP implemenation in the REX OpenMP compiler
The testing includes small testing OpenMP code, the reference output at each stage of the compilation by REX, and script/Makefile to automate the testing process in a CI setting. There at least two purpose of testing, 1) testing itself for the continuous development, and 2) to show how the REX compiler implements each OpenMP directive/clause. 

For the REX OpenMP compiler, we test the OpenMP transformation in the following stages, according to how REX implements the transformation:

1. parsing OpenMP constructs via ompparser
2. SAGE AST construction, using unparsing output of the OpenMP constructs as reference
3. Normalization and pre-processing in Sage AST, using unparsing output of the OpenMP constructs as reference
4. Transformation 1, using unparsing output of the whole program as reference
5. Transformation 2, using unparsing output of the whole program as reference
6. Compilation with backend compiler, successful compilation by backend compiler is the reference
7. Link with runtime to generate executable, successful linking by the backend linker is the reference
8. Execution, successful and correct execution of the executable is the reference. 

Test cases and their references in each stage are organized in folders of major OpenMP directives/constructs. We then use proper filename suffix to indicate reference file. 
