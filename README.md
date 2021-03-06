# Dex - an experimental compiler

Version 0.0.1 gamma. Work in progress.

Dex is a a compiler with a unicode syntax. 

Goals:
- Avoid symbolic ambiguity. 
- Allow a level of terseness while improving legibility for experienced programmers.
- Greater expressiveness.
- Semantic improvements.

Dex source code uses the `.dex` file extension. The compiler allows mixing regular [D](http://dlang.org/) source files with `.d` extensions and Dex source code.

Dex is based on [LDC](https://wiki.dlang.org/LDC) and currently has the same semantics.

## Building

Requires CMake, Clang, LLVM 11 and a D compiler.

## Dex Code Example

```
import std.stdio, std.conv;
print ≡ writeln;

void main(){
   for int i⟵0; i ≤ 100; i++ {
      if 3 < i ≤ 10 {
        auto s ⟵ to‹string›(i);
        print(s);
      }
   }
}
```

## Syntax

The syntax currently mimics the regular D syntax with the following changes:

Dex syntax | D syntax
-------------|----------
`for … {…}`  | `for (…) {…}`
`foreach … {…}`  | `foreach (…) {…}`
`while … {…}`  | `while (…) {…}`
`if … {…}`  | `if (…) {…}`
`symbol‹…›` | `symbol!(…)`
`expr1 = expr2` | `expr1 == expr2`
`expr1 ≠ expr2` | `expr1 != expr2`
`x ⟵ expr` | `x = expr`
`symbol ≡ type` | `alias symbol = type`
`x = y` | `x == y`
`x ≠ y` | `x != y`
`obj1 == obj2` | `obj1 is obj2`
`obj1 ≠≠ obj2` | `obj1 !is obj2`
`x ≤ y` | `x <= y`
`x ≥ y` | `x >= y`
`a < b < c`   | `a < b && b < c`
`a < b ≤ c`   | `a < b && b <= c`
`a ≤ b < c`   | `a <= b && b < c`
`a ≤ b ≤ c`   | `a <= b && b <= c`
`«if»`   | identifier "if"


## Under Consideration (Todo)

Dex Syntax| D syntax
-----------|----------
`⟨0,3⟩` | `tuple(0,3)`
`a · b`| `a * b`
`a and b`| `a && b`
`a or b` | `a \|\| b`
`not a`  | `!a`
`e1 if e else e2`|`e ? e1 : e2`
`x ⟻ expr` | `auto x = expr` 
`T1 :=: T2` | `is(T1==T2)` 
`B <: A`   | `is(B:A)`
`¬e`| `~e`
`a ∨ b`| `a \| b`
`a ∧ b`| `a & b`
`a ⊻ b`| `a ^ b`
`a ⊼ b`| `~(a&b)`
`a ⊽ b`| `~(a\|b)`
`f()→int{ return 42; }` | `int f(){ return 42;}` 
`x,y:int;` | `int x,y;` 
`§int‹T›` | `__trait(isIntegral,T)`
`§fp‹T›` | `__trait(isFloating,T)`
`§scalar‹T›` | `__trait(isScalar,T)`
`§unsigned‹T›` | `__trait(isUnsigned,T)`
`§array‹T›` | `__trait(isStaticArray,T)`
`a (+) b` | modular a + b for unsigned integers



