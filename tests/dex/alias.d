import std.stdio;


alias strarr = string[];
alias dump   = writeln;


struct vec(T,N) {
    T[N] data;
}

alias floats(N) = vec!(float,N); 

void main(strarr args) {
    dump("It works!");
}
