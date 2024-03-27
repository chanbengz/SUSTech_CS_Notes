PROJ	:=
EMPTY	:=
SPACE	:= $(EMPTY) $(EMPTY)
SLASH	:= /

V       := @

GCCPREFIX := riscv64-unknown-elf-

ifndef QEMU
QEMU := qemu-system-riscv64
endif


# eliminate default suffix rules
.SUFFIXES: .c .S .h

# delete target files if there is an error (or make is interrupted)
.DELETE_ON_ERROR:

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

# define compiler and flags
HOSTCC		:= gcc
HOSTCFLAGS	:= -Wall -O2

GDB		:= $(GCCPREFIX)gdb

CC		:= $(GCCPREFIX)gcc
CFLAGS  := -mcmodel=medany -std=gnu99 -Wno-unused -Werror -g
CFLAGS	+= -fno-builtin -Wall -O2 -nostdinc $(DEFS)
CFLAGS	+= -fno-stack-protector -ffunction-sections -fdata-sections
CTYPE	:= c S

LD      := $(GCCPREFIX)ld
LDFLAGS	:= -m elf64lriscv
LDFLAGS	+= -nostdlib --gc-sections

OBJCOPY := $(GCCPREFIX)objcopy
OBJDUMP := $(GCCPREFIX)objdump

COPY	:= cp
MKDIR   := mkdir -p
MV		:= mv
RM		:= rm -f
AWK		:= awk
SED		:= sed
SH		:= sh
TR		:= tr
TOUCH	:= touch -c

FIND = find
CLANG_FORMAT = clang-format
AVOCADO = avocado

TEST_RESULTS_DIR = test_results
AVOCADO_RUN_EXTRA_PARAMS = --job-timeout 1m
AVOCADO_RUN_PARAMS = --job-results-dir $(TEST_RESULTS_DIR) \
  $(AVOCADO_RUN_EXTRA_PARAMS)
TEST_REFERENCES = tests

OBJDIR	:= obj
BINDIR	:= bin

ALLOBJS	:=
ALLDEPS	:=
TARGETS	:=

ALLOW_FILE_LIST := ^kern/libs/stdio.c$$ \
  ^libs/sbi.c$$ \
  ^.base_git_ref$$

# include some predefined function
include tools/function.mk

listf_cc = $(call listf,$(1),$(CTYPE))

USER_PREFIX	:= __user_

# for cc
add_files_cc = $(call add_files,$(1),$(CC),$(CFLAGS) $(3),$(2),$(4))
create_target_cc = $(call create_target,$(1),$(2),$(3),$(CC),$(CFLAGS))

# for hostcc
add_files_host = $(call add_files,$(1),$(HOSTCC),$(HOSTCFLAGS),$(2),$(3))
create_target_host = $(call create_target,$(1),$(2),$(3),$(HOSTCC),$(HOSTCFLAGS))

cgtype = $(patsubst %.$(2),%.$(3),$(1))
objfile = $(call toobj,$(1))
asmfile = $(call cgtype,$(call toobj,$(1)),o,asm)
outfile = $(call cgtype,$(call toobj,$(1)),o,out)
symfile = $(call cgtype,$(call toobj,$(1)),o,sym)
filename = $(basename $(notdir $(1)))
ubinfile = $(call outfile,$(addprefix $(USER_PREFIX),$(call filename,$(1))))

# for match pattern
match = $(shell echo $(2) | $(AWK) '{for(i=1;i<=NF;i++){if(match("$(1)","^"$$(i)"$$")){exit 1;}}}'; echo $$?)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# include kernel/user

INCLUDE	+= libs/

CFLAGS	+= $(addprefix -I,$(INCLUDE))

LIBDIR	+= libs

$(call add_files_cc,$(call listf_cc,$(LIBDIR)),libs,)

# -------------------------------------------------------------------
# user programs

UINCLUDE	+= user/include/ \
			   user/libs/

USRCDIR		+= user

ULIBDIR		+= user/libs

UCFLAGS		+= $(addprefix -I,$(UINCLUDE))
USER_BINS	:=

$(call add_files_cc,$(call listf_cc,$(ULIBDIR)),ulibs,$(UCFLAGS))
$(call add_files_cc,$(call listf_cc,$(USRCDIR)),uprog,$(UCFLAGS))

UOBJS	:= $(call read_packet,ulibs libs)

