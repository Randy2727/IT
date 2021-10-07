<#
	Grants a user access to another user's calendar, returns all permissions for user's calendar, waits 20 seconds, then terminates the session.

    This will not modify an existing permission, only add a new one

    Must be connected to ExchangeOnline module as an Exchange administrator or higher
#>

connect-exchangeonline

$User1 = Read-Host -Prompt "Enter email address of user whose calendar is being shared"
$User2 = Read-Host -Prompt "Enter email address of user is being given access to calendar"
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

Add-MailboxFolderPermission -Identity ${User1}:\calendar -User $User2 -AccessRights $PermissionLevel
#Set-MailboxFolderPermission for changing an existing permission

Start-Sleep -s 2

Get-MailboxFolderPermission -Identity ${User1}:\calendar

Start-Sleep -s 20

$Session = Get-PSSession
$Session | Remove-PSSession