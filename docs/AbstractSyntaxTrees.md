# PowerShell, Abstract Syntax Tree
PowerShell uses something called an Abstract Syntax Tree ("AST") for its inner workings. Per Wikipedia, AST in computer science is:
> a tree representation of the abstract syntactic structure of text (often source code) written in a formal language

-- https://en.wikipedia.org/wiki/Abstract_syntax_tree

The tree is a data structure used to represent the structure / elements of the code, for further consumption by \<hopefully something useful> (like a compiler, a interpreter, or possibly other code that then does cool stuff with the representation of the initial code)

## Exploring, General
To see some graphical, interactive representations of AST in the flesh, see the [AST Explorer](https://astexplorer.net/) site. There we can get a feel for the AST data structure / representation of some input code

## Exploring, PowerShell
We can use the AST to see things about our code, get a feel for how and when things happen in our code, etc.  The applications are bound by our imagination / creativity, but enable us to programmatically interact with out code itself.

Some examples:
- code inspection for injection detection
- pipeline inspection for development / troubleshooting cmdlet paramenter binding
- tools for static analysis (editors with realtime analysis)
- geeking out
