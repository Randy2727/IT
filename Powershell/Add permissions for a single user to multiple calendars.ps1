#Grants permission for multiple calendars to a single user

#Define string of users in format $GrantPermission = 'User1@email.com', 'User2@email.com'

#Define user who access is being shared with $AccessUser = 'Access@email.com'

#Define $PermissionLevel, see list below

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

connect-exchangeonline

$GrantPermission = 

$AccessUser = ''

$PermissionLevel = ''

foreach ($user in $GrantPermission)
{
	Add-MailboxFolderPermission -Identity ($user + ':\Calendar') -User $AccessUser -AccessRights $PermissionLevel
}