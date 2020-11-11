# 1. Design

Each subfolder is named by `rex-<directive name>`. Inside the subfolder, there are four files.

1. `Makefile`: `unparse`, `lower`, `build`, and `run` options are available for testing. `build` and `run` will be implemented after we make a decision to use XOMP or KMP interface.
2. `omp-<case name>.c`: the original OpenMP code.
3. `rex-<case name>.c`: the transfored code for reference.
4. `rose-<case name>.c.output`: the OpenMP pragmas for reference.

To test unparsing, we generate the unparsed OpenMP pragmas and compare them with the given reference.
To test lowering, we generate the transformed code and compare them with the given reference.
To test building, a object file is compiled.
To test running, the generated object is linked with the LLVM OpenMP runtime to create an executable to run.


# 2. Usage

At the root folder of tests, we can test all the cases in one run together.

```bash
# test unparsing
make unparse_all
# test lowering
make lower_all
```

We could also check an individual test case, such as the `rex-parallel` subfolder.

```bash
# test parallel directive
make rex-parallel_unparse
make rex-parallel_lower
```

# 3. Issues

Currently, the building and running tests are only a place holder.

The output of running may not be available for comparison. For example, given 8 threads to print their thread id, the numbers could be in any order and they are all correct.
