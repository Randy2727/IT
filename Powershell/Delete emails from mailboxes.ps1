<# Start by running a content search from M365 Compliance (compliance.microsoft.com/contentsearchv2)

Review results of search and confirm that they are correct. Be sure, as all this content will be deleted.

Run the commands below separately when you have confirmed the results are correct. 

The content will be soft deleted and is still recoverable for 30 days after the purge has occurred. #>

$SearchName = "Enter name of content search"

New-ComplianceSearchAction -SearchName $SearchName -Purge -PurgeType SoftDelete

#Optional: To get the status of the purge

Get-ComplianceSearchAction ($SearchName + "_purge")