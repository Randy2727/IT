Connect to Azure AD with Powershell.

1) Install-Module -Name AzureAD

2) Connect-AzureAD

Connect to Office 365 with Powershell.

1) Install-Module MSOnline

2) Connect-MsolService

Reset Office 365 password - single user

Set-MsolUserPassword -UserPrincipalName [user's name {email address}] -NewPassword [Desired password] -ForceChangePassword $[True/False {requires user to change password on login}]

Reset Office 365 password - all users

Get-MsolUser |%{Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -NewPassword [Desired password] -ForceChangePassword $[True/False {requires user to change password on login}]}