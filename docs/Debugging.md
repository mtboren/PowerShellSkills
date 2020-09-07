# PowerShell Debugging
There are plenty of ways to debug in most languages, from code-based write/echo statements, to logging, to using the PowerShell debugger, to third party debuggers that put a UI on the debugging party.

Sections:
- [General Info](#general-information-on-debugging)
- [Light Reading LIst](#light-reading-list)
- [Examples](#examples)

### General Information on Debugging
We can debug in many ways, from echoing statements to using a full-on debugger. For quick / minimal debugging, writing to the console is sometimes helpful. As the code/logic complexity grows beyond the simple, or for when we want to have full visibility to the execution landscape _as the code is running_, we leverage a debugger.

The debugger enables all the actions we want and need for interacting with our code when it is in the desired state (say, when it is producing unexpected behvavior, and we want to most quickly understand why). We use breakpoints to activate the debugger, and can then navigate and inspect our code in its "suspended" state. We use the actions like `stepInto`, `stepOver`, and `stepOut` to traverse code segments of interest, we can inspect variables, test logic with current code iteration state fully intact, etc.  The debugger enables us to most effectively and efficiently get to the bottom of the code of interest.

Some general ways to debug:
- Code-based write/echo statements ("diagnostic statements"): quick, handy for lightweight/informational debug kind of statements. These are a mainstay in some other languages, but can lead to slower development / troubleshooting efforts as we exert energy trying to get the write statements to be useful/helpful. If there is something more involved than just a quick echo, we are often far better suited using the PowerShell debugger
- Logging: a step beyond console output, logging is good for having a historical view of what happened during the execution of a script / program. But, as with echoing things to the console, logging for debugging might be less effective / efficient than we could be just getting straight to the goods via the PowerShell debugger
- PowerShell debugger: available in all versions of PowerShell, this is the most direct and straightforward way to get to the exact point of code execution at which you want to look, with which you want to interact, and that you want to debug. It is accessible in the same PowerShell session with which you are already familiar, and requires no additional setup/software. This, like any proper debugger, allows you to get into the exact state of the running code at the moment you desire, with all variables and state available for inspection.  There is a touch of learning required to get comfortable with the debugger, but [opinion] the small investment makes for the most effective debugging available.
- Other UIs on the PowerShell debugger: For when you are comfortable with concepts of the debugger, and would like an UI for variable "watches" and the callstack (instead of inspecting such things from the command line), you might consider other tools that put a GUI on the debugger, like the premiere (and open source and cross-platform  and fully extensible and cost-free) code editing environment/tool [VisualStudio Code](https://code.visualstudio.com/). Such tools already document their debugging capabilities -- see the corresponding docs for the given tool (like the [Debugging](https://code.visualstudio.com/docs/editor/debugging) section of the VisualStudio Code [User Guide](https://code.visualstudio.com/docs/editor/codebasics))

### Light Reading List
A reading list for things related to PowerShell debugging:
- The PowerShell help for [about_Debugger](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_debugger) (also available in your PowerShell sessions via `Get-Help about_Debuggers`, of course). This covers all the things debugger, covering topics like breakpoints,

### Examples
Some examples of various debugging scenarios

#### Using PowerShell Debugger
Examples:
- [Unexpected Logic Result](#unexpected-logic-result)

##### Unexpected Logic Result
In this example, there is the need to determine why some logic set is returning `$false` instead of the expected `$true`
```PowerShell
## to be written, still
```
