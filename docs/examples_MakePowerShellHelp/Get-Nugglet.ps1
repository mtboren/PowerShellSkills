<#  .Description
    Get the important nugglets from the server based on the identity provided (nugglet name, nugglet ID, etc)

	.Synopsis
	Get nugglets

    .Example
    Get-Nugglet
    Get all the nugglets from the connected server

    .Example
    Get-Nugglet -Name myImportantNugg0, otherNugg*
    Get the nugglets of the given names

	.Inputs
	[System.String[]] or $null

	.Outputs
	[Nuggies.Nugglet] object for every nugglet retrieved

    .Link
    New-Nugglet
    Set-Nugglet
    Remove-Nugglet
    See also https://nuggies.com

    .Notes
    Quite a valuable function here -- so much usability in its comment-based help. Can add whatever freeform stuff here.
#>
param(
    ## Name(s) of the nugglet(s) to get. Accepts wildcards
    [String[]]$Name
)

process {
    <# do hot stuff here #>
    if ($PSBoundParameters.ContainsKey("Name")) {
	    $Name | Foreach-Object {Write-Verbose -Verbose "Getting hot nugglet '$_'"}
    } else {Write-Verbose -Verbose "Getting _all_ the hot nugglets!"}
}