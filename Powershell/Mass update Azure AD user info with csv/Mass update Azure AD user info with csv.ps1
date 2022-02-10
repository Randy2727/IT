<#Template for mass updating AAD contact info fields.

Optional) Export existing AAD tenant and modify spreadsheet as needed

1) Fill fields in template spreadsheet (UserPrincipalName is reference field)

2) Run Powershell as admin

3) Install-Module MSOnline (if needed)

4) Connect-MsolService #>

Import-Csv [file path] | ForEach{Set-MsolUser -UserPrincipalName $_.UserPrincipalName -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -Title $_.Title -Department $_.Department -Office $_.Office -MobilePhone $_.MobilePhone -PhoneNumber $_.PhoneNumber -Fax $_.Fax -StreetAddress $_.StreetAddress -City $_.City -State $_.State -PostalCode $_.PostalCode}

<#Documentation:

Fields can be added or removed from the spreadsheet to manipulate other AAD information:

"-FieldName" references the name of the column in the .csv file

"$_.FieldName" references the field name that Powershell is looking for in AAD

ex: ForEach{Set-MsolUser -UserPrincipalName $_.UserPrincipalName -AnythingYouWant  $_.DisplayName} would take the value entered in the AnythingYouWant column and write it to the DisplayName field in AAD. #>