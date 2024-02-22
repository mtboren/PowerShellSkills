# PowerShell Skills and More
Some things related to various PowerShell skills, like debugging, module development, general PowerShell session capabilities, etc.

Also, various tangential topics that makes us even better.

Topics:
- [General Exploration](docs/GeneralExploration.ipynb): General things about PowerShell
- [🌳Abstract Syntax Tree](docs/AbstractSyntaxTrees.md): A bit on data structures used to represent the structure / elements of the code
- [🐛Debugging](docs/Debugging.md): Getting going with debugging in PowerShell
- (_older_) [👴Getting going with JupyterLab and notebooks](docs/JupyterLabAndNotebooks-GettingStarted.ipynb):  For when you want to make notebooks with interactive code cells along with your Markdown, go-o-o-o, Jupyter! Applies to PowerShell and \<lotsa other supported languages>
- [👩‍💻Getting going with Polyglot Jupyter Notebooks, .NET Interactive](docs/JupyterAndPolyglotNotebooks-GettingStarted.ipynb):  The modern way to make notebooks with interactive code cells, and in lots of programming languages (all at the same time, if desired!)
- [📊Graphing and Plotting, Jupyter and ScottPlot](docs/PlottingWithScottPlot.ipynb): Using a plotting package with PowerShell and Jupyter in VSCode Polyglot notebooks
- [🙋‍♀️Make Help for your functions/cmdlets/modules](docs/MakePowerShellHelp.md): Make help for the world!
- [Maximize Reuse](docs/MaximizeReuse.ipynb): Info about maximizing the value of artifacts we create by maximizing ease of reuse
- [Modules in PowerShell](docs/PowerShellModules.md): Where we get commands (and lots else) in PowerShell
- [Parameter Validation for Functions](docs/FunctionParameterInputValidation.ipynb): Set us all up for success, and most easily, by using standard parameter validation for our functions, scripts, cmdlets, etc
- [PowerShell File Types](docs/PowerShellFileTypes.md): Info about types of files used in PowerShell
- [PowerShell Here-strings](./docs/Here-Strings.md): Here-strings in PowerShell -- nearly no need for StringBuilders!
- [PowerShell Output Streams](docs/PowerShellOutputStreamsAndTranscription.ipynb): Return rich objects, and use other PowerShell output streams for the human-readable story (logging/transcription)
- [Regular Expressions](docs/RegularExpressions.ipynb): If you absolutely must, delve into the whacky world of string beasts as truths, and using RegEx to try to tame the dragon 🐲
- [Supporting Confirmation](docs/SupportingShouldProcess.ipynb): Supporting `-Confirm` / requesting confirmation the PowerShell way (via `SupportsShouldProcess` in [`CmdletBinding`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute) attribute); also, support `-WhatIf` in the same way
- [🧪Testing with Pester](docs/TestingWithPester.ipynb): Some info about what, how, and why for some testing (with Pester) and behavior-driven development mindset