Dex - an experimental D compiler with extensions
================================================

Version 0.0.1 gamma. Work in progress.

Based on [LDC](https://wiki.dlang.org/LDC).

Building
--------
Requires CMake, Clang, LLVM 11 and a D compiler.


Syntax and Semantics Additions
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
Overflow on signed integers is undefined behaviour. 
Overflow on the right operand of shift operations is undefined behaviour. 
Detected at runtime in sanitization builds.

Class definition available as struct for low level non-portable programming.

Garbage collector does not call destructors.

All Object types have strong and weak reference counters that are used to enable deterministic destruction. 
Trace dangling pointers to interiors of Object subclasses after destruction in sanitization builds.

TODO:Syntax Sugar
--------------
Optional Dex | Regular D
-------------|----------
`a < b < c`   | `a < b && b < c`
`a < b ≤ c`   | `a < b && b <= c`
`a ≤ b < c`   | `a <= b && b < c`
`a ≤ b ≤ c`   | `a <= b && b <= c`
`B ≤: A`   | `is(B:A)`
`B :=: A`  | `is(B==A)`
`B <: A`   | `is(B:A) && !is(B==A)`
`b ≤: a`   | `typeid(a).isBaseOf(typeid(b))` , a and b can be type/object
`b :=: a`  | `typeid(a) == typeid(b)` , a and b can be type/object
`b <: a`   | `typeid(a) != typeid(b) && typeid(a).isBaseOf(typeid(b))` , a and b can be type/object
`¬e`| `~e`
`a ∧ b`| `a & b`
`a ∨ b`| `a | b`
`a ⊻ b`| `a ^ b`
`a ⤺ b`| `a << b`
`a ⤻ b`| `a << b`
`a ⤺? b`| `b&~0x1f ? 0 : a << b`
`a ⤻? b`| `b&~0x1f ? (a<0 ? -1 : 0) : a >> b`
`a ⟲ b`| bitwise rotate left
`a ⟳ b`| bitwise rotate right
`a ∨⤺ b` | `a|(1<<b)`
`a ∧⤺ b` | `a&~(1<<b)`
`a ⊻⤺ b` | `a^(1<<b)`
`«+»(a,b,c,…)` | `((a+b)+c)+…`
`«-»(a,b,c,…)` | `((a-b)-c)-…`
`«*»(a,b,c,…)` | `((a*b)*c)*…`
`«∧»(a,b,c,…)`| `((a&b)&c)&…`
`«∨»(a,b,c,…)`| `((a|b)|c)|…`
`«∨»(a,b,c,…)`| `((a|b)|c)|…`
`«⊻(a,b,c,…)»`| `((a^b)^c)|…`
`«=»(a,b,c,…)` | `(a==b)&&(b==c)&&…`
`«=?»(a,b,c,…)` | `(a==b)||(b==c)||…`
`«≠»(a,b,c,…)` | `(a!=b)&&(b!=c)&&…`
`«≠?»(a,b,c,…)` | `(a!=b)||(b!=c)||…`
`∂x` | illegal identifier
`∞` | illegal identifier
`∅` | illegal identifier
`§int‹T›` | `__trait(isIntegral,T)`
`§fp‹T›` | `__trait(isFloating,T)`
`§scalar‹T›` | `__trait(isScalar,T)`
`§unsigned‹T›` | `__trait(isUnsigned,T)`
`§array‹T›` | `__trait(isStaticArray,T)`
`a[#-1]` | `a[$-1]`
`…,f(a[$$])...` | `…,f(a[0]), f(a[1]), …` until out of index

Note: Shift operations above are given for 32 bit integers, but also applies to other bit sizes.

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

Other binary operators to consider: `✕ ⊕	⊖	⊗	⊘	⊙	⊚	⊛ `.


Strict Dex mode
===============
Applies to files ending with `.dex`.

D constructs that are not available in Dex mode
-----------------------------------------------

Builtin associative arrays.

Auto-decode.

Alias this. Will be replaced with single inheritance.

D syntax that is not available in Dex mode or has changed meaning
-----------------------------------------------------------------
`=`, `==` , `!=`,  `!…`, `…?…:…`, `&&`, `||`, `<=`, `>=`

TODO: Semantics
---------------
Overflow on unigned integers is undefined behaviour, except for shift left. Detected at runtime in sanitization builds.

A new `proxy aggregate` for writing smart pointers. In order to access the internals of the proxy object it has to be dereferenced using a deproxy-operator. All other operations work on the referenced object.


Strict Dex | Semantics
-----------|----------
`a (+) b` | modular a + b for unsigned integers
`a (-) b` | modular a - b for unsigned integers
`a (*) b` | modular a * b for unsigned integers
`a [+] b` | saturate a + b
`a [-] b` | saturate a - b
`§ASSUME(e)` | the compiler will assume e to always hold true

Note: `ASSUME` will run as an assert in sanitization builds, and will be removed in non-optimizing builds.

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
`e1 if e else e2`|`e ? e1 : e2`
`if e?.a {}` | `if (e !is null && e.a) {}`
