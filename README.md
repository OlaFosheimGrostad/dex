# Dex - an experimental compiler with D extensions

Version 0.0.1 gamma. Work in progress.

The Dex compiler currently accepts [D](http://dlang.org/) source files (`sourcefile.d`) with [language extensions](EXTENSIONS.md). 

It will later also accept an alternative language that can use D modules (`sourfile.dex`).

Dex is based on [LDC](https://wiki.dlang.org/LDC).

## Building

Requires CMake, Clang, LLVM 11 and a D compiler.


## Structure

Dex accept regular `.d` files with regular D syntax and optional additional syntax. See  for more details.

Dex will later get a new experimental syntax signified by the file extension `.dex`.  See [REFERENCE.md](REFERENCE.md) for more details.
