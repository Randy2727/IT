New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Zoom'

Start-Sleep -s 3

New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Zoom\Zoom Meetings'

Start-Sleep -s 3

New-Item -Path 'Registry::HKCU\SOFTWARE\Policies\Zoom\Zoom Meetings\General'

Start-Sleep -s 3

New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Zoom\Zoom Meetings\General' -Name EnableClientAutoUpdate -PropertyType DWord -Value $0