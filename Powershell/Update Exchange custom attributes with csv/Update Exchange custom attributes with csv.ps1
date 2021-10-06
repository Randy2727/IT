<#
    Script used to import a .csv into exchange online to modify custom atributes for defined users

    This script requires modification to work correctly and a template

    Template is included in repository folder
#>

#Must be connected to ExchangeOnline module as an Exchange administrator or higher

$user_file1 = Import-CSV #Path to CSV

$user_file1 | ForEach 
    {
        Set-mailbox $_.UserPrincipalName #-CustomAttribute1 $_.CustomAttribute1 #-CustomAttribute2 $_.CustomAttribute2
    }

<#
    The above applies to CustomAttribute 1 through 15, as many can be added to the command as needed.

    -FieldName references the heading in the CSV file 
    $_.FieldName references the attribute that powershell is looking for 

    (in the case of my template, these values are identical)
#>