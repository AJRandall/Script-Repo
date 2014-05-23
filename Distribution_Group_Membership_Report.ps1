################################################################################################################
##                                                                                                             #
## Name: Distribution Group Membership Report                                                                  #
## Author: Alex Randall                                                                                        #
## Date: 5/21/2014                                                                                             #
##                                                                                                             #
## Details: Exports all names and memebers of a user input driven Distribution Group                           #
##                                                                                                             #
################################################################################################################

## Ensure you have the AD Module loaded (Only require for PowerShell 2 and lower)
Import-Module ActiveDirectory

## Prompt for the name of the group you want to look up and set as a varible
$GroupInput = Read-Host 'What Distribution Group would you like members exported from?' 

## Pull Distribution Group memeberships, output to a table with name only, then save to a text file
Get-ADGroupMember -Identity "$GroupInput" | Format-Table Name | Out-file C:\DistributionMembers.txt

## Let the user know the report is completed and where it is located
Write-Host 'Your report is in c:\DistriMembers.txt'