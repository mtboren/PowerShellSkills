# PowerShell Modules
Some information about the constructs from which we receive all the things in PowerShell -- Modules!

The contents:
- Description / Diagram / Components
- Usage
    - `Find`, `Install`, `Uninstall`
    - `Import`, `Remove`
    - as parameter `-Module`
- Creation
    - write functions
    - make code to write/update module manifest
    - `Publish`
- Reference:
    - about_modules
    - Writing a Windows PowerShell Module

## Description / Diagram / Components
PowerShell modules, like modules that you might be familiar with in other languages, are ways to package/share/version some resource(s). Nearly everything that we use/call/leverage in PowerShell comes from a module. There are other ways to "get" new things, like via published _scripts_, but we'll leave those out as a minor use case.

"Nearly everything" includes cmdlets, functions, aliases, providers, completers, formatters, help, etc.

PowerShell modules, of what they are made:

![An artist's rendition of PowerShell modules, of what they are made](./resources/PowerShellModule-WhatIsIt.svg)

PowerShell modules, from where we find/install/import them, etc: ![An artist's rendition of PowerShell modules, from where we find/install/import them, etc](./resources/PowerShellModule-Consumption.svg)
