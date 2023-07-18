## from Jeff Brown examples (https://github.com/JeffBrownTech/pester-examples/)
function Get-Something {
    [CmdletBinding()]
    param (
        [string]$ThingToGet = "something"
    )

    Write-Output "I got $ThingToGet!"
}
