/*
LDC: just a different error msg
DISABLED: LDC
REQUIRED_ARGS: -Xi=,!
TEST_OUTPUT:
---
Error: unknown JSON field `-Xi=,!`, expected one of `compilerInfo`, `buildInfo`, `modules`, `semantics`
       run `dmd` to print the compiler manual
       run `dmd -man` to open browser on manual
---
*/
