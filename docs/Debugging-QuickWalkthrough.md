# Debugging Itinerary
Some things for a walkthrough to explore debugging PowerShell code.

## What is Debugging?
An approach to help author understand behavior most efficiently / quickly by being able to inspect- and step through code at will.

## How did we used to doit?
Try to understand flow, values, logic, outcomes by using "print" statements everywhere -- `echo`, `Write-Host`, `Write-Verbose`, `Write-Debug`, etc.

## How do we do it now?
Debuggers provide elements we leverage to get to the exact scenario, logic point, state, etc. that we want to inspect. Some of these elements include:

| Debugger Concept | Description |
| ---- | ----------- |
Breakpoints | Pause execution at a specific point and/or condition in the code
Variable inspection | View the value of variables at a specific point in the code
Stepping | Move through the code in controlled fashion. For example, one line at a time, or one function at a time, or until the next breakpoint, etc.
Interactive execution | Run code in the context of the current state of the code
Callstack | the stack of functions / cmdlets that have been called to get to the current point in the code

### In an Integrated Development Environment ("IDE") -- Visual Studio Code
With some PowerShell in an opened file, set a breakpoint, then `Run -> Start Debugging` (or `F5`) the script/function/code.

### In a PowerShell session
`Set-Breakpoint` for some script / line / function / cmdlet / condition, then run the command/script/function. Once the execution hits a given breakpoint, it enters the debugger. Use the debugger commands to inspect, step, continue, quit, etc. See the `about_debuggers` help topic for more information (also linked below).

## How is logging still important?
A quick note about logging (and how it is different from debugging): we still want (need) to provide information about the behavior of our code. This is "logging", for peoples' future reference. Debugging is for the given developer to understand the behavior of the code in the moment.

## Further Reading
- from PowerShell help: [about_debuggers](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_debuggers)
- from Microsoft Learn: [Debugging with Visual Studio Code](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode?#debugging-with-visual-studio-code)
- from VSCode general: [Debugging in Visual Studio Code](https://code.visualstudio.com/docs/editor/debugging)