# Dex - an experimental compiler

Version 0.0.1 gamma. Work in progress.

Dex is a a compiler with a unicode syntax. The goal is to avoid ambguitiy, make the source code terse, but easy to grasp for the experienced programmer.

Dex source code uses the `.dex` file extension. The compiler allows you to mix regular [D](http://dlang.org/) source files with `.d` with Dex source code.

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
        string s⟵to‹string›(i);
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
`obj1 == obj2` | `obj1 is obj2`
`obj1 ≠≠ obj2` | `obj1 !is obj2`
`x ≤ y` | `x <= y`
`x ≥ y` | `x >= y`
`x ≠ y` | `x != y`
`a < b < c`   | `a < b && b < c`
`a < b ≤ c`   | `a < b && b <= c`
`a ≤ b < c`   | `a <= b && b < c`
`a ≤ b ≤ c`   | `a <= b && b <= c`

