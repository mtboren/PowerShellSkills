# PowerShell Output Streams, Transcripts for Logging
Some information about providing history, insights, and artifacts for posterity:  returning reusable objects, and writing informational messages to existing PowerShell output streams

## What
Consumers of our code need understand outcomes, and to know what is the progress / success / failure of the code

## How
PowerShell provides standard ways to provide such outcomes (in the form of rich objects with pertinent properties) and to provide human-readable output streams, as well
- Outcomes: by providing outcomes in object form, we not only inform customer understanding of actions taken, but also enable subsequent value for use cases like reporting, summation, "undo", etc
- Output streams: PowerShell provides for writing human-targeted text items to places like the PowerShell console and eventually to a transcript file for when a consumer desires to capture such "story" info for posterity. Example:  We can employ the following cmdlets for writing human-readable messages to the various output streams: `Write-Verbose`, `Write-Warning`, `Write-Information`

## What this enables (and avoids)
- Standardization: using same patterns / practices that we use in the rest of our PowerShell world leads to success with minimal additional effort (`Start-Transcript` for log file creation, [PowerShell output streams](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_output_streams) for information messages like verbose, warning streams)
- Parallelization: by using standard "get/create objects" approaches for outcomes and information streams for human-readable messaging, we are well positioned for when we want/need to explore optimization by employing parallel code execution (by avoiding any filesystem management problems altogether -- things that could become problems like file locks introduced with direct file manipulation)
