<#  .Description
    Write verbose messsages with additional, informational prefix

    .Example
    Write-VerboseEnhanced -Message "Some important information"
    Writes a verbose message with a prefix of a date/time stamp, and the script/function from which the verbose message was generated
#>
[CmdletBinding()]
param(
    ## The message to display in the Verbose information stream
    [parameter(Mandatory=$true, ValueFromPipeline=$true)][String]$Message
)

begin {
    ## Some datetime format that results in a string that can be reconsumed as-is via Get-Date (so as to enable reuse / "rehydration" of output)
    $strParsableDateTimeStringFormat = "o"
}

process {
    Write-Verbose -Message ("{0} $Message" -f (Get-Date -Format $strParsableDateTimeStringFormat))
}