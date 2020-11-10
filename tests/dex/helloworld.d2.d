import std.stdio;

void main(string[] args)
{
    const hellotext = "hello world";
    if (args.length == 1) {
        writeln(hellotext);
    } 
    if (args.length != 1) {
        writeln("Har argumenter!");
    }
}
