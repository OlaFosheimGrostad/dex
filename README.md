Dex - an experimental D compiler with extensions
================================================

Version 0.0.1 gamma. Work in progress.

Based on [LDC](https://wiki.dlang.org/LDC).

Building
--------
Requires CMake, Clang, LLVM 11 and a D compiler.


Dex Syntax
============

Dex accept regular `.d` files with regular D syntax and optional additional syntax.


Syntax Sugar Additions
----------------------

Optional Dex | Regular D
-------------|----------
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

TODO: Semantic Changes
----------------------
Overflow on signed integers are overflow.
Trace overflow in sanitization builds.

Class decl available as structs.

Garbage collector does not call destructors.
All Object types have strong and weak reference counters that are used to enable deterministic destruction. 
Trace dangling pointers to interiors of Object subclasses after destruction in sanitization builds.

TODO:Additions
--------------
Optional Dex | Regular D
-------------|----------
`B ≤: A`   | `is(B:A)`
`B :=: A`  | `is(B==A)`
`B <: A`   | `is(B:A) && !is(B==A)`
`b ≤: a`   | `typeid(a).isBaseOf(typeid(b))` , a and b can be type/object
`b :=: a`  | `typeid(a) == typeid(b)` , a and b can be type/object
`b <: a`   | `typeid(a) != typeid(b) && typeid(a).isBaseOf(typeid(b))` , a and b can be type/object
`∂x` | illegal identifier
`∞` | illegal identifier
`∅` | illegal identifier

TODO: New Operators
------------------
Optional Dex | Regular D
-------------|----------
'√e' | opUnary!"√"
'a · b' | opBinary!"·"
'a ≈ b' | opBinary!"≈"
'a ≉ b' | opBinary!"≉"
'a ∩ b' | opBinary!"∩"
'a ∪ b' | opBinary!"∪"
'a ⊂ b' | opBinary!"⊂"
'a ⊃ b' | opBinary!"⊃"
'a ⊄ b' | opBinary!"⊄"
'a ⊅ b' | opBinary!"⊅"
'a ⊆ b' | opBinary!"⊆"
'a ⊇ b' | opBinary!"⊇"
'a ⊈ b' | opBinary!"⊈"
'a ⊉ b' | opBinary!"⊉"
'a ∈ b' | opBinary!"∈"
'a ∉ b' | opBinary!"∉"
`⊦e`  | `assert(e)`

Other binary operators to consider:
`✕ ⊕	⊖	⊗	⊘	⊙	⊚	⊛ ∧	∨ ⊻`
, and unary: `¬` .


Strict Dex mode
===============
Applies to files ending with `.dex`.

TODO: Semantics
---------------
Overflow on unigned integers is undefined behaviour.

TODO: Syntax
----------------------

Strict Dex | Regular D
-----------|----------
`x = y`  | `x == y`
`«if»`   | identifier "if"
`a and b`| `a && b`
`a or b` | `a \|\| b`
`not a`  | `!a`
`a == b` | `a is b`
`a ≠≠ b` | `a !is b`
`a (+) b` | modular a + b for unsigned int
`a (-) b` | modular a - b for unsigned int
`a (*) b` | modular a * b for unsigned int
`a [+] b` | saturate a + b
`a [-] b` | saturate a - b
