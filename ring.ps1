$coinRunPath = "C:\Users\v1\Desktop\xmrig-6.22.0\coinrun.cmd"

function Start-CoinRun {
  $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru  # Removed -NoNewWindow
  Write-Host "coinrun.cmd đã được khởi động."
}

Start-CoinRun # Start the process initially

while ($true) {
  if ($global:coinRunProcess.HasExited) {
    Write-Warning "coinrun.cmd đã dừng. Khởi động lại..."
    Start-CoinRun # Restart the process
  } else {
    Write-Host "coinrun.cmd đang chạy..."
  }

  Start-Sleep -Seconds 3600
}
