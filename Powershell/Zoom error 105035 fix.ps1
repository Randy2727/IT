#Delete file at "path"
#del "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\test.exe"

$path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
$name = "RingCentral Meetings"
$value = [byte]0x03,0x00,0x00,0x00,0xF9,0x92,0xFA,0x8A,0x91,0xBC,0xD7,0x01

Stop-Process -Name "RingC*"

Stop-Service ZoomCptService

Set-ItemProperty -Path $path -Name $name -Value $value -Type Binary

Set-Service ZoomCptService -StartupType Manual

Shutdown /r /t 015




<#
    Hex value for startup enabled - 02 00 00 00 00 00 00 00 00 00 00 00
    Hex value for startup disabled - 03 00 00 00 F9 92 FA 8A 91 BC D7 01
#>