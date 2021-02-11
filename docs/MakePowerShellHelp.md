# Make PowerShell Help for Functions/Cmdlets
Contents:
- [Intro](#Introduction):  **What**: Help! Make it available for your functions/cmdlets/modules, just like it is available for everything else in PowerShell
- [Quick details on help's guts](#quick-details-what-makes-help-and-how-to-add-it): **How** to create help with a few comments
- [Examples](#Examples)
- [Reading list, documentation](#Reading-list-and-documentation) The docs on how to get help, make help, have style

## Introduction
We need help, as do the people that use the functions and cmdlets that we make.  So, we should provide help with every such function/cmdlet/module that we unleash on the world, contribute to, etc.

Writing help for our functions/cmdlets/modules enables everyone to get help on these items in the same way that they get help for anything in PowerShell:  via the [`Get-Help`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/Get-Help) cmdlet that all PowerShell has (thanks to the standard module [`Microsoft.PowerShell.Core`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core) that comes with all PowerShell).

Some people even write the help for their function _before_ they write the body of the function code itself, as another step in the design phase -- what a great way to help pinpoint exactly what the function should do, how it should behave, what it should return, etc.

The help syntax itself, of course, well defined, and is there are guidelines for style, brevity, conventions, and so on, for writing PowerShell help.  See the Reading List below for links to the documentation on such things. And, as we expect, the help on the help syntax is available as a help topic within PowerShell itself, too (once again, via the `Get-Help` cmdlet -- see command below).

## Quick details: what makes help and how to add it
Comment-based help is how we can add help to our functions/cmdlets. There are also concept help files that we can compose to accompany our module, beyond function/cmdlet-specific help.

As the name tells us, we compose the help for our functions/cmdlets by adding comments that adhere to the prescribed syntax:  key words for front matter, and easy parameter help via nicely placed, standard-looking comments.

Consider this function definition for `Get-Nugglet` that includes the help for the function in the comment-based help therein:
```PowerShell
<#  .Description
    Get the important nugglets from the server based on the identity provided (nugglet name, or all)

    .Example
    Get-Nugglet
    Get all the nugglets from the connected server
#>
param(
    ## Name(s) of the nugglet(s) to get. Accepts wildcards
    [String[]]$Name
)
...
```
By placing the prescribed keywords in a block comment (get it, comment-based help?), we have now created help for the function. When someone then wonders how in the world to use this slick function, they do what they would always do:  `Get-Help`.  The help defined with the function above would give us the PowerShell help that we know and love. See [Examples](#Examples) below.

## Examples
- See [MakePowerShellHelp_Examples.ipynb](./MakePowerShellHelp_Examples.ipynb) for versions of the same script that vary in their comment-based help -- excitement!

## Reading list and documentation
- The PowerShell help for creating help in your own functions/modules:
    ```PowerShell
    Get-Help about_Comment_Based_Help
    ```
    And, the [online version](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help)
- Microsoft's [Writing Comment-Based Help Topic](https://docs.microsoft.com/en-us/powershell/scripting/developer/help/writing-comment-based-help-topics): Comment-based help syntax, placement, etc
- Microsoft's  [Writing Help for PowerShell Modules](https://docs.microsoft.com/en-us/powershell/scripting/developer/help/writing-help-for-windows-powershell-modules): Writing help topics for your whole module
- PowerShell Help output conventions, great for, "what do those square brackets mean in the help?":
    ```PowerShell
    Get-Help about_Command_Syntax
    ```
    And, the [online version](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_command_syntax)
- And, there is all kinds of interesting help to get on, well, `Get-Help`! Like, help topics/categories, displaying the help online, etc.
    ```PowerShell
    Get-Help -Full -Name Get-Help
    ```
