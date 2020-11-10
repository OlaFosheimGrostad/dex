# Dex Strict Mode

Applies to files ending with `.dex`.

## D constructs that are not available in Dex mode

Builtin associative arrays.

Alias this. Will be replaced with single inheritance.

## D syntax that is not available in Dex mode or has changed meaning
No longer in use:  `!=`,  `!…`, `…?…:…`, `&&`, `||`, `<=`, `>=`, `…&…`, ,`…\|…`

New meaning: `=`, `==`

New keywords: `and`, `or`, `not`

## TODO: Semantics
Overflow on unigned integers is undefined behaviour, except for shift left. Detected at runtime in sanitization builds.

A new `proxy aggregate` for writing smart pointers. In order to access the internals of the proxy object it has to be dereferenced using a deproxy-operator. All other operations work on the referenced object.

## TODO: Syntax

Strict Mode Syntax| Regular D
-----------|----------
`x = y`  | `x == y`
`«if»`   | identifier "if"
`a and b`| `a && b`
`a or b` | `a \|\| b`
`not a`  | `!a`
`a == b` | `a is b`
`a ≠≠ b` | `a !is b`
`e1 if e else e2`|`e ? e1 : e2`



