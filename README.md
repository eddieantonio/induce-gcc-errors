Trying to induce the top 20 errors from Cormac Murray's 2019 MSc Thesis.

# Errors

1. e1001: _`<x>` undeclared (first use in this function)._
2. e1002: _expected `<x>` before `<y>`_
3. e1007: _stray `<x>` in program_ (try `$`?)
4. e1004: _expected expression before `<x>`_
5. e1010: _unknown type name `<x>`_
6. e1005: _expected declaration or statement at end of input_
7. e1008: _expected identifier or `(` before `<x>`_
8. e1006: _expected `=`, `,`, `;`, `asm`, `__attribute__` before `<x>`_
9. e1023: _request for member in something not a structure or union_ (try `.foo`)
10. e1044: _expected declaration specifiers or '...' before `<x>`_
11. e1012: _`<x>` has no member named `<y>`_
12. e1003: _undefined reference to `<x>`_
13. e1013: _invalid type argument of `<...>`_
14. e1030: _expected `<x>` before `<...>` constant_
15. e1017: _too few arguments to function `<x>`_
16. e1011: _lvalue required as `<...>`_ (try `1 = x`?)
17. e1022: _expected declaration specifiers or '...' before `<...>` constant_
18. e1034: _expected declaration specifiers before `<x>`_
19. e1015: _missing terminating `<x>` character_ (try open character literal?)
20. e1020: _redefinition of `<x>`_

---

21. `<x>: No such file or directory`

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