# Dex - an experimental compiler with D extensions

Version 0.0.1 gamma. Work in progress.

The Dex compiler currently accepts [D](http://dlang.org/) source files (`sourcefile.d`) with [language extensions](EXTENSIONS.md). 

It will later accept an alternative language that can use D modules (`sourcefile.dex`).

Dex is based on [LDC](https://wiki.dlang.org/LDC).

## Building

Requires CMake, Clang, LLVM 11 and a D compiler.

## Extended-D Code Example

```
import std.stdio, std.conv;
print ≡ writeln;

void main(){
   for int i⟵0; i ≤ 100; i++ {
      if i ≤ 10 {
        string s⟵to‹string›(i);
        print(s);
      }
   }
}
```
