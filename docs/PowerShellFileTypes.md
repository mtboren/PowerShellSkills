# PowerShell File Types
There are several file types/extensions associated with PowerShell. Here is a bit of info about some of them.

## Some info
Some information about a subset of the files used in PowerShell (particulary, used in PowerShell modules)

| Extension | Brief Description |
| --------- | ----------------- |
`.ps1` | PowerShell script file (sometimes referred to a PowerSpell files); can define functions, hold configuration, etc.
`.psd1` | PowerShell Data file; most commonly used as PowerShell module manifest file, for defining attributes of the module (some items of which can also be defined/controlled via the `.psm1` module file itself)
`.psm1` | PowerShell Module file; flexible for use in PowerShell modules for defining function, initializing other things in the environment at module load time, controlling attributes of the module itself (at least one way to export resources for the PowerShell module -- functions, aliases, etc.)
`.ps1xml` | PowerShell Formats file, generally; for controlling the format of objects in various views in the PowerShell console (after they are emitted to the screen when the pipeline ends). One can also define their types in a `.ps1xml` file
`.txt` | General text, most commonly for entire-module help (like about_SomeModule help topics)

## More info
There are tidbits sprinkled about the official Microsoft documentation for these file types.  See the links here:
- Lots of goodness about components of module manifest `.psd1` files in [How to write a PowerShell module manifest](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest)
- Light info in [Module Manifests](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/understanding-a-windows-powershell-module#module-manifests) section at Microsoft Docs
- Minor info about `.psd1` files in the [Import-PowerShellDataFile](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/import-powershelldatafile) help
- Full info on `.ps1xml` formatting files in the [about_Format.ps1xml](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_format.ps1xml) help topic
- Full info on `.ps1xml` types files in the [about_Types.ps1xml](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_types.ps1xml) help topic