# PowerShell Skills
Some things related to various PowerShell skills, like debugging, module development, general PowerShell session capabilities, etc.

For starters, some general exploration, and some PowerShell debugging.

Topics:
- [General Exploration](docs/GeneralExploration.ipynb): General things about PowerShell
- [Supporting Confirmation](docs/SupportingShouldProcess.ipynb): Supporting `-Confirm` / requesting confirmation the PowerShell way (via `SupportsShouldProcess` in [`CmdletBinding`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute) attribute); also, support `-WhatIf` in the same way
- [Modules in PowerShell](docs/PowerShellModules.md): Where we get commands (and lots else) in PowerShell
- [PowerShell File Types](docs/PowerShellFileTypes.md): Info about types of files used in PowerShell
- [Make Help for your functions/cmdlets/modules](docs/MakePowerShellHelp.md): Make help for the world!
- [PowerShell Output Streams](docs/PowerShellOutputStreamsAndTranscription.ipynb): Return rich objects, and use other PowerShell output streams for the human-readable story (logging/transcription)
- [Maximize Reuse](docs/MaximizeReuse.ipynb): Info about maximizing the value of artifacts we create by maximizing ease of reuse
- [Debugging](docs/Debugging.md): Getting going with debugging in PowerShell
- [Getting going with JupyterLab and notebooks](docs/JupyterLabAndNotebooks-GettingStarted.ipynb):  For when you want to make notebooks with interactive code cells along with your Markdown, go-o-o-o, Jupyter! Applies to PowerShell and \<lotsa other supported languages>
