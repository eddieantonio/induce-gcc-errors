CC = gcc-12

# c++ animals.cc -fdiagnostics-color=always 2>&1 | aha --no-header | pbcopy
# gcc-12 example.c -fdiagnostics-color=always 2>&1 | aha --no-header | pbcopy
# tsc example.ts --pretty 2>&1 | aha --no-header | pbcopy
# rustc example.rs --color=always 2>&1 | aha --no-header | pbcopy

SOURCES := $(wildcard *.c)
OUTPUTS = $(SOURCES:.c=.html) $(SOURCES:.c=.txt)

all: $(OUTPUTS)

%.html: %.c
	gcc-12 $< -o/dev/null -fdiagnostics-color=always 2>&1 | aha --no-header > $@

%.txt: %.c
	gcc-12 $< -o/dev/null 2>&1 | tee $@


clean:
	$(RM) $(wildcard *.html) $(wildcard *.txt)
