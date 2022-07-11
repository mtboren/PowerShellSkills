<#  .Description
    Give some examples of informational output using a "helper" function for uniform verbose messages, and emitting reusable objects for subsequent reporting / action

    .Example
    Write-Output user0 otherUser3 | Remove-CoolUser.ps1
    Show example of using PowerShell output streams to return objects (via the Success stream) and informational messagess to other PowerShell output streams (Verbose, Warning)
#>
[CmdletBinding()]param(
    ## Some object upon which to act; a "user" name for this example, just for illustration
    [parameter(ValueFromPipeline=$true, Mandatory=$true)][String[]]$UserName
)

begin {
    $strInfoToPrefix = "[$($MyInvocation.MyCommand.Name)]"
    $dteStartTime = Get-Date
    & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Starting all the goodness"
}

process {
    $UserName | ForEach-Object {
        $strThisUserName = $_
        & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Working on item '$strThisUserName'"
        & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Deleting user '$strThisUserName' from some system"
        ## just for demo purpose, to emulate actual "doing something" kind of timing/duration
        $bRemovedUser = & $PSScriptRoot\Remove-SomeCoolThing -CoolThing $strThisUserName
        ## return an object with properties that show the user, its GUID, the success/failure of removal, and when removed
        #    for "real" implementation, this would have dynamic value for RemovedSuccessfully property based upon actual success
        [pscustomobject][ordered]@{
            User = "$strThisUserName"
            Guid = (New-Guid).Guid
            RemovedSuccessfully = $bRemovedUser
            RemovalDatetime = Get-Date
        }
    }
}

end {
    & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Done. Timespan for this run: '$(New-TimeSpan -Start $dteStartTime)'"
}