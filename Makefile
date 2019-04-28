CFLAGS = -g
.PHONY: all test
foo = $(bar)
bar = $(ugh)
ugh = Huh?

.SUFFIXES: .rb

al: vm.c
	$(CC) vm.c -o vm
	./vm

OBJEXT = so

ab: f
	echo ab

foo := $(call $(2) $(1), a, b)

f: *.c
	echo test

a.o: b

dirs := a b c d
files := $(foreach dir,$(dirs),$(wildcard $(dir)/*))

pathsearch = $(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(PATH)))))

LS := $(call pathsearch,make)

size = $(words hello make-a-ruby)
ifeq (0,0)
test:
	echo $(config_args)
endif


#%.o: %.c
# %::;


# .DEFAULT:
# 	touch $@
