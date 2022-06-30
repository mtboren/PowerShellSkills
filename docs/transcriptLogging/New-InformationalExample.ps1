<#  .Description
    Give some examples of informational output using a "helper" function for uniform verbose messages, and emitting reusable objects for subsequent reporting / action

    .Example
    Write-Output user0 otherUser3 | New-InformationalExample.ps1

#>
[CmdletBinding()]param(
    ## Some object upon which to act; a "user" name for this example, just for illustration
    [parameter(ValueFromPipeline=$true, Mandatory=$true)][String[]]$UserName
)

begin {
    $strInfoToPrefix = "[$($MyInvocation.MyCommand.Name)]"
    $dteStartTime = Get-Date
    & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Starting all the goodness"

    function Remove-SomeCoolThing {
        [CmdletBinding()]param ([parameter(Mandatory=$true)][String]$CoolThing)
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

    }
}

process {
    $UserName | ForEach-Object {
        $strThisUserName = $_
        & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Working on item '$strThisUserName'"
        & $PSScriptRoot\Write-VerboseEnhanced.ps1 -Message "$strInfoToPrefix Deleting user '$strThisUserName' from some system"
        ## just for demo purpose, to emulate actual "doing something" kind of timing/duration
        $bRemovedUser = Remove-SomeCoolThing -CoolThing $strThisUserName
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