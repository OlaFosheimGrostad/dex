# Dex Extensions of D

## Syntax Sugar Additions

New Syntax | Regular D
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


## TODO: Semantic Changes

Undefined behaviour:
- Overflow on signed integers
- Overflow on the right operand of shift operations
- Out-of-bounds array indexing using the `a![i]` syntax
- Dereferencing of null pointers
- Infinite loop without side effects. E.g. `while(1){}`.

Sanitization builds should detect:
- Overflow on signed integers
- Overflow on the right operand of shift operations
- Out-of-bounds array indexing
- Dereferencing of null pointers

Class definition available as struct for low level non-portable programming:
`class A` becomes `struct __class_A__` or something similar.

Garbage collector does not call destructors.

All Object types have strong and weak reference counters that are used to enable deterministic destruction. 
Trace dangling pointers to interiors of Object subclasses after destruction in sanitization builds.

New Syntax | Semantics
-------------|----------
`a [+] b` | saturate a + b
`a [-] b` | saturate a - b
`§ASSUME(e)` | the compiler will assume e to always hold true

Note: `ASSUME` will run as an assert in sanitization builds, and will be removed in non-optimizing builds.

Note: `a [+] b` saturates to [0.0,1.0> for floating point.

## TODO: Syntax Sugar Additions

New Syntax | Regular D
-------------|----------
`⊦e`  | `assert(e)` but as a verification hint
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
`a ∨ b`| `a \| b`
`a ∧ b`| `a & b`
`a ⊻ b`| `a ^ b`
`a ⊼ b`| `~(a&b)`
`a ⊽ b`| `~(a\|b)`
`a ⤺ b`| `a << b`
`a ⤻ b`| `a >> b`
`a ⤺ b ⤙ c`| `(a << b)\|(c>>(32-b))`
`c ⤚ a ⤻ b`| `(a >> b)\|((c<<(32-b))&((1<<b)-1))` for unsigned
`a ⤺? b`| `b&~0x1f ? 0 : a << b`
`a ⤻? b`| `b&~0x1f ? (a<0 ? -1 : 0) : a >> b`
`∂x` | illegal identifier
`∞` | illegal identifier
`∅` | illegal identifier
`§int‹T›` | `__trait(isIntegral,T)`
`§fp‹T›` | `__trait(isFloating,T)`
`§scalar‹T›` | `__trait(isScalar,T)`
`§unsigned‹T›` | `__trait(isUnsigned,T)`
`§array‹T›` | `__trait(isStaticArray,T)`
`if e?.a {}` | `if (e !is null && e.a) {}`
`obj?.a?.b ⟵ e;` | `if (obj !is null && obj.a !is null) obj.a.b = e;`
`obj?.a?.f(…);` | `if (obj !is null && obj.a !is null) obj.a.f(…);`
`((a * b + c))` | multiply add a*b+c
`(+ a,b,c,…)` | `((a+b)+c)+…`
`(* a,b,c,…)` | `((a*b)*c)*…`
`(∧ a,b,c,…)`| `((a&b)&c)&…`
`(∨ a,b,c,…)`| `((a\|b)\|c)\|…`
`(⊻ a,b,c,…)`| `((a^b)^c)^…`
`(= a,b,c,…)` | `(a==b)&&(b==c)&&…`
`(≠ a,b,c,…)` | `(a!=b)&&(b!=c)&&…`
`(< a,b,c,…)` | `(a<b)&&(b<c)&&…`
`(≤ a,b,c,…)` | `(a≤b)&&(b≤c)&&…`
`(a < b,c,…)` | `(a<b)&&(a<c)&&…`
`(a ≤ b,c,…)` | `(a≤b)&&(a≤c)&&…`
`(a > b,c,…)` | `(a>b)&&(a>c)&&…`
`(a ≥ b,c,…)` | `(a≥b)&&(a≥c)&&…`
`(? a < b,c,…)` | `(a<b)\|\|(a<c)\|\|…`
`(? a ≤ b,c,…)` | `(a≤b)\|\|(a≤c)\|\|…`
`(? a > b,c,…)` | `(a>b)\|\|(a>c)\|\|…`
`(? a ≥ b,c,…)` | `(a≥b)\|\|(a≥c)\|\|…`
`a (+) b` | modular a + b for unsigned integers
`a (-) b` | modular a - b for unsigned integers
`a (*) b` | modular a * b for unsigned integers

Note: Shift operations above are given for 32 bit integers, but also applies to other bit sizes.


## TODO: New Operators

New Syntax | Regular D
-------------|----------
`√e` | opUnary!"√"
`∛e` 	| opUnary!"∛"
`∜e` 	| opUnary!"∜"  
`n√e` | opBinary!"√"
`a · b` | opBinary!"·"
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
'a ✕ b' | opBinary!"✕"
'a ⊕ b' | opBinary!"⊕"
'a ⊖ b' | opBinary!"⊖"
'a ⊗ b' | opBinary!"⊗"
'a ⊘ b' | opBinary!"⊘"
'a ⊙ b' | opBinary!"⊙"
'a ⊡ b' | opBinary!"⊡"
