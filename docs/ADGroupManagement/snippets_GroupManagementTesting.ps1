## Some code snippets for efficiently/effectively managing AD group membership

## get some random words to use for unique group naming
$arr10kbWords = Get-Content C:\temp\words_alpha_10240Total.txt
## in these examples, the objects in this CSV have properties UserId (the user SamAccountName) and GroupId (the group Name)
$strGroupAddInfoFilespec = "c:\temp\myGroupAddsToDo.csv"

## create a couple of test OUs
Write-Output Users, Groups | ForEach-Object {New-ADOrganizationalUnit -Name $_ -Path (Get-ADOrganizationalUnit -Filter {name -eq "Testing"} -SearchScope OneLevel).DistinguishedName} -OutVariable arrTargetOUs
## or, get the already created testing OUs
$arrTargetOUs = Get-ADOrganizationalUnit -Filter * -SearchScope OneLevel -SearchBase (Get-ADOrganizationalUnit -Filter {name -eq "Testing"} -SearchScope OneLevel).DistinguishedName

## create some number of test groups
1..200 | ForEach-Object {New-ADGroup -Name matt_$($arr10kbWords | Get-Random)_toDelete -GroupScope Universal -Path ($arrTargetOUs | Where-Object Name -eq Groups).DistinguishedName -PassThru} -OutVariable arrTestGroups
## or, get the already created test groups
$arrTestGroups = Get-ADGroup -Filter * -SearchBase ($arrTargetOUs | Where-Object Name -eq Groups).DistinguishedName

## create some number of test users
0..9 | ForEach-Object {New-ADUser -Name matt_toDelete_$_ -Path ($arrTargetOUs | Where-Object name -eq Users).DistinguishedName -Verbose -PassThru} -OutVariable arrTestUsers
## or, get the existing test users
$arrTestUsers = Get-ADUser -Filter * -SearchBase ($arrTargetOUs | Where-Object Name -eq Users).DistinguishedName


## make some data file with users and the groups to which to add them (for later group membership management testing)
$arrTestUsers | ForEach-Object {
    $oThisADUser = $_
    $arrTestGroups | Get-Random -Count (Get-Random -Minimum 20 -Maximum $arrTestGroups.Count) | Foreach-Object {
        New-Object -Type PSObject -Property @{
            UserId = $oThisADUser.SamAccountName
            GroupId = $_.Name
        }
    }
} | Export-Csv -Path $strGroupAddInfoFilespec -NoTypeInformation


## add some group members per the config file
Import-Csv -Path $strGroupAddInfoFilespec | Group-Object -Property GroupId | ForEach-Object {
    $GroupID = $_.Name
    ## all the users to add to this AD group
    #    btw, the property "group" here is from Group-Object, not the AD group name
    $UserID = $_.Group.UserID
    Try {Add-ADGroupMember -Identity $GroupID -Members $UserID -ErrorAction SilentlyContinue -Verbose}
    Catch {
        Write-Verbose "Unable to add $UserID to $GroupID" -Verbose
        ## return all of the problem UserId/GroupId objects, for later reporting/use/consumption/whatever
        $_.Group
    }
} -OutVariable ErrorList


## chaos:  remove some users from some groups
Import-Csv -Path $strGroupAddInfoFilespec | Get-Random -Count 15 | Group-Object -Property GroupId | ForEach-Object {
    Get-ADGroup $_.Name | Remove-ADGroupMember -Members $_.Group.UserId -Verbose -Confirm:$false
}


## get info:  are all the users in the desired group membership data file in the desired groups? Return objects w add'l property IsInGroup, and get only the ones not in the desired groups
Import-Csv -Path $strGroupAddInfoFilespec | Group-Object -Property GroupId | ForEach-Object {
    $arrThisADGroupMembers = Get-ADGroup $_.Name | Get-ADGroupMember
    $_.Group | ForEach-Object {$_ | Select-Object *, @{n='IsInGroup'; e={$_.UserId -in $arrThisADGroupMembers.Name}}}
} | Where-Object -not IsInGroup

## same, but also do something w the resultant objects -- add each one to the given group
Import-Csv -Path $strGroupAddInfoFilespec | Group-Object -Property GroupId | ForEach-Object {
    $arrThisADGroupMembers = Get-ADGroup $_.Name | Get-ADGroupMember
    $_.Group | ForEach-Object {$_ | Select-Object *, @{n='IsInGroup'; e={$_.UserId -in $arrThisADGroupMembers.Name}}}
} | Where-Object -not IsInGroup | ForEach-Object {Add-ADGroupMember -Identity $_.GroupId -Members $_.UserId}