import std.stdio;


alias strarr1 = string[];
strarr2 ≡ string[];
dump   ≡ writeln;


struct vec‹T,N› {
    T[N] data;
}

floats‹N› ≡ vec‹float,N›; 

void main(strarr1 args) {
    dump("It works!");
}
