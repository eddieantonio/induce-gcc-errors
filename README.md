# C errors

This repository induces the top 20 C error messages from Cormac Murray's
2019 MSc Thesis.

# How to use

You will need:

 - gcc-12
 - [aha](https://github.com/theZiz/aha) (to generate coloured HTML)

Then run:

    make

# Errors

This list of errors comes from §8.1.2 (page 92) from Cormac's thesis.
The "e" codes were invented for the purposes of the thesis. The errors
are ranked from most frequently occurring to least frequently occurring.
These are messages that appear at ANY level in the output (not just the
first error message).

I used gcc-12 on macOS, but I believe Cormac's errors come from an
Ubuntu machine—thus linker errors might be formatted differently.

| Rank | Code  | Kind       | Error Category |
|-----:|-------|------------|---------------|
|    1 | e1001 | Compiler   | `<x>` undeclared `<...>` |
|    2 | e1002 | Compiler   | expected `<x>` before `<y>` |
|    3 | e1007 | Compiler   | stray `<x>` in program |
|    4 | e1004 | Compiler   | expected expression before `<x>` |
|    5 | e1010 | Compiler   | unknown type name `<x>` |
|    6 | e1005 | Compiler   | expected declaration or statement at end of input |
|    7 | e1008 | Compiler   | expected identifier or `(` before `<x>` |
|    8 | e1006 | Compiler   | expected `=`, `,`, `;`, `asm`, `__attribute__` before `<x>` |
|    9 | e1023 | Compiler   | request for member in something not a structure or union |
|   10 | e1044 | Compiler   | expected declaration specifiers or '...' before `<x>` |
|   11 | e1012 | Compiler   | `<x>` has no member named `<y>` |
|   12 | e1003 | Linker     | undefined reference to `<x>` |
|   13 | e1013 | Compiler   | invalid type argument of `<...>` |
|   14 | e1030 | Compiler   | expected `<x>` before `<...>` constant |
|   15 | e1017 | Compiler   | too few arguments to function `<x>` |
|   16 | e1011 | Compiler   | lvalue required as `<...>` |
|   17 | e1022 | Compiler   | expected declaration specifiers or '...' before `<...>` constant  |
|   18 | e1034 | Compiler   | expected declaration specifiers before `<x>` |
|   19 | e1015 | Compiler   | missing terminating `<x>` character |
|   20 | e1020 | Compiler   | redefinition of `<x>` |
|   21 | e1009 | Invocation | `<x>`: No such file or directory |
|   22 | e1014 | Compiler   | conficting types for `<x>` |

# Notes

There are 20 _compiler_ errors, but a _linker_ error and an _invocation_
error are within the top 22 messages recorded within Cormac's list. It
might be undesirable to mix linker and invocation errors, so I have
collected the top 22 messages from the list.

## e1034: expected declaration specifiers before 'if'

I have absolutely no idea how to get this without a cascading error. This error message can be induced by writing a statement after the function declaration, but missing the opening curly brace for a function definition.

```
18-e1034.c: In function 'main':
18-e1034.c:2:5: error: expected declaration specifiers before 'if'
    2 |     if (argc == 1)
      |     ^~
18-e1034.c:4: error: expected '{' at end of input
```

## e1003: undefined reference to `<x>`

This is a linker error, and as such, is dependent on the platform's linker. I have committed the version from a glibc-style linker.


## e1015: missing terminating " character

I cannot seem to get this without:

 1. a warning with the same message
 2. a cascading error, due to error recovery
