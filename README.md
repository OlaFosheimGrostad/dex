Dexperiment - a d compiler with extensions
==========================================

Version 0.0.1 gamma. Work in progress.

Based on [LDC](https://wiki.dlang.org/LDC).

Building
--------
Requires CMake, Clang, LLVM 11 and a D compiler.


Syntax modifications (
==========================================

`for … {…}`  => `for (…) {…}`

`while … {…}`  => `for (…) {…}`

`if … {…}`  => `for (…) {…}`

`symbol‹…›` => `symbol!(…)`

`x ⟵ expr` => `x = expr`

`symbol ≡ expr` => `alias symbol = expr`

`x ≤ y` => `x <= y`

`x ≥ y` => `x >= y`

`x ≠ y` => `x != y`
