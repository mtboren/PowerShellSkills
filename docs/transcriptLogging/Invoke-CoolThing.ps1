<#  .Description
    The "parent", overarching orchestration code to invoke the intersting things for our important need

    .Example
    Invoke-CoolThing.ps1 -Verbose
    So as to provide historical visibility and object reusability (via a transcript and emitted, serialize objects), calls the given "do stuff" code
#>
[CmdletBinding()]param()

begin {
    $strStartTranscriptOut = Start-Transcript
    Write-Verbose $strStartTranscriptOut
}

process {
    & $PSScriptRoot\New-InformationalExample.ps1 | ConvertTo-Json | Out-File -FilePath ($strOutFilespec = "$env:temp\deletedUsers-$(Get-Date -Format FileDateTime).json")
    Write-Verbose "Finished doing the things. Serialized objects written to '$strOutFilespec'"
    ## return the fileinfo object for the emitted, serialized objects
    Get-Item $strOutFilespec
}

end {
    $strStopTranscriptOut = Stop-Transcript
    Write-Verbose $strStopTranscriptOut
}