define uprog_ld
__user_bin__ := $$(call ubinfile,$(1))
USER_BINS += $$(__user_bin__)
$$(__user_bin__): tools/user.ld
$$(__user_bin__): $$(UOBJS)
$$(__user_bin__): $(1) | $$$$(dir $$$$@)
	$(V)$(LD) $(LDFLAGS) -T tools/user.ld -o $$@ $$(UOBJS) $(1)
	@$(OBJDUMP) -S $$@ > $$(call cgtype,$$<,o,asm)
	@$(OBJDUMP) -t $$@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$$$/d' > $$(call cgtype,$$<,o,sym)
endef

$(foreach p,$(call read_packet,uprog),$(eval $(call uprog_ld,$(p))))

# -------------------------------------------------------------------
# kernel

KINCLUDE	+= kern/debug \
			   kern/driver \
			   kern/trap \
			   kern/mm \
			   kern/sync \
			   kern/fs \
			   kern/process \
			   kern/schedule \
			   kern/libs \
			   kern/syscall

KSRCDIR		+= kern/init \
			   kern/libs \
			   kern/debug \
			   kern/driver \
			   kern/trap \
			   kern/mm \
			   kern/fs \
			   kern/process \
			   kern/schedule \
			   kern/sync \
			   kern/syscall

KCFLAGS		+= $(addprefix -I,$(KINCLUDE))

$(call add_files_cc,$(call listf_cc,$(KSRCDIR)),kernel,$(KCFLAGS))

KOBJS	= $(call read_packet,kernel libs)

# create kernel target
kernel = $(call totarget,kernel)

$(kernel): tools/kernel.ld

$(kernel): $(KOBJS) $(USER_BINS)
	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS) --format=binary $(USER_BINS) --format=default
	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)
	@$(OBJDUMP) -t $@ | $(SED) '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(call symfile,kernel)

$(call create_target,kernel)

# -------------------------------------------------------------------
# create ucore.bin
UCOREIMG	:= $(call totarget,ucore.bin)

$(UCOREIMG): $(kernel)
	$(OBJCOPY) $(kernel) --strip-all -O binary $@

$(call create_target,ucore.bin)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

$(call finish_all)

IGNORE_ALLDEPS	= clean

ifeq ($(call match,$(MAKECMDGOALS),$(IGNORE_ALLDEPS)),0)
-include $(ALLDEPS)
endif

# files for grade script

TARGETS: $(TARGETS)

.DEFAULT_GOAL := TARGETS

QEMU_OPTS := -machine virt \
		-nographic \
		-bios default \
		-kernel $(UCOREIMG)

.PHONY: qemu
qemu: $(UCOREIMG) $(SWAPIMG) $(SFSIMG)
	$(V)$(QEMU) $(QEMU_OPTS)

.PHONY: qemu_gdb
qemu_gdb: $(UCOREIMG) $(SWAPIMG) $(SFSIMG)
	$(V)$(QEMU) $(QEMU_OPTS) -S -gdb tcp::3117


GRADE_GDB_IN	:= .gdb.in
GRADE_QEMU_OUT	:= .qemu.out


.PHONY: clean
clean:
	$(V)$(RM) $(GRADE_GDB_IN) $(GRADE_QEMU_OUT) cscope* tags
	-$(RM) -r $(OBJDIR) $(BINDIR) $(TEST_RESULTS_DIR)

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
check: $(UCOREIMG) $(SWAPIMG) $(SFSIMG)
	$(AVOCADO) run $(AVOCADO_RUN_PARAMS) $(TEST_REFERENCES)

.PHONY: marking
marking: check

.PHONY: always
always:

$(BINDIR):
	$(V)$(MKDIR) $(BINDIR)

CHANGED_FILES_LIST = $(BINDIR)/changed_files.txt
$(CHANGED_FILES_LIST): always .base_git_ref $(BINDIR)
	$(file >$@.allow_list)
	$(foreach f,$(ALLOW_FILE_LIST),$(file >> $@.allow_list,$f))
	$(V)git diff --numstat $(file <.base_git_ref) -- | cut -f3 > $@.all
	$(V)grep -v -f $@.allow_list $@.all > $@ \
	|| (if [[ $$? -gt 1 ]]; then $(RM) $@.allow_list $@.all; exit 2; fi \
	&& $(RM) $@.allow_list $@.all)

.PHONY: diff_check
diff_check: $(CHANGED_FILES_LIST)
	$(V)if [[ -s $(CHANGED_FILES_LIST) ]]; then \
		echo Unexpected changes in the followings; \
		echo; \
		cat $(CHANGED_FILES_LIST); \
		echo; \
		exit 1; \
	fi
