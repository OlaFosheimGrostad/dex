Dex - an experimental D compiler with extensions
================================================

Version 0.0.1 gamma. Work in progress.

Based on [LDC](https://wiki.dlang.org/LDC).

Building
--------
Requires CMake, Clang, LLVM 11 and a D compiler.


Dex Syntax
============

Dex accept regular .d files with regular D syntax and optional additional syntax.


Additions
---------

Optional Dex | Regular D
---|---
`for … {…}`  | `for (…) {…}`
`foreach … {…}`  | `foreach (…) {…}`
`while … {…}`  | `while (…) {…}`
`if … {…}`  | `if (…) {…}`
`symbol‹…›` | `symbol!(…)`
`x ⟵ expr` | `x = expr`
`symbol ≡ type` | `alias symbol = type`
`x ≤ y` | `x <= y`
`x ≥ y` | `x >= y`
`x ≠ y` | `x != y`

Strict Dex Syntax
-----------------

TODO (implemented, but not commited)

For files ending in .dex some of the regular D alternatives are not available and you also get this:

Strict Dex |  D
-----------|----
`x = y` | `x == y`
