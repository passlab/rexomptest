
#
# Check if some required definitions were made by the user.
#

LLVM_OMP_RUNTIME=${LLVM_PATH/lib}

#ifeq ($(LLVM_OMP_RUNTIME),)
#  $(error LLVM_OMP_RUNTIME is not set)
#endif

#export LLVM_OMP_RUNTIME

#
# Look for the testcase folders 
#

ifeq ($(TEST_FOLDERS),)
	machine := $(shell uname -m)

  TEST_FOLDERS := $(wildcard rex-*)

  ifeq ($(machine),x86_64)
		TEST_FOLDERS += $(wildcard tx86-*)
  endif

endif

TEST_FOLDERS_UNPARSE := $(addsuffix _unparse,$(TEST_FOLDERS))
TEST_FOLDERS_LOWER := $(addsuffix _lower,$(TEST_FOLDERS))
TEST_FOLDERS_BUILD := $(addsuffix _build,$(TEST_FOLDERS))
TEST_FOLDERS_RUN := $(addsuffix _run,$(TEST_FOLDERS))
TEST_FOLDERS_CLEAN := $(addsuffix _clean,$(TEST_FOLDERS))

#
# rule to run all the tests in static format
#

unparse_all: $(TEST_FOLDERS_UNPARSE)
	@echo " ---> All tests unparsed successfully!!!"

lower_all: $(TEST_FOLDERS_LOWER)
	@echo " ---> All tests lowered successfully!!!"

build_all: bld_all_static
	@rm -rf .omptests_failed
	@for i in $(TEST_FOLDERS) ; do \
	  $(MAKE) -C $$i build ; if [ $$? -ne 0 ] ; then touch .omptests_failed ; fi ; true; \
	done
	@if [ -f '.omptests_failed' ] ; \
		then echo " ---> Tests failed!!!" ; false ; fi
	@(printenv OMP_TARGET_OFFLOAD | grep "DISABLED" >/dev/null && echo " ---> Test ran on the host") || echo  " ---> Test ran on the device"
	@echo " ---> All tests completed successfully!!!"

bld_all_static: $(TEST_FOLDERS_BUILD)
	@echo " ---> All tests built successfully!!!"

.PHONY: clean
clean: $(TEST_FOLDERS_CLEAN)
	@echo " ---> All tests are cleaned successfully!!!"

$(TEST_FOLDERS_UNPARSE):
	@echo " ---> Testing ${@:_unparse=}..."
	@$(MAKE) -C $(@:_unparse=) unparse
	@echo " ---> Testing ${@:_unparse=} completed."
 
$(TEST_FOLDERS_LOWER):
	@echo " ---> Testing ${@:_lower=}..."
	@$(MAKE) -C $(@:_lower=) lower
	@echo " ---> Testing ${@:_lower=} completed."
 
$(TEST_FOLDERS_BUILD):
	@$(MAKE) -C $(@:_build=) build
 
$(TEST_FOLDERS_RUN):
	@$(MAKE) -C $(@:_run=) run
 
$(TEST_FOLDERS_CLEAN):
	@$(MAKE) -C $(@:_clean=) clean
 
