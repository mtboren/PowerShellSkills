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