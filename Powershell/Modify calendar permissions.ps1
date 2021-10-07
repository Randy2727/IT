<#
	Grants or modifies a user's access to another user's calendar, returns all permissions for user's calendar, waits 20 seconds, then terminates the session.

    Must be connected to ExchangeOnline module as an Exchange administrator or higher
#>

connect-exchangeonline

$User1 = Read-Host -Prompt "Enter email address of user whose mailbox is being shared"
$User2 = Read-Host -Prompt "Enter email address of user is being given access to mailbox"
$PermissionLevel = Read-Host -Prompt "Enter permission level being granted"

<#
    Permission levels and descriptions:

    Owner — read, create, modify and delete all items and folders. Also this role allows manage items permissions;
    PublishingEditor — read, create, modify and delete items/subfolders;
    Editor — read, create, modify and delete items;
    PublishingAuthor — read, create all items/subfolders. You can modify and delete only items you create;
    Author — create and read items; edit and delete own items NonEditingAuthor – full read access and create items. You can delete only your own items;
    Reviewer — read-only;
    Contributor — create items and folders;
    AvailabilityOnly — read free/busy information from the calendar;
    LimitedDetails - Shows time, subject, and location only
    None — no permissions to access folder and files.
#>

Set-MailboxFolderPermission -Identity ${User1}:\calendar -User $User2 -AccessRights $PermissionLevel
#This may need to be changed back to Add-MailboxFolderPermission

Start-Sleep -s 2

Get-MailboxFolderPermission -Identity ${User1}:\calendar

Start-Sleep -s 20

$Session = Get-PSSession
$Session | Remove-PSSession