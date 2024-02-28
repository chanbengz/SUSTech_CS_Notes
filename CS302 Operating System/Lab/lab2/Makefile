THIS_MAKEFILE := $(abspath $(lastword $(MAKEFILE_LIST)))
THIS_DIR := $(dir $(THIS_MAKEFILE))

LOG ?= error

K = src

TOOLPREFIX =
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
MKDIR = mkdir -p
FIND = find
CLANG_FORMAT = clang-format
AVOCADO = avocado

O = build
BUILDDIR = $(O)
C_SRCS = $(wildcard $K/*.c)
AS_SRCS = $(wildcard $K/*.S)
C_OBJS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(C_SRCS))))
AS_OBJS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(AS_SRCS))))
OBJS = $(C_OBJS) $(AS_OBJS)
EXECUTABLES = $(basename $(C_OBJS))

CFLAGS = -std=gnu11 -g

TEST_RESULTS_DIR = test_results
AVOCADO_RUN_EXTRA_PARAMS =
AVOCADO_RUN_PARAMS = --job-results-dir $(TEST_RESULTS_DIR) \
  $(AVOCADO_RUN_EXTRA_PARAMS)
TEST_REFERENCES = tests

HEADER_DEP = $(addsuffix .d, $(basename $(C_OBJS)))

.PHONY: all
all: $(EXECUTABLES)

-include $(HEADER_DEP)

$(AS_OBJS): $(BUILDDIR)/$K/%.o : $K/%.S
	@$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(C_OBJS): $(BUILDDIR)/$K/%.o : $K/%.c  $(BUILDDIR)/$K/%.d
	@$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(HEADER_DEP): $(BUILDDIR)/$K/%.d : $K/%.c
	@$(MKDIR) $(@D)
	@set -e; rm -f $@; $(CC) -MM $< $(INCLUDEFLAGS) > $@.$$$$; \
        sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
        rm -f $@.$$$$

$(EXECUTABLES): %: %.o
	$(CC) $(LDFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

FIND_FORMAT_CMD = $(FIND) $(THIS_DIR) -type f -name "*.[ch]" \
-execdir $(CLANG_FORMAT) $(CLANG_FORMAT_PARAMS) "{}" "+"

.PHONY: format_check
format_check: CLANG_FORMAT_PARAMS=-Werror --dry-run
format_check:
	$(FIND_FORMAT_CMD)

.PHONY: format
format: CLANG_FORMAT_PARAMS=-i
format:
	$(FIND_FORMAT_CMD)

.PHONY: check
check: all
	$(AVOCADO) run $(AVOCADO_RUN_PARAMS) $(TEST_REFERENCES)
