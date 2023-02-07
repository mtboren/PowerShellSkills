# Here-strings

## What Is It
> A here-string is a single-quoted or double-quoted string surrounded by at signs (@). Quotation marks within a here-string are interpreted literally.

\- from https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules#here-strings
- lots of languages have them -- they are a.k.a. "heredoc", "herestring", "here-string", more; see https://en.wikipedia.org/wiki/Here_document when curious

## When To Use
- useful for some in-line string that may have quotes within it, and for multi-line string
    - HTML output template
- have seen in some inception coding / meta-programming (if ever doing so; good for haX0rs)
    - SSL Config .ini file for generating new CSR

## When Not To Use
- mostly, just "use sparingly"; you may have made it this far without them
- bigger or structured data, just use native file format (JSON, YAML, PSD1, XML, HTML, CSV, whatever)
