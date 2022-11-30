CC = gcc-12

# c++ animals.cc -fdiagnostics-color=always 2>&1 | aha --no-header | pbcopy
# gcc-12 example.c -fdiagnostics-color=always 2>&1 | aha --no-header | pbcopy
# tsc example.ts --pretty 2>&1 | aha --no-header | pbcopy
# rustc example.rs --color=always 2>&1 | aha --no-header | pbcopy

SOURCES := $(wildcard *.c)
HTMLS = $(SOURCES:.c=.html) 
TXTX = $(SOURCES:.c=.txt)

all: $(HTMLS) $(TXTS) index.html

index.html: $(HTMLS)
	./make-index.py > $@

%.html: %.c
	gcc-12 $< -o/dev/null -fdiagnostics-color=always 2>&1 | aha --no-header | ./fix-html.sh > $@

%.txt: %.c
	gcc-12 $< -o/dev/null 2>&1 | tee $@

# Special cases:

# Do not rebuild these from the .c file.
12-e1003.html 12-e1003.txt:
	true
