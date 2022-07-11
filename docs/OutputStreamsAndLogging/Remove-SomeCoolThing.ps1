<#  .Description
    Sample function that shows use of PowerShell output streams for things like verbose and warning output streams, along with the success stream

    .Example
    Remove-SomeCoolThing.ps1 -CoolThing blahhh
    Simulate some code that removes some cool thing

    .Outputs
    Boolean: did this simulated "removal" code result in a simulated removal?
#>
[CmdletBinding()]
param(
    ## Cool thing to remove
    [parameter(Mandatory=$true)][String]$CoolThing
)
begin {
    $strInfoToPrefix = "[$($MyInvocation.MyCommand.Name)]"
}

process {
    & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Removing cool thing '$CoolThing'"
    Start-Sleep -Seconds 0.25
    ## for simulation purposes:  did this "removal" succeed?
    $bRemovalSucceeded = (@($true) * 4), $false | Get-Random
    if (-not $bRemovalSucceeded) {Write-Warning "$strInfoToPrefix D'oh! Failed to remove cool thing '$CoolThing'"}
    $bRemovalSucceeded
}
