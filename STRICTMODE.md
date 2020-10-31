# Dex Language Reference

Applies to files ending with `.dex`.

Work in progress..


## D constructs that are not available in Dex mode

Builtin associative arrays.

Auto-decode.

Alias this. Will be replaced with single inheritance.

## D syntax that is not available in Dex mode or has changed meaning
`=`, `==` , `!=`,  `!…`, `…?…:…`, `&&`, `||`, `<=`, `>=`, `…&…`, ,`…\|…`, `$`

## TODO: Semantics
Overflow on unigned integers is undefined behaviour, except for shift left. Detected at runtime in sanitization builds.

A new `proxy aggregate` for writing smart pointers. In order to access the internals of the proxy object it has to be dereferenced using a deproxy-operator. All other operations work on the referenced object.

## TODO: Syntax

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
`#a`| `a.length`
`a[#-1]` | `a[$-1]`


## TODO: Sequence to Comma Separated List

Optional Dex | Regular D | Comment
-------------|----------|----
`f(a[$]),…` | `f(a[0]), f(a[1]), …` | expands until a is out of index
`(a[$*2]+ba[$*2+1]),…` | `a[0]+b[1], a[2]+b[3], …` | expands until either a or b is out of index
`a[$],b[$],…` | `a[0],b[0],a[1],b[1], …` | expands until either a or b is out of index


