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

| Rank | Code  | Error Category |
|-----:|-------|----------------|
|    1 | e1001 | `<x>` undeclared `<...>` |
|    2 | e1002 | expected `<x>` before `<y>` |
|    3 | e1007 | stray `<x>` in program |
|    4 | e1004 | expected expression before `<x>` |
|    5 | e1010 | unknown type name `<x>` |
|    6 | e1005 | expected declaration or statement at end of input |
|    7 | e1008 | expected identifier or `(` before `<x>` |
|    8 | e1006 | expected `=`, `,`, `;`, `asm`, `__attribute__` before `<x>` |
|    9 | e1023 | request for member in something not a structure or union |
|   10 | e1044 | expected declaration specifiers or '...' before `<x>` |
|   11 | e1012 | `<x>` has no member named `<y>` |
|   12 | e1003 | undefined reference to `<x>` |
|   13 | e1013 | invalid type argument of `<...>` |
|   14 | e1030 | expected `<x>` before `<...>` constant |
|   15 | e1017 | too few arguments to function `<x>` |
|   16 | e1011 | lvalue required as `<...>` |
|   17 | e1022 | expected declaration specifiers or '...' before `<...>` constant  |
|   18 | e1034 | expected declaration specifiers before `<x>` |
|   19 | e1015 | missing terminating `<x>` character |
|   20 | e1020 | redefinition of `<x>` |

# Notes

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
