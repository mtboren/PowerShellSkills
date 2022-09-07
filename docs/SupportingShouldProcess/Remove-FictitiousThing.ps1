<#  .Description
    Remove the things as directed by user. Example code to show the use of ShouldProcess and ConfirmImpact for providing -WhatIf support and modifying -Confirm behavior

    .Example
    Get-SomeThingy -MaxSize 30 | Remove-FictitiousThing.ps1
    Get all the thingies over given size, and remove them (prompts for confirmation)

    .Example
    Get-SomeThingy -MaxSize 30 | Remove-FictitiousThing.ps1 -Confirm:$false
    Get all the thingies over given size, and remove them (does _not_ prompt for confirmation)
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = [System.Management.Automation.ConfirmImpact]::High)]
param(
    ## Thing(s) to remove
    [parameter(Mandatory = $true, ValueFromPipeline = $true)][String[]]$Thing
)

process {
    $Thing | Foreach-Object {
        ## the $PSCmdlet.ShouldProcess method is where we can do the conditional things for actions to take based on -WhatIf and -Confirm values
        if ($PSCmdlet.ShouldProcess("Thingy '$_'", "Remove a fictitious thing")) {
            Write-Verbose "Bye bye, '$_'"
        }
    }
}