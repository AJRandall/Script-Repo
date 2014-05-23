#########################################################################################################################################################
## Name: Homeshare Replacement                                                                                                                          #
## Author: Alex Randall                                                                                                                                 #
## Based off of a script found at http://serverfault.com/questions/497778/using-powershell-to-bulk-change-the-home-folder-path-of-ad-objects-username   #
## Date: 5/12/2014                                                                                                                                      #
##                                                                                                                                                      #
## Details: Modifies the homeshare path of a series of objects ina  specific OU.                                                                        #
##          Requires changing the $targetOU varible to the top level of the objects                                                                     #
##          you want to modify.                                                                                                                         #
##                                                                                                                                                      #
#########################################################################################################################################################
#
# Ensure you have the AD Module loaded
Import-Module ActiveDirectory

# Set targetOU varible to set the location for user accounts to be changed from. To do this right-click the OU in AD you want to search in, click
# Properties, and go to the Attribute Editor tab. Find the distinguishedName Attribute.
$targetOU = "OU=Script Testing,OU=Solutions,OU=BSG,OU=Seattle,OU=Parametric,OU=PPA Users,DC=paraport,DC=com"

#Get user accounts in the $targetOU varible and loop the changes through each account setting the home share to the $sam variable
Get-ADUser -Filter * -SearchBase $targetOU | Foreach-Object -Process {
    $sam = $_.SamAccountName
    Set-ADuser -Identity $_ -HomeDrive "H:" -HomeDirectory "\\paraport.com\home share\personal\$sam"
}
#Confirm that the script has completed it's actions
Write-Host "Home Share change Complete"