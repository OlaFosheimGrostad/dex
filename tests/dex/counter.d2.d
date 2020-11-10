import std.stdio;

void main(string[] args) {
    for(int i=0; i<=4; i++) {
        writeln("The number is ", i, ".");
        if (i >= 2) {
            writeln("Greater than 2!");
        }
    }
}
