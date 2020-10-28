Dex - an experimental D compiler with extensions
================================================

Version 0.0.1 gamma. Work in progress.

Based on [LDC](https://wiki.dlang.org/LDC).

Building
--------
Requires CMake, Clang, LLVM 11 and a D compiler.


Syntax additions
================
Dex | D
---|---
`for … {…}`  | `for (…) {…}`
`foreach … {…}`  | `foreach (…) {…}`
`while … {…}`  | `while (…) {…}`
`if … {…}`  | `if (…) {…}`
`symbol‹…›` | `symbol!(…)`
`x ⟵ type expr` | `x = type expr`
`symbol ≡ expr` | `alias symbol = expr`
`x ≤ y` | `x <= y`
`x ≥ y` | `x >= y`
`x ≠ y` | `x != y`
